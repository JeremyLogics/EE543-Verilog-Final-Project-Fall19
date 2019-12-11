//Bitwise NAND

module myNAND8 (input_a, input_b, output_ab_nand);

input 	[7:0]	input_a, input_b;

output 	[7:0]	output_ab_nand;

nand iNAND1 (output_ab_nand[0], input_a[0], input_b[0]);
nand iNAND2 (output_ab_nand[1], input_a[1], input_b[1]);
nand iNAND3 (output_ab_nand[2], input_a[2], input_b[2]);
nand iNAND4 (output_ab_nand[3], input_a[3], input_b[3]);
nand iNAND5 (output_ab_nand[4], input_a[4], input_b[4]);
nand iNAND6 (output_ab_nand[5], input_a[5], input_b[5]);
nand iNAND7 (output_ab_nand[6], input_a[6], input_b[6]);
nand iNAND8 (output_ab_nand[7], input_a[7], input_b[7]);

endmodule
