module rca_nbit #(parameter N = 4)(
	input logic [N-1:0] a,
	input logic [N-1:0] b,
	input logic cin,
	output logic [N-1:0] sum,
	output logic co
);
logic [N:0]xor1;
logic [N:0]and1;
logic [N:0]and2;
logic [N:0]and3;
logic [N:0]carry;
assign carry[0] = cin;
genvar i;
generate
for(i=0;i<N;i++) begin:loop
	assign xor1[i] = carry[i]^a[i];
	assign sum[i] = xor1[i]^b[i];
	assign and1[i] = cin&a[i];
	assign and2[i] = cin&b[i];
	assign and3[i] = a[i]&b[i];
	assign carry[i+1] = and1|and2|and3;
end
endgenerate
assign co = carry[N];
//
endmodule