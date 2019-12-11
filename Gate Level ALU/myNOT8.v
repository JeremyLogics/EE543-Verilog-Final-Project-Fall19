//Bitwise NOT

module myNOT8 (input_b, output_b_NOT);

input 	[7:0]	input_b;

output 	[7:0]	output_b_NOT;

not iNOT1 (output_b_NOT[0], input_b[0]);
not iNOT2 (output_b_NOT[1], input_b[1]);
not iNOT3 (output_b_NOT[2], input_b[2]);
not iNOT4 (output_b_NOT[3], input_b[3]);
not iNOT5 (output_b_NOT[4], input_b[4]);
not iNOT6 (output_b_NOT[5], input_b[5]);
not iNOT7 (output_b_NOT[6], input_b[6]);
not iNOT8 (output_b_NOT[7], input_b[7]);

endmodule
