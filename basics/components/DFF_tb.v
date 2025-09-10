`timescale 1ns/100ps 
module dff_tb; // TODO [insert] testbench name

    //inputs
    reg in, reset, rval, enable; // TODO [insert] tested module inputs

    //outputs
    wire out; // TODO [insert] module outputs

    //clk cycle stuff (comment out of clk not used) ----------------
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;
    reg clk;

    initial begin
        #OFFSET
        clk = 1'b1;

        forever begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk;
        end
    end
    //end clk cycle stuff ------------------------------------------

    myDFF u0( // TODO [insert] module name and definitions
        .clk(clk),
        .in(in),
        .enable(enable),
        .reset(reset),
        .rval(rval),
        .out(out)
    );

    initial begin
        //simulation data dumped to the testbench file
        $dumpfile("testbench.vcd");
        $dumpvars(0,dff_tb); // TODO [insert] testbench name
        
        // initial values
        in=1'b0; reset=1'b1; rval=1'b0; enable=1'b0;

        // test cases
        #10 in=1'b0; reset=1'b0; enable=1'b0;
        #10 in=1'b1; reset=1'b0; enable=1'b1;
        #10 in=1'b1; reset=1'b0; enable=1'b0;
        #10 in=1'b0; reset=1'b0; enable=1'b0;
        #10 in=1'b0; reset=1'b1; enable=1'b1;
        #10 in=1'b0; reset=1'b1; enable=1'b1;
        #10 in=1'b1; reset=1'b0; enable=1'b1;
        #10 in=1'b0; reset=1'b0; enable=1'b1;

        #5 $finish;
    end
endmodule
