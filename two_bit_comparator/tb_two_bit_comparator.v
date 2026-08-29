module tb_two_bit_comparator;
reg [1:0] tb_a;
reg [1:0] tb_b;
wire tb_gt;
wire tb_eq;
wire tb_lo;
two_bit_comparator dut(.a(tb_a),.b(tb_b),.gt(tb_gt),.eq(tb_eq),.lo(tb_lo));
initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_two_bit_comparator);
    $monitor($time,"tb_a=%d,tb_b=%d,tb_gt=%b,tb_eq=%b,tb_lo=%b",$time #10,tb_a,tb_b,tb_gt,tb_eq,tb_lo);
    tb_a=2'b00;
    tb_b=2'b00;
     #10;
    tb_a=2'b01;
    tb_b=2'b00;
     #10;
    tb_a=2'b10;
    tb_b=2'b11;
     #10;
    tb_a=2'b11;
    tb_b=2'b11;
     #10;
    $finish;
end
endmodule