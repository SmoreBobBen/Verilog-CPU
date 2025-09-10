`timescale 1ns/100ps 
module Reg32_tb; // TODO [insert] testbench name

    //inputs
    reg reset;
    reg regWrite; 
    reg [31:0] writeData; // TODO [insert] tested module inputs

    //outputs
    wire [31:0] readData; // TODO [insert] module outputs

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

    Reg32 theregs ( // TODO [insert] module name and definitions
        .clk(clk),
        .reset(reset),

        .regWrite(regWrite),
        .writeData(writeData),
        .readData(readData)
    );

    initial begin
        //simulation data dumped to the testbench file
        $dumpfile("testbench.vcd");
        $dumpvars(0,Reg32_tb); // TODO [insert] testbench name
        
        // initial values
        reset=1'b1;
        regWrite=1'b0; writeData=32'h00000000;

        // test cases
        #10 reset=1'b0;
        #20 writeData=32'hffffffff;
        #20 regWrite=1'b1;
        #20 writeData=32'hbabafffb;

        #5 $finish;
    end
endmodule
