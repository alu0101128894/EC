module compl1(output wire [3:0] Sal, input wire [3:0] Ent, input wire cpl);
	
	//Si cpl = 1, Sal = Cpl1(Ent) y si no, Sal = Ent
	assign Sal = cpl ? (~Ent) : Ent;

endmodule
