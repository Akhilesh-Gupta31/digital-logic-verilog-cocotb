module cmos_nand(input a1, input a2,output y);
supply1 vdd;
supply0 gnd;
wire n1;
pmos p1(y, vdd, a1);
pmos p2(y, vdd, a2);
nmos n1_tr(n1, gnd, a2);
nmos n2_tr(y, n1, a1);
endmodule

