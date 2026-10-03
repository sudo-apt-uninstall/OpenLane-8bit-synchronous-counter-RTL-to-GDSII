//=====================================================================
// tb_cnt8.v  -  self-checking testbench for the 8-bit synchronous
//               counter
//
//   Checks:
//     1. reset drives the count to 0
//     2. the count increments by exactly 1 each clock
//     3. the count wraps 255 -> 0
//     4. reset applied mid-count returns to 0
//
//   Run (RTL):
//     iverilog -o tb.vvp tb_cnt8.v ../rtl/cnt8.v
//     vvp tb.vvp
//     gtkwave tb_cnt8.vcd
//
//   Run (gate level, against the routed netlist):
//     iverilog -gspecify -o tb_gl.vvp \
//         $PDK_ROOT/$PDK/libs.ref/digital_cp8d/verilog/cp8d.v \
//         ../results/routing/cnt8_rt_sim.v tb_cnt8.v
//     vvp tb_gl.vvp
//
//   Note: -gspecify is required or Icarus silently discards the
//   specify-block path delays in the cell models.
//=====================================================================

`timescale 1ns/1ps

module tb_cnt8;

    reg        clk   = 1'b0;
    reg        rst_n = 1'b0;
    wire [7:0] count;

    integer errors   = 0;
    integer i;
    reg [7:0] expected;

    //-----------------------------------------------------------------
    // Device under test
    //-----------------------------------------------------------------
    cnt8_top uut (
        .clk   (clk),
        .rst_n (rst_n),
        .count (count)
    );

    //-----------------------------------------------------------------
    // 10 MHz clock - 100 ns period, matching CLOCK_PERIOD in config.json
    //-----------------------------------------------------------------
    always #50 clk = ~clk;

    //-----------------------------------------------------------------
    // Checking task
    //-----------------------------------------------------------------
    task check;
        input [7:0] got;
        input [7:0] want;
        input [127:0] label;
        begin
            if (got !== want) begin
                $display("FAIL  %0s : expected %0d, got %0d  (t=%0t)",
                         label, want, got, $time);
                errors = errors + 1;
            end
        end
    endtask

    //-----------------------------------------------------------------
    // Stimulus
    //-----------------------------------------------------------------
    initial begin
        $dumpfile("tb_cnt8.vcd");
        $dumpvars(0, tb_cnt8);

        $display("=== cnt8 testbench ===");

        // ---- 1. reset ------------------------------------------------
        rst_n = 1'b0;
        @(posedge clk);
        @(posedge clk);
        #1;
        check(count, 8'd0, "reset clears count");

        // ---- 2. release reset, count up ------------------------------
        rst_n = 1'b1;
        expected = 8'd0;

        for (i = 0; i < 300; i = i + 1) begin
            @(posedge clk);
            #1;
            expected = expected + 8'd1;
            check(count, expected, "increment");
        end

        // 300 cycles from 0 covers the 255 -> 0 wrap and then some
        $display("INFO  wrap-around exercised (300 cycles, count = %0d)", count);

        // ---- 3. reset mid-count --------------------------------------
        rst_n = 1'b0;
        @(posedge clk);
        #1;
        check(count, 8'd0, "mid-count reset");

        rst_n = 1'b1;
        @(posedge clk);
        #1;
        check(count, 8'd1, "resume after reset");

        // ---- summary -------------------------------------------------
        $display("======================================");
        if (errors == 0)
            $display("PASS  all checks passed");
        else
            $display("FAIL  %0d error(s)", errors);
        $display("======================================");

        $finish;
    end

endmodule
