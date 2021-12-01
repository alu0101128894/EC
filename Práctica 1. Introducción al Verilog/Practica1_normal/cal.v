// Unir las dos implementaciones en una “celda arimético-lógica” mediante un multiplexor

module cal(output wire out, c_out, input wire a, b, l, c_in, input wire [1:0] s);

    wire s_cl, s_fa;
	
	cl cl1(s_cl, a, b, s); 
	fa fa1(c_out, s_fa, a, b, c_in); 
	
	mux2_1 mux(out, s_fa, s_cl, l);

endmodule