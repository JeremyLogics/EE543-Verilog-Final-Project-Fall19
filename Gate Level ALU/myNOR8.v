//Bitwise NOR

module myNOR8 (input_a, input_b, output_ab_nor);

input 	[7:0]	input_a, input_b;

output 	[7:0]	output_ab_nor;

nor iNOR1 (output_ab_nor[0], input_a[0], input_b[0]);
nor iNOR2 (output_ab_nor[1], input_a[1], input_b[1]);
nor iNOR3 (output_ab_nor[2], input_a[2], input_b[2]);
nor iNOR4 (output_ab_nor[3], input_a[3], input_b[3]);
nor iNOR5 (output_ab_nor[4], input_a[4], input_b[4]);
nor iNOR6 (output_ab_nor[5], input_a[5], input_b[5]);
nor iNOR7 (output_ab_nor[6], input_a[6], input_b[6]);
nor iNOR8 (output_ab_nor[7], input_a[7], input_b[7]);

endmodule
