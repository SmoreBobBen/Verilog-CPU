// read to and write from a series of 32 registers, 32 bits each

module Registers(
    //basics
    input clk,
    input reset,

    //4-bit addresses
    input [3:0] readReg1,
    input [3:0] readReg2,
    input [3:0] writeReg,

    //32-bit write data
    input [31:0] writeData,

    //control inputs
    input regWrite,

    //32-bit read data
    output [31:0] readData1,
    output [31:0] readData2
);

    //32 bit register module

endmodule
