//Bitwise XNOR

module myXNOR8 (input_a, input_b, output_ab_xnor);

input 	[7:0]	input_a, input_b;

output 	[7:0]	output_ab_xnor;

xnor iXNOR1 (output_ab_xnor[0], input_a[0], input_b[0]);
xnor iXNOR2 (output_ab_xnor[1], input_a[1], input_b[1]);
xnor iXNOR3 (output_ab_xnor[2], input_a[2], input_b[2]);
xnor iXNOR4 (output_ab_xnor[3], input_a[3], input_b[3]);
xnor iXNOR5 (output_ab_xnor[4], input_a[4], input_b[4]);
xnor iXNOR6 (output_ab_xnor[5], input_a[5], input_b[5]);
xnor iXNOR7 (output_ab_xnor[6], input_a[6], input_b[6]);
xnor iXNOR8 (output_ab_xnor[7], input_a[7], input_b[7]);

endmodule