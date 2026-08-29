module tb_ripple_carry_adder;
reg [3:0] tb_a,tb_b;
reg tb_c_in;
wire [3:0] tb_sum;
wire tb_carry;
ripple_carry_adder dut(.a(tb_a),.b(tb_b),.c_in(tb_c_in),.sum(tb_sum),.carry(tb_carry));
initial
begin
    
    assign tb_a=4'b0101;
    assign tb_b=4'b1010;
    assign tb_c_in=0;
    #5;
    $monitor($time,"tb_a=%b,tb_b=%b,tb_c_in=%b,tb_sum=%b,tb_carry=%b",tb_a,tb_b,tb_c_in,tb_sum,tb_carry);
    assign tb_a=4'b1010;
    assign tb_b=4'b0101;
    assign tb_c_in=0;
    #5;
    $monitor($time,"tb_a=%b,tb_b=%b,tb_c_in=%b,tb_sum=%b,tb_carry=%b",tb_a,tb_b,tb_c_in,tb_sum,tb_carry);
    assign tb_a=4'b0001;
    assign tb_b=4'b1010;
    assign tb_c_in=0;
    #5;
    $monitor($time,"tb_a=%b,tb_b=%b,tb_c_in=%b,tb_sum=%b,tb_carry=%b",tb_a,tb_b,tb_c_in,tb_sum,tb_carry);
end
endmodule