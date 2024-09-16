module cla_8bit (
    input  logic [7:0] A,
    input  logic [7:0] B,
    output logic [8:0] Sum
);

// logic C1;  //Carry

// CLA_4bit cla1 (
//     .A(A[3:0]),
//     .B(B[3:0]),
//     .Cin(1'b0),
//     .Sum[3:0](Sum[3:0])
//     .Sum[4](C1)
// );

// CLA_4bit cla2 (
//     .A(A[7:4]),
//     .B(B[7:4]),
//     .Cin(C1),
//     .Sum(Sum[8:4])
// );
// endmodule

logic [7:0] P, G;
logic [8:0] C;