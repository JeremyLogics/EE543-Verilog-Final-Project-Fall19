// 12 to one mux

module MUX16 (
        mux16_input,
        mux16_output,
        mux16_control
        );
input   [15:0]  mux16_input;
input   [3:0]   mux16_control;

output          mux16_output;

wire    [7:0]   mux16_internal_L0;  // internal variables wiring previous mux2 to next mux2, layer 0
wire    [3:0]   mux16_internal_L1;  // internal variables wiring previous mux2 to next mux2, layer 1
wire    [1:0]   mux16_internal_L2;  // internal variables wiring previous mux2 to next mux2, layer 2

MUX2 MUX16_L0_0         (mux16_input[0],    mux16_input[1],     mux16_control[0],   mux16_internal_L0[0]);
MUX2 MUX16_L0_1         (mux16_input[2],    mux16_input[3],     mux16_control[0],   mux16_internal_L0[1]);
MUX2 MUX16_L0_2         (mux16_input[4],    mux16_input[5],     mux16_control[0],   mux16_internal_L0[2]);
MUX2 MUX16_L0_3         (mux16_input[6],    mux16_input[7],     mux16_control[0],   mux16_internal_L0[3]);
MUX2 MUX16_L0_4         (mux16_input[8],    mux16_input[9],     mux16_control[0],   mux16_internal_L0[4]);
MUX2 MUX16_L0_5         (mux16_input[10],   mux16_input[11],    mux16_control[0],   mux16_internal_L0[5]);
MUX2 MUX16_L0_6         (mux16_input[12],   mux16_input[13],    mux16_control[0],   mux16_internal_L0[6]);
MUX2 MUX16_L0_7         (mux16_input[14],   mux16_input[15],    mux16_control[0],   mux16_internal_L0[7]);

MUX2 MUX16_L1_0         (mux16_internal_L0[0],  mux16_internal_L0[1],   mux16_control[1],   mux16_internal_L1[0]);
MUX2 MUX16_L1_1         (mux16_internal_L0[2],  mux16_internal_L0[3],   mux16_control[1],   mux16_internal_L1[1]);
MUX2 MUX16_L1_2         (mux16_internal_L0[4],  mux16_internal_L0[5],   mux16_control[1],   mux16_internal_L1[2]);
MUX2 MUX16_L1_3         (mux16_internal_L0[6],  mux16_internal_L0[7],   mux16_control[1],   mux16_internal_L1[3]);

MUX2 MUX16_L2_0         (mux16_internal_L1[0],  mux16_internal_L1[1],   mux16_control[2],   mux16_internal_L2[0]);
MUX2 MUX16_L2_1         (mux16_internal_L1[2],  mux16_internal_L1[3],   mux16_control[2],   mux16_internal_L2[1]);

MUX2 MUX16_outputMUX2   (mux16_internal_L2[0],  mux16_internal_L2[0],   mux16_control[3],   mux16_output);

endmodule
