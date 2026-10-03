module cnt8_top (GROUND,
    VDD,
    clk,
    rst_n,
    count);
 input GROUND;
 input VDD;
 input clk;
 input rst_n;
 output [7:0] count;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;
 wire [0:0] _29_;
 wire [7:0] count_r;

 FILLER4 FILLER0_0_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_0_123 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_0_139 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_0_147 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_0_151 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_0_24 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_0_37 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_0_4 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_0_45 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_0_49 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_0_57 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_0_69 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_0_74 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_0_82 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_0_84 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_0_9 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_0_91 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_10_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_10_12 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_10_121 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_10_17 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_10_25 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_10_57 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_10_8 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_10_89 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_12_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_12_128 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_12_144 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_12_152 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_12_32 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_12_64 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_12_96 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_14_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_14_128 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_14_144 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_14_152 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_14_32 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_14_64 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_14_96 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_16_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_16_128 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_16_144 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_16_152 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_16_32 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_16_64 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_16_96 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_18_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_18_128 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_18_144 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_18_152 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_18_32 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_18_64 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_18_96 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_20_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_20_128 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_20_144 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_20_152 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_20_32 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_20_64 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_20_96 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_22_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_22_128 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_22_144 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_22_152 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_22_32 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_22_64 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_22_96 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_2_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_2_108 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_2_140 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_2_148 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_2_152 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_2_8 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_2_82 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_2_84 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_4_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_4_100 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_4_132 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_4_148 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_4_152 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_4_16 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_4_25 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_4_41 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_4_45 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_4_50 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_4_58 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_4_68 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_6_0 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_6_12 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_6_127 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_6_143 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_6_151 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_6_29 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_6_45 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_6_49 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_6_70 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_6_78 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_6_8 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_6_95 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER2 FILLER0_8_122 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_8_138 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_8_146 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_8_150 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_8_152 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_8_22 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER5 FILLER0_8_46 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_8_51 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER3 FILLER0_8_71 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER4 FILLER0_8_79 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER6 FILLER0_8_83 (.GROUND(GROUND),
    .VDD(VDD));
 FILLER1 FILLER0_8_90 (.GROUND(GROUND),
    .VDD(VDD));
 INVR00 _30_ (.GROUND(GROUND),
    .OUT1(_08_),
    .IN1(rst_n),
    .VDD(VDD));
 INVR00 _31_ (.GROUND(GROUND),
    .OUT1(_09_),
    .IN1(count_r[6]),
    .VDD(VDD));
 AND200 _32_ (.GROUND(GROUND),
    .OUT1(_00_),
    .IN1(_29_[0]),
    .IN2(rst_n),
    .VDD(VDD));
 ORND00 _33_ (.GROUND(GROUND),
    .OUT1(_10_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(rst_n),
    .VDD(VDD));
 ADNR00 _34_ (.GROUND(GROUND),
    .OUT1(_01_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(_10_),
    .VDD(VDD));
 AND300 _35_ (.GROUND(GROUND),
    .OUT1(_11_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]),
    .VDD(VDD));
 ADNR00 _36_ (.GROUND(GROUND),
    .OUT1(_12_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]),
    .VDD(VDD));
 NOR300 _37_ (.GROUND(GROUND),
    .OUT1(_02_),
    .IN1(_08_),
    .IN2(_11_),
    .IN3(_12_),
    .VDD(VDD));
 AND400 _38_ (.GROUND(GROUND),
    .OUT1(_13_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]),
    .IN4(count_r[3]),
    .VDD(VDD));
 ORND00 _39_ (.GROUND(GROUND),
    .OUT1(_14_),
    .IN1(count_r[3]),
    .IN2(_11_),
    .IN3(rst_n),
    .VDD(VDD));
 NOR200 _40_ (.GROUND(GROUND),
    .OUT1(_03_),
    .IN1(_13_),
    .IN2(_14_),
    .VDD(VDD));
 AND500 _41_ (.GROUND(GROUND),
    .OUT1(_15_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]),
    .IN4(count_r[3]),
    .IN5(count_r[4]),
    .VDD(VDD));
 ORND00 _42_ (.GROUND(GROUND),
    .OUT1(_16_),
    .IN1(count_r[4]),
    .IN2(_13_),
    .IN3(rst_n),
    .VDD(VDD));
 NOR200 _43_ (.GROUND(GROUND),
    .OUT1(_04_),
    .IN1(_15_),
    .IN2(_16_),
    .VDD(VDD));
 NND600 _44_ (.GROUND(GROUND),
    .OUT1(_17_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]),
    .IN4(count_r[3]),
    .IN5(count_r[4]),
    .IN6(count_r[5]),
    .VDD(VDD));
 OR2100 _45_ (.GROUND(GROUND),
    .OUT1(_18_),
    .IN1(count_r[5]),
    .IN2(_15_),
    .VDD(VDD));
 AND300 _46_ (.GROUND(GROUND),
    .OUT1(_05_),
    .IN1(rst_n),
    .IN2(_17_),
    .IN3(_18_),
    .VDD(VDD));
 XNR200 _47_ (.GROUND(GROUND),
    .OUT1(_19_),
    .IN1(_09_),
    .IN2(_17_),
    .VDD(VDD));
 NOR200 _48_ (.GROUND(GROUND),
    .OUT1(_06_),
    .IN1(_08_),
    .IN2(_19_),
    .VDD(VDD));
 ORND00 _49_ (.GROUND(GROUND),
    .OUT1(_20_),
    .IN1(_09_),
    .IN2(_17_),
    .IN3(count_r[7]),
    .VDD(VDD));
 OR3100 _50_ (.GROUND(GROUND),
    .OUT1(_21_),
    .IN1(_09_),
    .IN2(count_r[7]),
    .IN3(_17_),
    .VDD(VDD));
 ADNR00 _51_ (.GROUND(GROUND),
    .OUT1(_07_),
    .IN1(_20_),
    .IN2(_21_),
    .IN3(_08_),
    .VDD(VDD));
 DFFL11 _52_ (.Q(count_r[0]),
    .GROUND(GROUND),
    .C(clknet_1_1__leaf_clk),
    .D(_00_),
    .QB(_29_[0]),
    .VDD(VDD));
 DFFL11 _53_ (.Q(count_r[1]),
    .GROUND(GROUND),
    .C(clknet_1_1__leaf_clk),
    .D(_01_),
    .QB(_28_),
    .VDD(VDD));
 DFFL11 _54_ (.Q(count_r[2]),
    .GROUND(GROUND),
    .C(clknet_1_1__leaf_clk),
    .D(_02_),
    .QB(_27_),
    .VDD(VDD));
 DFFL11 _55_ (.Q(count_r[3]),
    .GROUND(GROUND),
    .C(clknet_1_1__leaf_clk),
    .D(_03_),
    .QB(_26_),
    .VDD(VDD));
 DFFL11 _56_ (.Q(count_r[4]),
    .GROUND(GROUND),
    .C(clknet_1_0__leaf_clk),
    .D(_04_),
    .QB(_25_),
    .VDD(VDD));
 DFFL11 _57_ (.Q(count_r[5]),
    .GROUND(GROUND),
    .C(clknet_1_0__leaf_clk),
    .D(_05_),
    .QB(_24_),
    .VDD(VDD));
 DFFL11 _58_ (.Q(count_r[6]),
    .GROUND(GROUND),
    .C(clknet_1_0__leaf_clk),
    .D(_06_),
    .QB(_23_),
    .VDD(VDD));
 DFFL11 _59_ (.Q(count_r[7]),
    .GROUND(GROUND),
    .C(clknet_1_0__leaf_clk),
    .D(_07_),
    .QB(_22_),
    .VDD(VDD));
 INVR00 clkbuf_0_clk (.GROUND(GROUND),
    .OUT1(clknet_0_clk),
    .IN1(clk),
    .VDD(VDD));
 INVR00 clkbuf_1_0__f_clk (.GROUND(GROUND),
    .OUT1(clknet_1_0__leaf_clk),
    .IN1(clknet_0_clk),
    .VDD(VDD));
 INVR00 clkbuf_1_1__f_clk (.GROUND(GROUND),
    .OUT1(clknet_1_1__leaf_clk),
    .IN1(clknet_0_clk),
    .VDD(VDD));
 assign count[0] = count_r[0];
 assign count[1] = count_r[1];
 assign count[2] = count_r[2];
 assign count[3] = count_r[3];
 assign count[4] = count_r[4];
 assign count[5] = count_r[5];
 assign count[6] = count_r[6];
 assign count[7] = count_r[7];
endmodule
