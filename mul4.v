//FADD1 
module FADD1 (in1, in2, s, cin, cout); 
input  in1, in2, cin; //port declaration in1 and in2 are inputs a and b for the adder, cin is Carry in
output s, cout; //port dec S is sum and cout is carry out
wire   out1, out2, out3; //internal variables between gates
//using built in-gates, the following gate-level modeling arranges a 1-bit full adder, can be used in the commented out FADD4
xor g1 (out1, in1, in2);
xor g2 (s, out1, cin);
and g3 (out2, out1, cin);
and g4 (out3, in1, in2);
or g5  (cout, out2, out3);

endmodule

//TOP MODULE
module JLAPANEMUL4 (inputa, inputb, Output_P_eq_ab); 
//using different naming convention for readbility, this module is the top module for the 4-bit multiplier design, using instances of FADD1, FADD4, AND1x4 
input [3:0] inputa, inputb;
output [7:0] Output_P_eq_ab;
wire [7:0] internal_x, internal_y, internal_z; // internal wires between ANDs and FADD, see //#
wire [8:0] carry;

assign internal_x[3] = 1'b0;

//inputs initial and
and (Output_P_eq_ab[0], inputa[0], inputb[0]);
and (internal_x[0], inputa[1], inputb[0]);
and (internal_x[1], inputa[2], inputb[0]);
and (internal_x[2], inputa[3], inputb[0]);
//group0 and+FADD 
and (internal_x[4], inputa[0], inputb[1]); //0, x wires go from AND gate to FADD module
and (internal_x[5], inputa[1], inputb[1]); //0
and (internal_x[6], inputa[2], inputb[1]); //0
and (internal_x[7], inputa[3], inputb[1]); //0

FADD1 A1 (internal_x[0],internal_x[4], Output_P_eq_ab[1], 1'b0, carry[0]); //0 internal_x[#] wires are inputs
FADD1 A2 (internal_x[1],internal_x[5], internal_y[0], carry[0], carry[1]); //0 //internal_y[#] wires are outputs to the next set of FADDs
FADD1 A3 (internal_x[2],internal_x[6], internal_y[1], carry[1], carry[2]); //0
FADD1 A4 (internal_x[3],internal_x[7], internal_y[2], carry[2], internal_y[3]); //0

//group1 and+FADD 
and (internal_y[4], inputa[0], inputb[2]); //1 internal_y[#] wires are outputs to FADD1 B#
and (internal_y[5], inputa[1], inputb[2]); //1
and (internal_y[6], inputa[2], inputb[2]); //1
and (internal_y[7], inputa[3], inputb[2]); //1

FADD1 B1 (internal_y[0],internal_y[4], Output_P_eq_ab[2], 1'b0, carry[3]); //1
FADD1 B2 (internal_y[1],internal_y[5], internal_z[0], carry[3], carry[4]); //1
FADD1 B3 (internal_y[2],internal_y[6], internal_z[1], carry[4], carry[5]); //1
FADD1 B4 (internal_y[3],internal_y[7], internal_z[2], carry[5], internal_z[3]); //1

//group2 and+FADD
and (internal_z[4], inputa[0], inputb[3]); //2 internal_z[#] wires are outputs to FADD1 C#
and (internal_z[5], inputa[1], inputb[3]); //2
and (internal_z[6], inputa[2], inputb[3]); //2
and (internal_z[7], inputa[3], inputb[3]); //2

FADD1 C1 (internal_z[0], internal_z[4], Output_P_eq_ab[3], 1'b0, carry[6]); //2
FADD1 C2 (internal_z[1], internal_z[5], Output_P_eq_ab[4], carry[6], carry[7]); //2
FADD1 C3 (internal_z[2], internal_z[6], Output_P_eq_ab[5], carry[7], carry[8]); //2
FADD1 C4 (internal_z[3], internal_z[7], Output_P_eq_ab[6], carry[8], Output_P_eq_ab[7]);  //2

endmodule 
