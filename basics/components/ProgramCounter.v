// Used to track which address in instruction memory is being executed

module programCounter (
    input clk,      // used for synchronicity
    input reset,    // go to first instruction
    input start,    // address of first instruction
    input source,   // 0 for counting up, 1 for jumping
    input [31:0] jumpval, // address to jump to
    output pc       // next instruction address
);
