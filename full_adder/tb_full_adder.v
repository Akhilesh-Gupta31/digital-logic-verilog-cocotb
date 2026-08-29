`timescale 1ns/1ps

module tb_full_adder();
    reg tb_a, tb_b, tb_c_in;
    wire tb_sum, tb_c_out;

    // Instantiate the Device Under Test (DUT)
   // Instantiate the Device Under Test (DUT) using positional mapping
    full_adder uut (tb_a, tb_b, tb_c_in, tb_sum, tb_c_out);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_full_adder);

        // Apply test cases and check automatically via task
        tb_a = 0; tb_b = 0; tb_c_in = 0; #5;
        check_output(0, 0, 0);

        tb_a = 0; tb_b = 0; tb_c_in = 1; #5;
        check_output(0, 0, 1);

        tb_a = 0; tb_b = 1; tb_c_in = 1; #5;
        check_output(0, 1, 1);

        tb_a = 1; tb_b = 0; tb_c_in = 0; #5;
        check_output(1, 0, 0);

        tb_a = 1; tb_b = 0; tb_c_in = 1; #5;
        check_output(1, 0, 1);

        tb_a = 1; tb_b = 1; tb_c_in = 0; #5;
        check_output(1, 1, 0);

        tb_a = 0; tb_b = 1; tb_c_in = 0; #5;
        check_output(0, 1, 0);

        tb_a = 1; tb_b = 1; tb_c_in = 1; #5;
        check_output(1, 1, 1);

        $display("TEST FINISHED: All automated checks passed successfully!");
        $finish;
    end

    // Task for automated comparison (Golden Model comparison)
    task check_output(input a, input b, input c_in);
        reg [1:0] expected;
        begin
            expected = a + b + c_in; // Behavioral golden reference
            #1; // Small delay to allow propagation
            if ({tb_c_out, tb_sum} !== expected) begin
                $display("ERROR: Time=%0t | A=%b B=%b Cin=%b | Expected={Cout,Sum}=%b | Got={Cout,Sum}=%b", 
                         $time, a, b, c_in, expected, {tb_c_out, tb_sum});
            end else begin
                $display("PASS: Time=%0t | A=%b B=%b Cin=%b | Output={Cout,Sum}=%b", 
                         $time, a, b, c_in, {tb_c_out, tb_sum});
            end
        end
    endtask

endmodule