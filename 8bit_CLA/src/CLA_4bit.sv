module CLA_4bit (
    input  logic [3:0] A,
    input  logic [3:0] B,
    output logic [4:0] Sum // 5-bits to avoid over/under flow
);

    logic [3:0] P, G; // Propagate and Generate
    logic [4:0] C;    // Carry
    
    // Propagate Logic
    genvar i;
    generate
        for (i = 0; i < 4; i++) 
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
        for (j = 0; j < 4; j++) 
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
        for (k = 0; k < 4; k++) 
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
                    .a(A[3]), // sign extension
                    .b(B[3]), // sign extension
                    .Cin(C[4]), // carry out from the fourth slice
                    .s(Sum[4]) // sign extended 5th sum bit
                );

    // Slice 0 does not need carry computation - Cin is the carry coming from outside

    //Slice 1
    assign C[0] = 1'b0;
    CLA_carry_logic_0 cl0 (.p0(P[0]), .g0(G[0]), .ci0(1'b0), .co(C[1]));

    //Slice 2
    CLA_carry_logic_1 cl1 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .ci0(1'b0), .co(C[2]));

    // Slice 4 generates the last carry out that is the fifth sum bit to avoid over/underflow
    CLA_carry_logic_3 cl3 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]), 
                           .p3(P[3]), .g3(G[3]), .ci0(1'b0), .co(C[4]));
                           
    // Slice 3
    CLA_carry_logic_2 cl2 (.p0(P[0]), .g0(G[0]), .p1(P[1]), .g1(G[1]), .p2(P[2]), .g2(G[2]),
                            .ci0(1'b0), .co(C[3]));


    

endmodule