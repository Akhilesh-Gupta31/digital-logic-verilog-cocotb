module tb_compare_rca;
    reg [3:0] a, b;
    reg c_in;
    wire [3:0] sum_orig, sum_gen;
    wire carry_orig, carry_gen;

    // Original hand-written version
    ripple_carry_adder uut_orig(.a(a), .b(b), .c_in(c_in), .sum(sum_orig), .carry(carry_orig));

    // Generate-block based version
    ripple_carry_adder_gen uut_gen(.a(a), .b(b), .c_in(c_in), .sum(sum_gen), .carry(carry_gen));

    integer k;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_compare_rca);

        c_in = 0;
        for (k = 0; k < 16; k = k + 1) begin
            a = k;
            b = 4'b1010;  // fixed test pattern
            #10;
            if (sum_orig === sum_gen && carry_orig === carry_gen)
                $display("PASS: a=%d b=%d | orig: sum=%d carry=%b | gen: sum=%d carry=%b",
                           a, b, sum_orig, carry_orig, sum_gen, carry_gen);
            else
                $display("FAIL: a=%d b=%d | orig: sum=%d carry=%b | gen: sum=%d carry=%b",
                           a, b, sum_orig, carry_orig, sum_gen, carry_gen);
        end

        $finish;
    end
endmodule
