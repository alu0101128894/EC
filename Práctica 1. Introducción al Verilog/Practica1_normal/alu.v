`include "fa.v"
`include "mux2_1.v"
`include "mux2_4.v"
`include "mux4_1.v"
`include "cl.v"
`include "cal.v"
`include "compl1.v"
`include "alu_tb.v"

module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire L);

wire [3:0] mux_out, op1, op2;   
wire Op1_a, Op2_b, cpl, cin_0, c_out0, c_out1, c_out2;

cal cal0(R[0], c_out0, op1[0], op2[0], L, cin_0, ALUOp);   
cal cal1(R[1], c_out1, op1[1], op2[1], L, c_out0, ALUOp); 
cal cal2(R[2], c_out2, op1[2], op2[2], L, c_out1, ALUOp); 
cal cal3(R[3], carry, op1[3], op2[3], L, c_out2, ALUOp); 

 mux2_4 mux1(op1, 4'b0000, A, Op1_a); 
 mux2_4 mux2(mux_out, A, B, Op2_b);
 compl1 comp1(op2, mux_out, cpl);
 
assign Op1_a = (~ALUOp[1]) | L;
assign Op2_b = (~ALUOp[1]) | ALUOp[0] | L;
assign cpl = (ALUOp[0] | ALUOp[1]) & ~L;  (ALUOp[0]) & ~L | (ALUOp[1]) & ~L;
assign cin_0 = ALUOp[0] | ALUOp[1];
assign sign = R[3];
assign zero = R == 4'b0000 ? 1'b1 : 1'b0;
  // Si R = 00000 --> zero = 1
// Si R != 00000 --> zero = 0

endmodule





 
