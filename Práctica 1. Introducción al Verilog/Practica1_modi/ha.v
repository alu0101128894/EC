//Semisumador de dos entradas de 1 bit realizado a partir de puertas

module ha(output wire sum, carry, input wire a, b);

xor xor1(sum, a, b);
and and1(carry, a, b);

endmodule
