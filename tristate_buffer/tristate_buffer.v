// tri-state buffer
module tristate_buffer(in, sel, out);
    input  in, sel;
    output out;

    // sel = 1: out = in
    // sel = 0: out = Hi-Z
    assign out = sel ? (in ? 1 : (~in ? 0 : 1'bx)) : 1'bz;
endmodule
