module four_X_one(input [1:0] s,input [3:0] i,output y);
wire w1,w2,w3,w4,w5,w6;
 not (w1,s[1]);
 not (w2,s[0]);
 and (w3, w1, w2, i[0]);
 and (w4, w1, s[0], i[1]);
 and (w5, s[1], w2, i[2]);
 and (w6, s[1], s[0], i[3]);
 or (y, w3, w4, w5, w6);
endmodule