//Modificacion

`include "fa.v"
`include "mux2_1.v"
`include "mux2_4.v"
`include "mux4_1.v"
`include "cl.v"
`include "cal.v"
`include "compl1.v"
`include "alu_tb_t3.v" //Modificacion = TestBench A+1

module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire L);

wire [3:0] mux_compl, op1, op2;   
wire Op1_a, Op2_b, cpl, cin, cout1, cout2, cout3;

cal cal0(R[0], cout1, op1[0], op2[0], L, cin, ALUOp);   //Cal1
cal cal1(R[1], cout2, op1[1], op2[1], L, cout1, ALUOp); //Cal2
cal cal2(R[2], cout3, op1[2], op2[2], L, cout2, ALUOp); //Cal3
cal cal3(R[3], carry, op1[3], op2[3], L, cout3, ALUOp); //Cal4

//Conexion de la primera mitad del esquema
 mux2_4 mux1(op1, 4'b0000, A, Op1_a); 
 mux2_4 mux2(mux_compl, A, B, Op2_b);
 compl1 comp1(op2, mux_compl, cpl);
 
//Asignacion de las variables en forma canonica -> Karnaugh
assign Op1_a = (~ALUOp[1]) | L;
assign Op2_b = (~ALUOp[1]) | ALUOp[0] | L;
assign cpl =  ALUOp[0] & ~L;    //Modificacion -> CPl2(A) = A+1 -> Karnaugh = 0 0 0 1
assign cin = ALUOp[0] | ALUOp[1];
assign sign = R[3];
assign zero = R == 4'b0000 ? 1'b1 : 1'b0; //Si R = 0000 -> 1, else = 0
//assign zero = ~(R[0] | R[1] | R[2] | R[3]);	//suma e inviertes

endmodule




 
