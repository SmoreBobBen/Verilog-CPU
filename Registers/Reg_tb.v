`timescale 1ns/100ps 
module Reg_tb; // TODO [insert] testbench name

    //inputs
    reg reset;
    reg RegWrite; 
    reg [3:0] readReg1, readReg2, writeReg; 
    reg [31:0] writeData; // TODO [insert] tested module inputs

    //outputs
    wire [31:0] readData1, readData2; // TODO [insert] module outputs

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

    Registers u0 ( // TODO [insert] module name and definitions
        .clk(clk),
        .reset(reset),

        .readReg1(readReg1),
        .readReg2(readReg2),
        .writeReg(writeReg),
        .writeData(writeData),
        .regWrite(regWrite),
        .readData1(readData1),
        .readData2(readData2)
    );

    initial begin
        //simulation data dumped to the testbench file
        $dumpfile("testbench.vcd");
        $dumpvars(0,Reg_tb); // TODO [insert] testbench name
        
        // initial values
        reset=1'b1;

        // test cases
        //#10 in=1'b0; reset=1'b0; enable=1'b1;

        #5 $finish;
    end
endmodule
