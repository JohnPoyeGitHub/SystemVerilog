module mult_mnbit #(parameter M = 4, parameter N = 4)(
	input logic[M-1:0] a,
	input logic [N-1:0] b,
	output logic [M+N-1:0] prod
);
logic [N+M:0] C;

    // assign C[0] =cin;
    
    // Generate block to create the N full adders
    genvar i;
    generate
        for (i = 0; i < N; i++) begin : gen_full_adders
            fa_delay fa (
                .a(A[i]),
                .b(B[i]),
                .sum(Sum[i]),
                .cout(C[i+1])
            );
        end
    endgenerate

    assign co = C[N];
//
endmodule