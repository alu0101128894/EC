module mux2_1_i4(output reg out, input wire a, b, s);
// mux con construcci�n always (procedural), las asignaciones deben ser a variables con estado ('out' ahora es tipo reg)
// en el caso de un modulo combinacional, se debe usar la asignaci�n procedural 'con bloqueo' que equivale al "=" de C  

always @(a or b or s) //alternativamente, always @(a, b, s) o always @* (autom�tico, considera todas las var)
                      //no hace falta begin...end porque el always contiene una sola sentencia, el case
  case (s)              
    0: out = a;
    1: out = b;
    default: out = 'bx; //desconocido en cualquier otro caso (x � z), no se especifica el tama�o en la cte, si 'out' fuera mayor
                        // de un bit, el bit m�s sigificativo si es x � z se extiende hasta completar el tama�o total
  endcase
  
endmodule
