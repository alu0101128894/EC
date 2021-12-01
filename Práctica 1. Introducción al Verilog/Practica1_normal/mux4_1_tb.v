`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el del paso de simulacion
module mux4_1_tb;
//declaracion de se�ales
reg [1:0]test_s; //test_s es de 2 bits
reg test_a, test_b,test_c,test_d;
wire test_out;

//instancia del modulo a testear, con notaci�n de posiciones de argumentos y con notaci�n de nombres
mux4_1 mat(test_out, test_a, test_b, test_c, test_d, test_s);

initial
begin
  //$dumpfile("caca.vcd");
  //$dumpvars;
  $monitor("Tiempo=%0d | s=%b a=%b b=%b c=%b d=%b -> out=%b", $time, test_s, test_a, test_b, test_c, test_d, test_out);
  //vector de test 0
  test_s = 2'b00;
  test_a = 1'b1;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;
  //vector de test 1
  test_s = 2'b01;
  test_a = 1'b1;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b1;
  # 20;
  //vector de test 1
  test_s = 2'b10;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b0;
  # 20;
  //vector de test 3
  test_s = 2'b11; 
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;
 
  $finish;
end

endmodule
