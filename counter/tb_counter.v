module tb_counter;
    reg tb_clk;
    reg tb_rst;
    wire [3:0] tb_count;
    reg [3:0] expected_count;
    integer i;

    counter uut(.clk(tb_clk), .rst(tb_rst), .count(tb_count));

    always #5 tb_clk = ~tb_clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_counter);

        tb_clk = 0;
        expected_count = 0;
        tb_rst = 1;
        #10;
        if (tb_count === 0 && expected_count === 0)
            $display("PASS: Reset | count=%d expected=%d", tb_count, expected_count);
        else
            $display("FAIL: Reset | count=%d expected=%d", tb_count, expected_count);

        tb_rst = 0;

        for (i = 0; i < 20; i = i + 1) begin
            #10;
            expected_count = expected_count + 1;
            if (tb_count === expected_count)
                $display("PASS: i=%0d | count=%d expected=%d", i, tb_count, expected_count);
            else
                $display("FAIL: i=%0d | count=%d expected=%d", i, tb_count, expected_count);
        end

        $finish;
    end
endmodule
