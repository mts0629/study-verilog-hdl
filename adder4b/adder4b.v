// 4-bit adder
module adder4b(in1, in2, out, cy);
    input  [3:0] in1, in2; // Inputs
    output [3:0] out;      // Output
    output       cy;       // Carry

    wire [4:0] res;
    assign res = in1 + in2;
    assign cy  = res[4];
    assign out = res[3:0];
endmodule
