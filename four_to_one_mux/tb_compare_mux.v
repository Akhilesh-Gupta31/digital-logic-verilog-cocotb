module tb_compare_mux;
    reg [1:0] s;
    reg [3:0] i;
    wire y_gate, y_case;

    // Original structural (gate-level) version
    four_X_one uut_gate(.s(s), .i(i), .y(y_gate));

    // New behavioral (case) version
    four_X_one_case uut_case(.s(s), .i(i), .y(y_case));

    integer k;
    initial begin
        i = 4'b1011;  // fixed input pattern to select from
        for (k = 0; k < 4; k = k + 1) begin
            s = k;
            #10;
            if (y_gate === y_case)
                $display("PASS: s=%b | gate_y=%b case_y=%b (MATCH)", s, y_gate, y_case);
            else
                $display("FAIL: s=%b | gate_y=%b case_y=%b (MISMATCH)", s, y_gate, y_case);
        end
        $finish;
    end
endmodule
