//8-to-1 mux, this is directly from class notes

module MUX8 (d0, d1, d2, d3, d4, d5, d6, d7, s0, s1, s2, y); 
//input and output ports declaration
input d0, d1, d2, d3, d4, d5, d6, d7, s0, s1, s2;
output y;

//local variables
wire o1, o2, o3, o4, o5, o6;

//make instance of MUX2
MUX2 g1 (d0, d1, s0, o1);
MUX2 g2 (d2, d3, s0, o2);
MUX2 g3 (d4, d5, s0, o3);
MUX2 g4 (d6, d7, s0, o4);
MUX2 g5 (o1, o2, s1, o5);
MUX2 g6 (o3, o4, s1, o6);
MUX2 g7 (o5, o6, s2, y); 

endmodule