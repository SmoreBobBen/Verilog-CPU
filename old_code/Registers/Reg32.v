//32-bit register made with DFFs

module Reg32(
    input clk,
    input reset,
    
    input regWrite,
    input [31:0] writeData,
    output [31:0] readData
);

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin
            myDFF bitreg (.clk(clk), .reset(reset), .enable(regWrite), .rval(1'b0),
            .in(writeData[i]), .out(readData[i]));
        end
    endgenerate

endmodule
