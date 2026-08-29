module cmos_inverter(input in, output out);
supply1 vdd;
supply0 gnd;
pmos p1(out, vdd, in);
nmos n1(out, gnd, in);
endmodule

