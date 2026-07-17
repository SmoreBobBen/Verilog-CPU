`timescale 1ns/100ps 
module tb_add8; // [insert] testbench name

    //inputs
    reg cin;
    reg [7:0] a, b; // [insert] tested module inputs

    //outputs
    wire cout;
    wire [7:0] sum; // [insert] module outputs

    add8 u0( // [insert] module name and definitions
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        //simulation data dumped to the testbench file
        $dumpfile("testbench.vcd");
        $dumpvars(0,tb_add8); // [insert] testbench name
        
        // initial values
        a=8'h00; b=8'h00; cin=1'b0;

        // test cases
        #5 a=8'h00; b=8'h00; cin = 1'b0;
        #5 a=8'h01; b=8'h00; cin = 1'b1;
        #5 a=8'h01; b=8'h01; cin = 1'b1;
        #5 a=8'h02; b=8'h01; cin = 1'b1;
        #5 a=8'h02; b=8'h02; cin = 1'b1;
        #5 a=8'h03; b=8'h02; cin = 1'b1;
        #5 a=8'h03; b=8'h03; cin = 1'b1;
        #5 a=8'h04; b=8'h03; cin = 1'b1;
        #5 a=8'h04; b=8'h04; cin = 1'b1;
        #5 a=8'h0f; b=8'h04; cin = 1'b1;
        #5 a=8'h04; b=8'h0f; cin = 1'b1;
        #5 a=8'h70; b=8'h7f; cin = 1'b1;
        #5 a=8'hff; b=8'hff; cin = 1'b1;
        #5 a=8'h00; b=8'h00; cin = 1'b0;

        #5 a=8'h00; b=8'h00; cin = 1'b0;
        #5 a=8'hf0; b=8'h0f; cin = 1'b0;
        #5 a=8'h0f; b=8'hf0; cin = 1'b0;
        #5 a=8'h55; b=8'haa; cin = 1'b0;
        #5 a=8'haa; b=8'h55; cin = 1'b0;
        #5 a=8'h55; b=8'haa; cin = 1'b1;
        #5 a=8'haa; b=8'h55; cin = 1'b1;

        #5 a=8'hff; b=8'h00; cin = 1'b1;
        #5 a=8'hff; b=8'h01; cin = 1'b1;
        #5 a=8'hff; b=8'h02; cin = 1'b1;
        #5 a=8'hff; b=8'h03; cin = 1'b1;
        #5 a=8'hff; b=8'h05; cin = 1'b1;
        #5 a=8'hff; b=8'h0a; cin = 1'b1;
        #5 a=8'hff; b=8'h0f; cin = 1'b1;
        #5 a=8'hff; b=8'h1f; cin = 1'b1;
        #5 a=8'hff; b=8'h2f; cin = 1'b1;
        #5 a=8'hff; b=8'h3f; cin = 1'b1;
        #5 a=8'hff; b=8'h5f; cin = 1'b1;

        #5 $finish;
    end
endmodule
