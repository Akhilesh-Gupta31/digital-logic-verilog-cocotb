module bcd(input  [3:0] a,input  [3:0] b,input c_in,output [3:0] sum, output c_out);
    wire [3:0] sum_temp;
    wire       cout_temp;
    wire       a_1, a_2;
    wire [3:0] b_rca_2;
    wire       rca2_cout_dummy;
  ripple_carry_adder rac1(a, b, c_in, sum_temp, cout_temp);
    and a1(a_1, sum_temp[3], sum_temp[2]);
    and a2(a_2, sum_temp[3], sum_temp[1]);
  or o1(c_out, cout_temp, a_1, a_2);
    assign b_rca_2[0] = 1'b0;
    assign b_rca_2[1] = c_out;
    assign b_rca_2[2] = c_out;
    assign b_rca_2[3] = 1'b0;
    ripple_carry_adder rca2(sum_temp, b_rca_2, 1'b0, sum, rca2_cout_dummy);
endmodule