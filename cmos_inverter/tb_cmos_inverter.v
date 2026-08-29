module tb_cmos_inverter;
    reg in;
    wire out;

    cmos_inverter uut(.in(in), .out(out));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;

        in = 0; #10;
        $display("in=%b out=%b", in, out);
        in = 1; #10;
        $display("in=%b out=%b", in, out);

        $finish;
    end
endmodule
