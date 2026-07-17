module fadd(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire absum, abcout, cicout;

    hadd abadd (.a(a), .b(b), .sum(absum), .cout(abcout));
    hadd ciadd (.a(absum), .b(cin), .sum(sum), .cout(cicout));

    assign cout = abcout | cicout;

endmodule
