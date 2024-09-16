module xor2_delay (
    input logic a,
    input logic b,
    output logic y
);

  logic nand1, nand2, nand3;

  nand2_delay u1  (
    .a(a),
    .b(b),
    .y(nand1)
  );
  
  nand2_delay u2  (
    .a(nand1),
    .b(a),
    .y(nand2)
  );

  nand2_delay  u3  (
    .a(nand1),
    .b(b),
    .y(nand3)
  );

  nand2_delay u4 (
    .a(nand2),
    .b(nand3),
    .y(y)
  );

endmodule