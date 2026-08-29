module tb_bcd;
reg [3:0]tb_a;
reg [3:0]tb_b;
reg tb_c_in;
wire [3:0]tb_sum;
wire tb_c_out;
bcd dut(.a(tb_a),.b(tb_b),.c_in(tb_c_in),.sum(tb_sum),.c_out(tb_c_out));
initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_bcd);
    $monitor($time,"tb_a=%d, tb_b=%d, tb_c_in=%b, tb_sum=%d, tb_c_out=%b", tb_a,tb_b,tb_c_in,tb_sum,tb_c_out);
    tb_a=4'd3; tb_b=4'd4; tb_c_in=1'b0; #10;
    if (tb_sum !== 4'd7 || tb_c_out !== 1'b0) 
    begin
        $display("FAIL at Test 1: Expected Sum=7, Cout=0 | Got Sum=%d, Cout=%b", tb_sum, tb_c_out);
        $finish;
    end
    tb_a=4'd5; tb_b=4'd7; tb_c_in=1'b0; #10;
    if (tb_sum !== 4'd2 ||tb_c_out  !== 1'b1) 
    begin
        $display("FAIL at Test 2: Expected Sum=2, Cout=1 | Got Sum=%d, Cout=%b", tb_sum, tb_c_out);
        $finish;
    end
    tb_a=4'd8; tb_b=4'd9; tb_c_in=1'b0; #10;
    if (tb_sum !== 4'd7 || tb_c_out !== 1'b1)
     begin
        $display("FAIL at Test 3: Expected Sum=7, Cout=1 | Got Sum=%d, Cout=%b", tb_sum, tb_c_out);
        $finish;
    end
    tb_a=4'd9; tb_b=4'd9; tb_c_in=1'b1; #10;
    if (tb_sum !== 4'd9 || tb_c_out !== 1'b1) 
    begin
        $display("FAIL at Test 4: Expected Sum=9, Cout=1 | Got Sum=%d, Cout=%b", tb_sum, tb_c_out);
        $finish;
    end

    $display("SUCCESS: All BCD test cases passed automatically!");
    $finish;
end
endmodule
