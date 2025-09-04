//Module definition for a positive-edge-triggered D-flip-flop
//also has asynchronous reset with an assignable reset value

module myDFF(
    input clk,
    input in,
    input enable,
    input reset,
    input rval,
    output out
);

    reg newout;
    assign out = newout;

    //always @(posedge clk) begin
    //    newout = in;
    //end

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
