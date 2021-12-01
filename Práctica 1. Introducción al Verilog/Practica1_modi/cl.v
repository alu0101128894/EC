// Celda lógica -> and, or, xor e inversión de dos bits, S vale (00, 01, 10 y 11)

module cl(output wire out, input wire a, b, input wire [1:0]s);

	wire s_and, s_or, s_xor, s_not;

	and and1(s_and, a, b);
	or or1(s_or, a, b);
	xor xor1(s_xor, a, b);
	not not1(s_not, a); 

	mux4_1 mux1(out, s_and, s_or, s_xor, s_not, s);

endmodule

//module cl(output reg out, input wire a, b, input wire [1:0] s);

	//always @(a,b,s)
		//begin
		//	case(s)
			//	2'b00: out = a & b;
			//	2'b01: out = a | b;
			//	2'b10: out = a ^ b;
			//	2'b11: out = ~a;
			//endcase
		//end
		
