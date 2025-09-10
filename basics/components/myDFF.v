//Module definition for a positive-edge-triggered D-flip-flop
//also has asynchronous reset with an assignable reset value

module myDFF(
    input clk,
    input reset,
    input enable,
    input rval,
    input in,
    output out
);

    reg newout;
    assign out = newout;

    //always @(posedge clk) begin
    //    newout = in;
    //end
    //TODO

    always @(posedge clk) begin
        if (reset == 1)
            newout = rval;
        else begin
            if (enable == 1)
                newout = in;
            else
                newout = newout;
        end
    end

endmodule
