// Implement one-hot state machine

module one_hot(
    input w,
    input clk, reset,
    output Astate, Bstate, Cstate, Dstate, Estate,
    output z
);

//    assign reset = 0;
    wire Anext, Bnext, Cnext, Dnext, Enext;
 
    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(Astate),
        .reset(reset)
    );

    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate),
        .reset(reset)
    );

    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate),
        .reset(reset)
    );
    
    dff Ddff (
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .Q(Dstate),
        .reset(reset)
    );
    
    dff Edff (
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .Q(Estate),
        .reset(reset)
        
    );

    assign z = Cstate | Estate;

    assign Anext = 0;
    assign Bnext = ~w & (Astate | Estate | Dstate);
    assign Cnext = ~w & (Bstate | Cstate);
    assign Dnext = w &(Astate | Cstate | Bstate);
    assign Enext = w & (Estate | Dstate);
    
endmodule