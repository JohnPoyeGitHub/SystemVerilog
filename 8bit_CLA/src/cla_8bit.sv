module cla_8bit (
    input  logic [7:0] A,
    input  logic [7:0] B,
    output logic [8:0] Sum
);


logic [7:0] P, G;
logic [8:0] C;

// Propagate Logic
    genvar i;
    generate
        for (i = 0; i < 8; i++) 
            begin : generate_PL
                propogate_logic pl (
                    .a(A[i]),
                    .b(B[i]),
                    .p(P[i])
                );
            end
    endgenerate
    
    // Generate Logic
    genvar j;
    generate
        for (j = 0; j < 8; j++) 
            begin : generate_GL
                generate_logic gl (
                    .a(A[j]),
                    .b(B[j]),
                    .g(G[j])
                );
            end
    endgenerate

    // Sum Logic
    genvar k;
    generate
        for (k = 0; k < 8; k++) 
            begin : generate_SL
                sum_logic sl (
                    .a(A[k]),
                    .b(B[k]),
                    .Cin(C[k]),
                    .s(Sum[k])
                );
            end
    endgenerate

    sum_logic sl_4 (
                    .a(A[7]), // sign extension
                    .b(B[7]), // sign extension
                    .carry_in(C[8]), // carry out from the fourth slice
                    .sum(Sum[8]) // sign extended 5th sum bit
                );

// Slice 0 does not need carry computation - Cin is the carry coming from outside

    //Slice 1
    assign C[0] = 1'b0;
    carry_logic_0 cl0 (.p0(P[0]), .g0(G[0]), .carry_in0(1'b0), .carry_out(C[1]));

    //Slice 2
    carry_logic_1 cl1 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .carry_in0(1'b0), .carry_out(C[2]));
                           
    // Slice 3
    carry_logic_2 cl2 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]),
                            .carry_in0(1'b0), .carry_out(C[3]));
    
    
    carry_logic_3 cl3 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), 
                           .p3(P[3]), .g3(G[3]), .ci0(1'b0), .co(C[4]));

    carry_logic_4 cl4 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), 
                        .p3(P[3]), .g3(G[3]), .g4(G[4]), .p4(P[4]), .ci0(1'b0), .co(C[5]));      

    carry_logic_5 cl5 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), 
                        .p3(P[3]), .g3(G[3]), .g4(G[4]), .p4(P[4]), .p5(P[5]), .g5(G[5]), .carry_in(1'b0), .carry_out(C[6]));                    
    
    carry_logic_6 cl6 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), 
                        .p3(P[3]), .g3(G[3]), .g4(G[4]), .p4(P[4]), .p5(P[5]), .g5(G[5]), .p6(P[6]), .g6(G[6]), .cin(1'b0), .out(C[7]));

// Slice 8 generates the last carry out that is the eigth sum bit to avoid over/underflow
    carry_logic_6 cl6 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), 
                        .p3(P[3]), .g3(G[3]), .g4(G[4]), .p4(P[4]), .p5(P[5]), .g5(G[5]), .p6(P[6]), .g6(G[6]), .p7(P[7]), .g7(G[7]), .cin(1'b0), .out(C[8]));
    