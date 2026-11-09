module priority_encoder (
    input  [7:0] din,
    output reg [2:0] dout,
    output reg       valid    // 1 if any input bit is set
);
    always @(*) begin
        valid = 1'b1;
        casez (din)           // first match wins, so the top bit has priority
            8'b01??????: dout = 3'd6;
            8'b1???????: dout = 3'd7;
            8'b001?????: dout = 3'd5;
            8'b0001????: dout = 3'd4;
            8'b00001???: dout = 3'd3;
            8'b000001??: dout = 3'd2;
            8'b0000001?: dout = 3'd1;
            8'b00000001: dout = 3'd0;
            default: begin
                dout  = 3'd0;
                valid = 1'b0; // no input active
            end
        endcase
    end
endmodule
