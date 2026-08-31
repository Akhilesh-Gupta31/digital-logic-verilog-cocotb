module tb_cmos_nand;
reg a,b;
wire out;
cmos_nand uut(.a1(a), .a2(b), .y(out));
initial begin
$dumpfile("dump.vcd");
$dumpvars;
$monitor("Time=%0t | a=%b b=%b | out=%b", $time, a, b, out);

        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;

        $finish;
    end
endmodule
