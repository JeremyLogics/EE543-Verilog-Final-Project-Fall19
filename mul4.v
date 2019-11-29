//`timescale 1ns / 1ps
// `default nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: University of South Alabama ECE department, EE-543
// Engineer: 
// 
// Create Date: 11/17/2019 06:25:03 AM
// Design Name: 4-bit multiplier
// Module Name: MUL4JLapane
// Project Name: HDL/Verilog course Final Project
// Target Devices: 
// Tool Versions: 
// Description: Design a 4-bit multiplier using gate level modeling
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
// Quartus text editor:
// CTRL+H: find and replace
// Alt+left-select: column selection
// 
// Sublime text 3 notes: 
// CTRL+Shift+/ : comment block selection shortcut
//
//
//
//////////////////////////////////////////////////////////////////////////////////

// ** myAND, AND1x4, and FADD4 are commented out as they were not used in this design. 

/*module myAND (input1,input2,result); 
input input1, input2; //and gate inputs, the first and second inputs. 
output result; //"result" is the output of the and gate
and g1 (result, input1, input2);
endmodule*/
 
/*module AND1x4 (a, b, out);
input [3:0] a;
input b;
output [3:0] out;

and (out[0], a[0], b);
and (out[1], a[1], b);
and (out[2], a[2], b);
and (out[3], a[3], b);

endmodule*/

/*module FADD4 (fourin1, fourin2, sum, carryin, carryout);
input  [3:0] fourin1, fourin2; //first and second inputs
input  carryin;
output [3:0] sum;
output carryout;

wire carry1, carry2, carry3; //internal carries

FADD1 g1  (fourin1[0], fourin2[0], sum[0], carryin, carry1);
FADD1 g2  (fourin1[1], fourin2[1], sum[1], carry1, carry2);
FADD1 g3  (fourin1[2], fourin2[2], sum[2], carry2, carry3);
FADD1 g4  (fourin1[3], fourin2[3], sum[3], carry3, carryout);

endmodule*/

//FADD1 COMPLETE
module FADD1 (in1, in2, s, cin, cout); 
//using different naming conventions to better distinguish code, since this will be instanced in the 4-bit full adder
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
//group0 and+FADD COMPLETE
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
