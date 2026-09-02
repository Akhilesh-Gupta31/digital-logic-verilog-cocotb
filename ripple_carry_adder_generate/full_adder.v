module full_adder(input a,b,c_in,output sum,c_out);
wire w1,w2,w3;
xor(sum,a,b,c_in);
and(w1,a,b);
and(w2,a,c_in);
and(w3,b,c_in);
or(c_out,w1,w2,w3);
endmodule