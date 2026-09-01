module tb_dff;
reg tb_clk,tb_rst,tb_d;
wire tb_qbar, tb_q;
dff uut(.clk(tb_clk), .rst(tb_rst), .d(tb_d), .q(tb_q), .qbar(tb_qbar));
always #5 tb_clk=~tb_clk;
initial
begin
tb_clk=0;
$dumpfile("dump.vcd");
$dumpvars(0,tb_dff);
$monitor("Time=%0t | clk=%b rst=%b d=%b | q=%b qbar=%b",
                   $time, tb_clk, tb_rst, tb_d, tb_q, tb_qbar);
tb_rst=1;
tb_d=1;
#10;
tb_rst=0;
tb_d=0;
#10;
tb_d=0;
#10;
tb_d=0;
#2;
tb_d=1;
#8;
$finish;
end
 endmodule

