//NO ME GUSTA

module mux2_1_i3(output reg out, input wire a, b, s);
// mux con construcci�n always (procedural), las asignaciones deben ser a variables con estado ('out' ahora es tipo reg)
// en el caso de un modulo combinacional, se debe usar la asignaci�n procedural 'con bloqueo' que equivale al "=" de C  

always @(a or b or s) //alternativamente, always @(a, b, s) o always @* (autom�tico, considera todas las var)
  if (s)              //no hace falta begin...end porque el always contiene una sola sentencia if..else
    out = b;
  else
    out = a;
  
endmodule
