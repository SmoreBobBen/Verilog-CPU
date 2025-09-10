module add8
    //using parameter to allow module to be resized as needed
    #(parameter N = 8) (
    input [N-1:0] a,
    input [N-1:0] b,
    input cin,
    output [N-1:0] sum,
    output cout
);

    wire [N:0] carry;
    assign carry[0] = cin;
    assign cout = carry[N];

    genvar i;

    generate
        for (i = 0; i < N; i = i + 1) begin
            fadd u0 (.a(a[i]), .b(b[i]), .sum(sum[i]),
            .cin(carry[i]), .cout(carry[i+1]));
        end
    endgenerate

endmodule
