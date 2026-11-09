module dump;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, priority_encoder);
    end
endmodule
