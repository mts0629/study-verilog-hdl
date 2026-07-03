// tri-state buffer
module tristate_buffer(in, sel, out);
    input  in, sel;
    output out;

    // sel = 1: out = in
    // sel = 0: out = Hi-Z
    assign out = sel ? (in ? 1 : (~in ? 0 : 1'bx)) : 1'bz;
endmodule

// 2-bit data bus
module dbus_2b(in0, in1, in2, in3, sel, out);
    input  [1:0] in0, in1, in2, in3, sel;
    output [1:0] out;

    // Selector bits
    wire [3:0] dec;
    assign dec = (sel == 2'b00) ? 4'b0001 :
                 (sel == 2'b01) ? 4'b0010 : 
                 (sel == 2'b10) ? 4'b0100 : 
                 (sel == 2'b11) ? 4'b1000 : 
                 4'bz;

    wire [1:0] out_data;
    // Data 0
    tristate_buffer tbuf00(.in(in0[0]), .sel(dec[0]), .out(out_data[0]));
    tristate_buffer tbuf01(.in(in0[1]), .sel(dec[0]), .out(out_data[1]));
    // Data 1
    tristate_buffer tbuf10(.in(in1[0]), .sel(dec[1]), .out(out_data[0]));
    tristate_buffer tbuf11(.in(in1[0]), .sel(dec[1]), .out(out_data[1]));
    // Data 2
    tristate_buffer tbuf20(.in(in2[0]), .sel(dec[2]), .out(out_data[0]));
    tristate_buffer tbuf21(.in(in2[1]), .sel(dec[2]), .out(out_data[1]));
    // Data 3
    tristate_buffer tbuf30(.in(in3[0]), .sel(dec[3]), .out(out_data[0]));
    tristate_buffer tbuf31(.in(in3[1]), .sel(dec[3]), .out(out_data[1]));

    assign out = out_data;
endmodule
