module carry_logic_0 (
    input  logic p0,
    input  logic g0,
    input  logic carry_in0,
    output logic carry_out
);

  logic nand1, nand2;

  nand2_delay u1 (
    .in1(g0),
    .in2(g0),
    .out(nand1)
  );
  
  nand2_delay u2 (
    .in1(p0),
    .in2(carry_in0),
    .out(nand2)
  );
  
  nand2_delay u3 (
    .in1(nand1),
    .in2(nand2),
    .out(carry_out)
  );

endmodule
