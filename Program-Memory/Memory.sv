module mem_1rw #(
    parameter DATA_WIDTH = 64, //RV64I Instruction size
    parameter MEMORY_SIZE = 2048,
) (
    input clk,
    input reset,

    input write_enable,

    input [DATA_WIDTH-1:0]          wdata_i,
    input [$clog2(MEMORY_SIZE)-1:0] waddr_i,

    input [$clog2(MEMORY_SIZE)-1:0] raddr_i,
    input [DATA_WIDTH-1:0]          rdata_o
);

always_ff @(posedge clk) begin

end


endmodule