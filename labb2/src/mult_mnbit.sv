module mult_mnbit #(parameter M = 4, parameter N = 4)(
	input logic[M-1:0] a,
	input logic [N-1:0] b,
	output logic [M+N-1:0] prod
);
logic [N-1:0][M-1:0] prod_terms;
logic [N-1:0] A0, B0, Sum0, A1, B1, Sum1, A2, B2, Sum2;
logic co0, co1, co2;

    genvar i, j;
    generate
        for (i = 0; i < M; i++) begin : B_loop
            for (j = 0; j < N; j++) begin : A_loop
                and2_delay u_and (
                .a(a[i]),
                .b(b[j]),
                .y(prod_terms [j] [i])
            );
            end
        end
    endgenerate
    
    assign prod[0] = prod_terms[0][0];
    rca_nbit #M u1(
        .a({0,prod_terms[]}),
    )
    logic [M-1:0][N-1:0] sum, [N-1:0] carry;
    

    gen i;
    generate
        for (i = 1; i < N-1; i++) begin : loopa
            rca_nbit #(M) u_rca (
                .a(prod_terms [i]),
                .b(prod_terms [i+1]),
                .cin(carry [i]),
                .sum(sum [i]),
                .co(carry [i+1])
            );

        end
    endgenerate

    assign  prod[M+N-1: M] = sum[N-2];




    
    // logic [N-1:0] A0, B0, Sum0, A1, B1, Sum1, A2, B2, Sum2;
    // logic co0, co1, co2; // the three carry-outs from the three adders
    // assign Prod[0] = prod_terms [0][0];
    // assign A0[N-1] = 1'b0;
    // assign A0[N-2:0] = prod_terms [0][N-1:1]; // a3b0 a2b0 a1b0
    // assign B0 = prod_terms [1]; // a3b1 a2b1 a1b1 a0b1
    // rca_Nbit_co #(N) u1 (.A(A0),.B(B0),.cin(1'b0),.Sum(Sum0),.co(co0) );
    // assign A1[N-1] = co0;
    // assign A1[N-2:0] = Sum0[N-1:1];
    // assign Prod[1] = Sum0[0];
    // assign B1 = prod_terms [2]; // a3b2 a2b2 a1b2 a0b2
    // rca_Nbit_co #(N) u2 (.A(A1), .B(B1), .cin(1'b0), .Sum(Sum1), .co(co1));
    // assign A2[N-1] = co1;
    // assign A2[N-2:0] = Sum1[N-1:1];
    // assign Prod[2] = Sum1[0];
    // assign B2 = prod_terms [3]; //a3b3 a2b3 a1b3 a0b3
    // rca_Nbit_co #(N) u3 ( A(A2),.B(B2),.cin(1'b0),.Sum(Sum2),.co(co2));
    // assign Prod [6:3] = Sum2;
    // assign Prod [7] = co2;
endmodule