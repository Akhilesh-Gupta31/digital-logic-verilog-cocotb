module ripple_carry_adder_gen(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] sum,
    output carry
);
    wire [4:0] carry_chain;
    assign carry_chain[0] = c_in;
    assign carry = carry_chain[4];
genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin : gen_loop
        full_adder fa_inst(a[i], b[i], carry_chain[i], sum[i], carry_chain[i+1]);
    end
endgenerate
endmodule
