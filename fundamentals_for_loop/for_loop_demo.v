module for_loop_demo(input [2:0] x, output y);
    assign y = (x[2] & x[1]) | x[0];
endmodule
