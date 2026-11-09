module alu (
    input  [3:0] a,
    input  [3:0] b,
    input  [2:0] op,
    output reg [3:0] result,
    output reg       carry,   // carry out (ADD), borrow (SUB), bit shifted out (shifts)
    output           zero
);
    reg [4:0] tmp;

    always @(*) begin
        tmp = 5'b0;                          // defaults avoid latches
        case (op)
            3'b000: tmp = {1'b0, a} + {1'b0, b};   // ADD
            3'b001: tmp = {1'b0, a} - {1'b0, b};   // SUB (bit 4 = borrow)
            3'b010: tmp = {1'b0, a & b};           // AND
            3'b011: tmp = {1'b0, a | b};           // OR
            3'b100: tmp = {1'b0, a ^ b};           // XOR
            3'b101: tmp = {1'b0, ~a};              // NOT A
            3'b110: tmp = {a, 1'b0};               // SHL: carry = a[3]
            3'b111: tmp = {a[0], 1'b0, a[3:1]};    // SHR: carry = a[0]
        endcase
        result = tmp[3:0];
        carry  = tmp[4];
    end

    assign zero = (result == 4'b0);
endmodule
