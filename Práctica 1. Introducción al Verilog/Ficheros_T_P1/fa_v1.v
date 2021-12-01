    //Sumador completo (full-adder) de tres entradas de 1 bit realizado a partir de puertas l�gicas 
module fa_v1(output wire sum, output wire c_out, input wire a, input wire b, input wire c_in);

    wire sum_ha1, c_ha1, c_ha2;

    ha_v1 ha1(sum_ha1, c_ha1, a, b);
    ha_v1 ha2(sum, c_ha2, c_in, sum_ha1);
    or puerta_or(c_out, c_ha1, c_ha2);

endmodule
