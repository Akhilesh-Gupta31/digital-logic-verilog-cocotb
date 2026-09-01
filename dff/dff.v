module dff(input clk, input d, input rst, output reg q,output qbar);
always @(posedge clk or posedge rst)
begin
if(rst)
q<=1'b0;
else
q<=d;
end
assign qbar=~q;
endmodule
