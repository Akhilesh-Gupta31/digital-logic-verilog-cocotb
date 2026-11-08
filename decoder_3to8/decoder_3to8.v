module decoder_3to8 (
    input  [2:0] din,
    input        en,
    output reg [7:0] dout
);
    always @(*) begin
        dout = 8'b0;              // default: avoids latches
        if (en)
            dout = 8'b1 << (din+1);   // one-hot output
    end
endmodule
