module tb_four_X_one;

    reg [1:0] tb_s;
    reg [3:0] tb_i;
    wire tb_y;
    four_X_one dut (.s(tb_s),.i(tb_i),.y(tb_y));

    initial begin
        $monitor($time, " tb_s=%b, tb_i=%b, tb_y=%b", tb_s, tb_i, tb_y);
        tb_i = 4'b1010;
        tb_s = 2'b11;
        #10;
        tb_s = 2'b00;
        #10;
        tb_s = 2'b10;
        #10;
        tb_s = 2'b01;
        #10;

        tb_i = 4'b0101;
        tb_s = 2'b00;
        #10;
        tb_s = 2'b01;
        #10;
        tb_s = 2'b11;
        #10;
        tb_s = 2'b10;
        #10;

        $finish;
    end
endmodule