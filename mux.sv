module mux
  (
    output logic [31:0] f,
    input  logic [31:0] a, b, c, d,
    input  logic [1:0]  sel
  ); 

  // fios internos para guardar as saídas das portas and e os seletores invertidos
  logic [31:0] f1, f2, f3, f4;
  logic n_sel1, n_sel0;

  // Inversoras para os 2 bits do seletor
  not g1(n_sel0, sel[0]),
      g2(n_sel1, sel[1]);

  // fios internos guardando as informacoes dada a chave de selecao
  and g3 [31:0] (f1, a, n_sel1, n_sel0),
      g4 [31:0] (f2, b, n_sel1, sel[0]),
      g5 [31:0] (f3, c, sel[1], n_sel0),
      g6 [31:0] (f4, d, sel[1], sel[0]);

  // porta or para saida final
  or  g7 [31:0] (f, f1, f2, f3, f4);

endmodule
