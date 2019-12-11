
module FADDSUB8
	(
	input_a, 
	input_b, 
	sum,
	sel, 
	//carry_in, 
	carry_out
	);
input 	[7:0] 	input_a, input_b;
//input 			carry_in;
input	[1:0]	sel; //if sel is 2'b01, sum = a+b; 2'b10, sum = a-b, 2'b11, sum = b-a. 
output 	[7:0] 	sum;
output 			carry_out;

wire [6:0] internal_carry;
wire [7:0] xor_input_a, xor_input_b;
wire not_sel, andselb, andsela; //not_sel = !sel[1], andselb = not_sel AND sel0, andsela = sel1 AND sel0. 

not (not_sel, sel[0]);
//and (andselb, not_sel, sel[0]);
and (andsela, sel[1], sel[0]);

xor xa1	(xor_input_a[0], andsela, input_a[0]);
xor xa2	(xor_input_a[1], andsela, input_a[1]);
xor xa3	(xor_input_a[2], andsela, input_a[2]);
xor xa4	(xor_input_a[3], andsela, input_a[3]);
xor xa5	(xor_input_a[4], andsela, input_a[4]);
xor xa6	(xor_input_a[5], andsela, input_a[5]);
xor xa7	(xor_input_a[6], andsela, input_a[6]);
xor xa8	(xor_input_a[7], andsela, input_a[7]); 

xor xb1	(xor_input_b[0], not_sel, input_b[0]);
xor xb2	(xor_input_b[1], not_sel, input_b[1]);
xor xb3	(xor_input_b[2], not_sel, input_b[2]);
xor xb4	(xor_input_b[3], not_sel, input_b[3]);
xor xb5	(xor_input_b[4], not_sel, input_b[4]);
xor xb6	(xor_input_b[5], not_sel, input_b[5]);
xor xb7	(xor_input_b[6], not_sel, input_b[6]);
xor xb8	(xor_input_b[7], not_sel, input_b[7]); 

FADD1 A1 (xor_input_a[0], 		xor_input_b[0],			sum[0], 		sel[1], 			internal_carry[0]);
FADD1 A2 (xor_input_a[1], 		xor_input_b[1],			sum[1], 		internal_carry[0], 	internal_carry[1]);
FADD1 A3 (xor_input_a[2], 		xor_input_b[2],			sum[2], 		internal_carry[1], 	internal_carry[2]);
FADD1 A4 (xor_input_a[3], 		xor_input_b[3],			sum[3], 		internal_carry[2], 	internal_carry[3]);
FADD1 A5 (xor_input_a[4], 		xor_input_b[4],			sum[4], 		internal_carry[3], 	internal_carry[4]);
FADD1 A6 (xor_input_a[5], 		xor_input_b[5],			sum[5], 		internal_carry[4], 	internal_carry[5]);
FADD1 A7 (xor_input_a[6], 		xor_input_b[6],			sum[6], 		internal_carry[5], 	internal_carry[6]);
FADD1 A8 (xor_input_a[7], 		xor_input_b[7],			sum[7], 		internal_carry[6], 	carry_out);

endmodule
