module cnt8_top (clk,
    rst_n,
    count);
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

 INVR00 _30_ (.OUT1(_08_),
    .IN1(rst_n));
 INVR00 _31_ (.OUT1(_09_),
    .IN1(count_r[6]));
 AND200 _32_ (.OUT1(_00_),
    .IN1(_29_[0]),
    .IN2(rst_n));
 ORND00 _33_ (.OUT1(_10_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(rst_n));
 ADNR00 _34_ (.OUT1(_01_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(_10_));
 AND300 _35_ (.OUT1(_11_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]));
 ADNR00 _36_ (.OUT1(_12_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]));
 NOR300 _37_ (.OUT1(_02_),
    .IN1(_08_),
    .IN2(_11_),
    .IN3(_12_));
 AND400 _38_ (.OUT1(_13_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]),
    .IN4(count_r[3]));
 ORND00 _39_ (.OUT1(_14_),
    .IN1(count_r[3]),
    .IN2(_11_),
    .IN3(rst_n));
 NOR200 _40_ (.OUT1(_03_),
    .IN1(_13_),
    .IN2(_14_));
 AND500 _41_ (.OUT1(_15_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]),
    .IN4(count_r[3]),
    .IN5(count_r[4]));
 ORND00 _42_ (.OUT1(_16_),
    .IN1(count_r[4]),
    .IN2(_13_),
    .IN3(rst_n));
 NOR200 _43_ (.OUT1(_04_),
    .IN1(_15_),
    .IN2(_16_));
 NND600 _44_ (.OUT1(_17_),
    .IN1(count_r[0]),
    .IN2(count_r[1]),
    .IN3(count_r[2]),
    .IN4(count_r[3]),
    .IN5(count_r[4]),
    .IN6(count_r[5]));
 OR2100 _45_ (.OUT1(_18_),
    .IN1(count_r[5]),
    .IN2(_15_));
 AND300 _46_ (.OUT1(_05_),
    .IN1(rst_n),
    .IN2(_17_),
    .IN3(_18_));
 XNR200 _47_ (.OUT1(_19_),
    .IN1(_09_),
    .IN2(_17_));
 NOR200 _48_ (.OUT1(_06_),
    .IN1(_08_),
    .IN2(_19_));
 ORND00 _49_ (.OUT1(_20_),
    .IN1(_09_),
    .IN2(_17_),
    .IN3(count_r[7]));
 OR3100 _50_ (.OUT1(_21_),
    .IN1(_09_),
    .IN2(count_r[7]),
    .IN3(_17_));
 ADNR00 _51_ (.OUT1(_07_),
    .IN1(_20_),
    .IN2(_21_),
    .IN3(_08_));
 DFFL11 _52_ (.Q(count_r[0]),
    .C(clknet_1_1__leaf_clk),
    .D(_00_),
    .QB(_29_[0]));
 DFFL11 _53_ (.Q(count_r[1]),
    .C(clknet_1_1__leaf_clk),
    .D(_01_),
    .QB(_28_));
 DFFL11 _54_ (.Q(count_r[2]),
    .C(clknet_1_1__leaf_clk),
    .D(_02_),
    .QB(_27_));
 DFFL11 _55_ (.Q(count_r[3]),
    .C(clknet_1_1__leaf_clk),
    .D(_03_),
    .QB(_26_));
 DFFL11 _56_ (.Q(count_r[4]),
    .C(clknet_1_0__leaf_clk),
    .D(_04_),
    .QB(_25_));
 DFFL11 _57_ (.Q(count_r[5]),
    .C(clknet_1_0__leaf_clk),
    .D(_05_),
    .QB(_24_));
 DFFL11 _58_ (.Q(count_r[6]),
    .C(clknet_1_0__leaf_clk),
    .D(_06_),
    .QB(_23_));
 DFFL11 _59_ (.Q(count_r[7]),
    .C(clknet_1_0__leaf_clk),
    .D(_07_),
    .QB(_22_));
 INVR00 clkbuf_0_clk (.OUT1(clknet_0_clk),
    .IN1(clk));
 INVR00 clkbuf_1_0__f_clk (.OUT1(clknet_1_0__leaf_clk),
    .IN1(clknet_0_clk));
 INVR00 clkbuf_1_1__f_clk (.OUT1(clknet_1_1__leaf_clk),
    .IN1(clknet_0_clk));
 assign count[0] = count_r[0];
 assign count[1] = count_r[1];
 assign count[2] = count_r[2];
 assign count[3] = count_r[3];
 assign count[4] = count_r[4];
 assign count[5] = count_r[5];
 assign count[6] = count_r[6];
 assign count[7] = count_r[7];
endmodule
