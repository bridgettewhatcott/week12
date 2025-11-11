// Implement binary state machine
module binary(
    input w,
    input clk,
    input reset,
    output [2:0] State,
    output z
);

//    assign reset = 0;
    wire [2:0] Next;

    dff zero( //v
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .Q(State[0]),
        .reset(reset)
    );

    dff one( //x
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .Q(State[1]),
        .reset(reset)
    );
    
    dff two( //y
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .Q(State[2]),
        .reset(reset)
    );
    

//state[0] = v
//state[1] = x
//state[2] = y

    //(w & (~State[0] | ~State[2])) | (~State[0] & State[1]) | (State[0] & ~State[1]);
    assign z = (~State[2] & State[1] & ~State[0]) | (State[2] & ~State[1] & ~State[0]);//State[1] & ~State[0];
    assign Next[0] = (w & ((~State[2] & ~State[0]) | (State[0] & ~State[1]))) | (~w & ((~State[0] & ~State[1]) | (State[0] & State[1])));
    assign Next[1] = (~State[0] & State[1]) | (State[0] & ~State[1]) | (~State[2] & ~State[0] & w);
    assign Next[2] = (w & ((State[2])|(State[0] & State[1])));

    

endmodule