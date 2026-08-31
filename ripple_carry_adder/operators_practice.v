module operators_practice;
reg[3:0] a=4'b1010;
reg[3:0] b=4'b0101;
reg [7:0] combined;
initial
begin
$display("Bitwise AND: %b", a & b);
        $display("Logical AND: %b", a && b);
        $display("Reduction AND on a: %b", &a);
        combined = {a, {4{b[0]}}}; 
        $display("Concatenated & Replicated: %b", combined);

        $finish;
    end
endmodule
