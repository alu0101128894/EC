//`include "mux4_1_tb.v"
//`include "fa.v"

module mux4_1(output reg out, input wire a,b,c,d, input wire [1:0]s);
	always @(a, b, c, d, s) //Al cambiar las variables vuelve a evaluar el case

	begin	
	    case (s) 
	       2'b00: out = a; //Cuando s es (0,0) la salida va a ser lo que contenga a
	       2'b01: out = b; //Cuando s es (0,1) la salida va a ser el contenido de b
	       2'b10: out = c; //Cuando s es (1,0) la salida va a ser el contenido de c
	       2'b11: out = d; //Cuando s es (1,1) la salida va a ser el contenido de d
	       default out = 'bx;  //Para los demas casos no es relevante, se marca con una x
	    endcase
	 end
endmodule
