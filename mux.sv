module mux
  (
    output logic [31:0] f,
    input  logic [31:0] a, b, c, d,
    input  logic [1:0]  sel
  ); 

  // Fios internos para guardar as saídas das portas AND e os seletores invertidos
  logic [31:0] f1, f2, f3, f4;
  logic n_sel1, n_sel0;

  // Inversoras para os 2 bits do seletor (criando sel negado)
  not g1(n_sel0, sel[0]),
      g2(n_sel1, sel[1]);

  // Portas AND replicadas 32 vezes (Array de Instâncias)[cite: 1]
  // Cada instância pega 1 bit dos dados (a, b, c, d) e os mesmos sinais escalares do seletor
  and g3 [31:0] (f1, a, n_sel1, n_sel0),
      g4 [31:0] (f2, b, n_sel1, sel[0]),
      g5 [31:0] (f3, c, sel[1], n_sel0),
      g6 [31:0] (f4, d, sel[1], sel[0]);

  // Porta OR replicada 32 vezes para juntar tudo[cite: 1]
  or  g7 [31:0] (f, f1, f2, f3, f4);

endmodule
