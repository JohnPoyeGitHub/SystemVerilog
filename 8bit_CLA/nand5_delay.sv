module nand5_delay (
    input  logic in1,
    input  logic in2,
    input  logic in3,
    input  logic in4,
    input  logic in5,
    output logic out
);
  //TODO: Complete the code
  logic u1_out, u1_out_inv;
    logic u2_out, u2_out_inv;


    nand3_delay u1 (.a(in1), .b(in2), .c(in3), .y(u1_out));
    nand2_delay u1_inv (.a(u1_out), .b(u1_out), .y(u1_out_inv));

	  nand2_delay u2 (.a(d), .b(e), .y(u2_out));
    nand2_delay u2_inv (.a(u2_out), .b(u2_out), .y(u2_out_inv));

    nand2_delay u3 (.a(u1_out_inv), .b(u2_out_inv), .y(y));
endmodule
