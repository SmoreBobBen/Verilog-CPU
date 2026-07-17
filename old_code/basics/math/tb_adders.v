`timescale 1ns/100ps 
module adder_tb; // [insert] testbench name

    //inputs
    reg a, b, cin; // [insert] tested module inputs

    //outputs
    wire sum, cout; // [insert] module outputs

    fadd u0_DUT( // [insert] module name and definitions
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        //simulation data dumped to the testbench file
        $dumpfile("testbench.vcd");
        $dumpvars(0,adder_tb); // [insert] testbench name
        
        // initial values
        a=1'b0; b=1'b0; cin=1'b0;

        // test cases
        #5 a=1'b0; b=1'b0; cin = 1'b0;
        #5 a=1'b1; b=1'b0; cin = 1'b0;
        #5 a=1'b0; b=1'b1; cin = 1'b0;
        #5 a=1'b1; b=1'b1; cin = 1'b0;
        #5 a=1'b0; b=1'b0; cin = 1'b1;
        #5 a=1'b1; b=1'b0; cin = 1'b1;
        #5 a=1'b0; b=1'b1; cin = 1'b1;
        #5 a=1'b1; b=1'b1; cin = 1'b1;

        #5 $finish;
    end
endmodule
