// tri-state buffer
module tristate_buffer(in, sel, out);
    input  in, sel;
    output out;

    assign out = sel ? in : 1'bz;
endmodule
