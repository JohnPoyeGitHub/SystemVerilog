module generate_logic (
    input  logic a,
    input  logic b,
    output logic g
);
  logic nand_ab;

  nand2_delay u1(
    .a(a),
    .b(b),
    .y(nand_ab)
  );

  nand2_delay  u2(
    .a(nand_ab),
    .b(nand_ab),
    .y(g)
    );

endmodule
