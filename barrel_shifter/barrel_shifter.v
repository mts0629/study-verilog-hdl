// 8-bit barrel shifter
module barrel_shifter(in, sft, lr, out);
    input  [7:0] in;
    input  [2:0] sft;
    input        lr;  // 1=left, 0=right
    output [7:0] out;

    assign out = lr ? (in << sft | in >> (8 - sft))
                    : (in >> sft | in << (8 - sft));
endmodule
