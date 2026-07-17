module ALU #(
    parameter WIDTH_A = 64,
    parameter WIDTH_B = 64,
    parameter WIDTH_OUTPUT = 128
) (
    input clk,
    input reset,

    input   [2:0]               opcode_i,
    input   [WIDTH_A-1:0]       A_i,
    input   [WIDTH_B-1:0]       B_i,
    output  [WIDTH_OUTPUT-1:0]  result_o
);

    //TODO make these use the actual opcodes
    localparam OPCODE_ADD   = 3'b001;
    localparam OPCODE_SUB   = 3'b010;
    localparam OPCODE_MULT  = 3'b011;
    // localparam OPCODE_DIV   = 3'b100;

    logic [WIDTH_OUTPUT-1:0] result_l;
    assign result_o = result_l;

    always_comb begin
        case (opcode_i) //TODO replace these operations with custom modules
            OPCODE_ADD: result_l = A_i + B_i;
            OPCODE_SUB: result_l = A_i - B_i;
            OPCODE_MULT: result_l = A_i * B_i;
            default: result_l = 0;
        endcase
    end

endmodule