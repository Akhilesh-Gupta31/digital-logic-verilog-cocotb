module tb_for_loop_demo;
    reg [2:0] tb_x;
    wire tb_y;
    integer i;

    for_loop_demo uut(.x(tb_x), .y(tb_y));

    task check_result;
        input [2:0] x_val;
        input y_val;
        begin
            if (y_val === ((x_val[2] & x_val[1]) | x_val[0]))
                $display("PASS: x=%b | y=%b", x_val, y_val);
            else
                $display("FAIL: x=%b | y=%b", x_val, y_val);
        end
    endtask

    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            tb_x = i;
            #10;
            check_result(tb_x, tb_y);
        end
        $finish;
    end
endmodule
