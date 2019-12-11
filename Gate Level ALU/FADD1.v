//Addition
module FADD1 
	(
	in1, 
	in2, 
	s, 
	cin, 
	cout
	); 
input  in1, in2, cin; //port declaration in1 and in2 are inputs a and b for the adder, cin is Carry in
output s, cout; //port dec S is sum and cout is carry out
wire   out1, out2, out3; //internal variables between gates
//using built in-gates, the following gate-level modeling arranges a 1-bit full adder
xor g1 (out1, in1, in2);
xor g2 (s, out1, cin);
and g3 (out2, out1, cin);
and g4 (out3, in1, in2);
or g5  (cout, out2, out3);
endmodule