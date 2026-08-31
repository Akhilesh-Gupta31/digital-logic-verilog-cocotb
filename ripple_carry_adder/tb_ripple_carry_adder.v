module tb_ripple_carry_adder;
    reg [3:0] tb_a, tb_b;
    reg tb_c_in;
    wire [3:0] tb_sum;
    wire tb_carry;

    ripple_carry_adder dut(.a(tb_a), .b(tb_b), .c_in(tb_c_in), .sum(tb_sum), .carry(tb_carry));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        $monitor("Time=%0t | a=%b b=%b c_in=%b | sum=%b carry=%b",
                   $time, tb_a, tb_b, tb_c_in, tb_sum, tb_carry);

        tb_a = 4'b0101; tb_b = 4'b1010; tb_c_in = 0;
        #10;
        tb_a = 4'b1010; tb_b = 4'b0101; tb_c_in = 0;
        #10;
        tb_a = 4'b0001; tb_b = 4'b1010; tb_c_in = 0;
        #10;
        tb_a = 4'b1111; tb_b = 4'b1111; tb_c_in = 1;  // test overflow/carry case
        #10;

        $finish;
    end
endmodule
