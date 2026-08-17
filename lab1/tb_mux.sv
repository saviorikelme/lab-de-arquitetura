`timescale 1ns/1ps

module tb_mux;
   logic [2:0]  count; // contador de 3 bits para não estourar o limite da variável
   logic [31:0] a, b, c, d;
   logic [31:0] muxOut;

   mux dut(.f(muxOut), .a(a), .b(b), .c(c), .d(d), .sel(count[1:0]));

   initial begin
     // hexidecimaias para facilitar a leitura
     a = 32'h11111111;
     b = 32'h22222222;
     c = 32'h33333333;
     d = 32'h44444444;
      
     $monitor($time," a = %h | b = %h | c = %h | d = %h | sel = %b | muxOut = %h", 
              a, b, c, d, count[1:0], muxOut);
     
     //contando as possibilidades do seletor 
     for(count = 0; count != 3'b100; count++) #10;     
     
     #10 $stop;
   end

endmodule: tb_mux
