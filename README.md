# 8-bit Synchronous Counter — RTL to GDSII on SCL 0.8 µm

A complete open-source digital implementation flow: Verilog RTL taken all the way to a
manufacturable GDSII layout on the **Semi-Conductor Laboratory (SCL) 0.8 µm open PDK**,
with **zero DRC violations**, **LVS matched**, and **timing closed**.

| | |
|---|---|
| **Design** | 8-bit synchronous binary up-counter, modulo-256 |
| **Process** | SCL CP8D — 0.8 µm, 5 V, twin-tub, single-poly, **2 metal layers** |
| **Flow** | OpenLane 1.0 · Yosys · OpenROAD · OpenSTA · OpenRCX · KLayout |
| **Result** | 30 standard cells · 800 × 800 µm die · **0 DRC** · **LVS match** · ~120 MHz |

---

## The design

```verilog
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
```

An 8-bit **synchronous** binary up-counter — every flip-flop shares one clock edge,
unlike a ripple counter where each stage clocks the next. Counts 0 → 255 and wraps.
Reset is **synchronous** and active-low: it is sampled on the clock edge rather than
applied independently of it.

---

## Results

### Synthesis — 30 standard cells

| Cell | Count | Function |
|---|---|---|
| `DFFL11` | 8 | D flip-flop, buffered clock and outputs — one per bit |
| `ORND00` | 4 | 2-input OR into 2-input NAND |
| `NOR200` | 3 | 2-input NOR |
| `ADNR00` | 3 | 2-input AND into 2-input NOR |
| `INVR00` | 2 | inverter (4 unit loads) |
| `AND300` | 2 | 3-input AND |
| `XNR200`, `OR3100`, `OR2100`, `NOR300`, `NND600`, `AND500`, `AND400`, `AND200` | 1 each | carry chain and toggle logic |

**Why these cells.** Bit *n* of a counter toggles when every bit below it is 1, so the
increment needs the AND of progressively more bits — which is exactly the
`AND200`/`AND300`/`AND400`/`AND500`/`NND600` progression, with `XNR200` performing the
toggle itself.

The synthesiser did **not** use the library's `ADR100` full adder. With one operand
being the constant 1, a full adder would have most of its logic hardwired, so plain
gates are cheaper. The reset was folded into the combinational next-state logic
(`ORND00`/`ADNR00`/`NOR200`), which is why plain `DFFL11` flops were chosen over the
`DFCL11` clear variant.

### Physical implementation

| Stage | Output | Result |
|---|---|---|
| Floorplan | `cnt8.def` | 12 placement rows, die `(0,0)–(800,800)` µm |
| Power grid | `cnt8_pdn.def` | core ring + rails on metal1/metal2 |
| Placement | `cnt8_pl.def` | 45 % target density |
| CTS | `cnt8_plcts.def` | TritonCTS clock tree |
| Routing | `cnt8_rt.def` | **`drc.rpt` 0 bytes — no violations** |
| Extraction | `cnt8_rt.spef` | OpenRCX parasitics |
| STA | `timing_report.txt` | **wns 0.00 · tns 0.00** |
| GDSII | `cnt8_top.gds` | final layout |

### Signoff — both clean

**DRC** — KLayout with SCL's `drc.lydrc` deck, 5 nm grid. The deck covers roughly 70
rule categories: nwell width and spacing, n/p-diffusion width and spacing, poly width,
spacing and gate extension, NMOS/PMOS channel length and area, boron implant rules,
contact size, spacing and enclosure, metal1 and metal2 width, spacing and via
enclosure, bonding-pad clearances, plus SCL guideline checks for floating gates,
well-tap distance and vias on diffusion edges.

**Every category returned empty — zero violations.**

**LVS** — KLayout with SCL's `lvs.lylvs`, deep mode:

```
Netlist file: cnt8_top.cdl
Extracted netlist file: cnt8_top_extracted.cir
LVS Total Run time 0.491745 seconds
==========================================
INFO : Congratulations! Netlists match.
==========================================
```

The layout extracted from the GDSII is electrically identical to the netlist produced
by place-and-route.

### Timing

Clock constrained at 100 ns (a deliberately relaxed placeholder). Both checks met:

**Setup — slack +91.72 ns**
```
Startpoint: _53_ (DFFL11, clocked by CLK)
Endpoint:   _58_ (DFFL11, clocked by CLK)

   0.00    0.00 ^ _53_/C     (DFFL11)
   2.80    2.80 v _53_/Q     (DFFL11)
   2.50    5.31 ^ _44_/OUT1  (NND600)
   1.83    7.14 ^ _47_/OUT1  (XNR200)
   0.78    7.93 v _48_/OUT1  (NOR200)
           7.93   data arrival time
          99.65   data required time
          91.72   slack (MET)
```

**Hold — slack +2.84 ns**

**Real maximum frequency.** The critical path is 7.93 ns of logic plus 0.35 ns of
setup, so the minimum period is about **8.28 ns ⇒ roughly 120 MHz** on this process.

A notable measurement: the 6-input NAND (`NND600`) alone accounts for **2.50 ns** —
nearly a third of the critical path. At 0.8 µm with a 5 V swing, a six-transistor
series NMOS stack is genuinely slow, which is a useful piece of intuition for sizing
wide gates on older nodes.

---

## Repository layout

```
rtl/cnt8.v                      RTL source
tb/tb_cnt8.v                    self-checking testbench
config/config.json              OpenLane configuration
config/pin_order.cfg            pin placement by die edge
flow/*.tcl                      floorplan, PDN, placement, CTS, routing, RCX, STA
results/synthesis/              gate-level netlist
results/floorplan/              floorplan and power-grid DEF
results/placement/              placed DEF
results/cts/                    post-CTS DEF
results/routing/                routed DEF, DRC report, simulation netlists
results/spef/                   extracted parasitics
results/sta/                    timing reports and SDF
results/gds/                    GDSII, CDL, DRC report, LVS database
docs/images/                    layout screenshots
```

---

## Reproducing

Requires OpenLane 1.0, the SCL CP8D PDK, KLayout 0.30.5 and Icarus Verilog.

```bash
# host: load environment and enter the OpenLane container
source scl.bash
make -C ~/OpenLane mount PDK_ROOT="$PDK_ROOT" PDK=scl_cp8d

# in the container
cd /openlane
./flow.tcl -design project_scl_cp8d/smoke -tag RUN -interactive

run_yosys_script    $::env(DESIGN_DIR)/3_src/yosys_script.tcl
run_openroad_script $::env(DESIGN_DIR)/3_src/floorplan_cp8d.tcl
run_openroad_script $::env(DESIGN_DIR)/3_src/pdn_cp8d.tcl
run_openroad_script $::env(DESIGN_DIR)/3_src/placement_cp8d.tcl
run_openroad_script $::env(DESIGN_DIR)/3_src/cts_cp8d.tcl
run_openroad_script $::env(DESIGN_DIR)/3_src/routing_cp8d.tcl
run_openroad_script $::env(DESIGN_DIR)/3_src/rcx_cp8d.tcl
run_openroad_script $::env(DESIGN_DIR)/3_src/run_sta.tcl

# host: DEF to GDSII, then DRC and LVS in KLayout
cd ~/OpenLane/designs/project_scl_cp8d/smoke/5_klayout
source cdl_gds_script.source
```

### Implementation notes

**Site height.** SCL's `tech_cp8d.lef` declares the CORE site as 25.35 µm tall while
`digital_cp8d/config.tcl` sets `PLACE_SITE_HEIGHT` to 32.35 µm, which matches the
datasheets. SCL's `floorplan_cp8d.tcl` resolves this by deleting every second
placement row, which is why a 600 µm core yields 12 rows rather than 23.

**Clock tree.** SCL's documentation warns that TritonCTS can fail on purely
combinational designs, which must run `filler_placement.tcl` instead. A counter is
sequential, so the standard CTS path applies.

**Benign warnings during GDS conversion.** `FOREIGN name SPAD00 differs from MACRO
ASPAD00` is an inconsistency inside SCL's pad LEF (no pads are instantiated here), and
`No mapping for purpose 'OUTLINE'` refers to a cosmetic DEF layer with no GDS
equivalent. The LVS log also announces a "SCL C1D" runset while running on CP8D —
stale header text in SCL's script, not the wrong deck.

---

## Tools

| Tool | Version | Role |
|---|---|---|
| OpenLane | 1.0.2 | flow orchestration |
| Yosys | 0.9 | logic synthesis |
| OpenROAD | bundled | floorplan, PDN, placement, CTS, routing |
| OpenSTA | bundled | static timing analysis |
| OpenRCX | bundled | parasitic extraction |
| KLayout | 0.30.5 | DEF→GDS, signoff DRC and LVS |
| Icarus Verilog | 12.0 | simulation |

## Acknowledgements

Process design kit by **Semi-Conductor Laboratory (SCL), Mohali**, distributed through
the **echiphub.in** open-source PDK programme with **NIELIT**. The PDK itself is not
redistributed in this repository and must be obtained from echiphub.

The flow scripts under `flow/` are SCL's reference scripts, included for
reproducibility.
