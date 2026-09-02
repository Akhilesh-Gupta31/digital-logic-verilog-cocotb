module tb_for_loop_demo;
reg [2:0] tb_x;
wire tb_y;
for_loop_demo uut(.x(tb_x), .y(tb_y));
integer i;
initial begin
for(i=0;i<8;i=i+1) begin
tb_x=i;
#10;
if (tb_y === ((tb_x[2] & tb_x[1]) | tb_x[0]))
    $display("PASS: x=%b | y=%b", tb_x, tb_y);
else
    $display("FAIL: x=%b | y=%b", tb_x, tb_y);
end
$finish;
end
endmodule

