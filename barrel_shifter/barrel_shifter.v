// 8-bit barrel shifter
module barrel_shifter(in, sft, out);
    input  [7:0] in;
    input  [2:0] sft;
    output [7:0] out;

    assign out = (in << sft | in >> (8 - sft));
endmodule
