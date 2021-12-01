`include "componentes.v"
`include "memprog.v"
`include "alu.v"
//`include "progfile.dat"
//`include "regfile.dat"


//CAMBIAR ORDEN

module microc(input wire clk, reset, s_abs, s_inc, s_inm, we3, wez, input wire [2:0] op, output wire z, output wire [5:0] opcode);

//Microcontrolador sin memoria de datos de un solo ciclo
//Instanciar e interconectar pc, memprog, regfile, alu, sum, biestable Z y mux's

    wire [9:0] sum_out, mux_pc, mux_sum, pc_out;
    wire [15:0] mp_out;
    wire [7:0] wd3, rd1, rd2, alu_out;
    wire z_alu;

    mux2 #(10) mux_10b(mp_out[9:0], 10'b1, s_inc, mux_sum); //La salida es mux_sum de acuerdo al archivo "componentes.v"
    sum sum1(pc_out, mux_sum, sum_out);
    mux2 #(10) mux_10a(sum_out, mp_out[9:0], s_abs, mux_pc);

	registro #(10) pc(clk, reset, mux_pc, pc_out);

	memprog mp(clk, pc_out, mp_out);
	regfile banco_registro(clk, we3, mp_out[11:8], mp_out[7:4], mp_out[3:0], wd3, rd1, rd2);
	alu alu1(rd1, rd2, op, alu_out, z_alu);
	mux2 #(8) mux8b(alu_out, mp_out[11:4], s_inm, wd3);
	ffd ffz(clk, reset, z_alu, wez, z);

	assign opcode = mp_out [15:10];
    
endmodule
