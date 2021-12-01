//Sumador de 4 bits 
module sum4(output wire[3:0] S, output wire c_out, input wire[3:0] A, input wire[3:0] B, input wire c_in);

	wire C1,C2,C3;

	fa_v1 fa0(S[0], C1,    A[0],B[0], c_in);
	fa_v1 fa1(S[1], C2,    A[1],B[1], C1);
	fa_v1 fa2(S[2], C3,    A[2],B[2], C2);
	fa_v1 fa3(S[3], c_out, A[3],B[3], C3);


endmodule

