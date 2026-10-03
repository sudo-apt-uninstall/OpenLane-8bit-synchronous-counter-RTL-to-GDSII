// cnt8 - smoke test for SCL CP8D flow bring-up
`timescale 1ns/1ps

module cnt8_top (
    input        clk,
    input        rst_n,
    output [7:0] count
);

reg [7:0] count_r;

always @(posedge clk) begin
    if (!rst_n)
        count_r <= 8'd0;
    else
        count_r <= count_r + 8'd1;
end

assign count = count_r;

endmodule
