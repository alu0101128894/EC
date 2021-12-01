//Full-adder de tres entradas de 1 bit realizado a partir de puertas logicas 

module fa(output wire cout, sum, input wire a, b, cin);
    
    assign {cout, sum} = a + b + cin;
    
    //assign sum = a ^ b ^ cin;
    //assign cout = a & b | a & cin | b & cin;

    //wire sum_1, carry1, carry2;

    //ha ha1(sum_1, carry1, a, b);
    //ha ha2(sum, carry2, sum_1, c_in);
    //or puerta_or(cout, carry1, carry2);

    
endmodule
