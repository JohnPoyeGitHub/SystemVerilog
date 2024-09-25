module mult_mnbit #(parameter M = 4, parameter N = 4)(
	input logic[M-1:0] a,
	input logic [N-1:0] b,
	output logic [M+N-1:0] prod
);
logic [N+M:0] C;

    // assign C[0] =cin;
    
    // Generate block to create the N full adders
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

    
endmodule