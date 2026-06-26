// 4-bit multiplexer
module mux4_4b(sel, in0, in1, in2, in3, out);
    input  [1:0] sel;
    input  [3:0] in0, in1, in2, in3;
    output [3:0] out;

    assign out = (sel == 0) ? in0 :
                 (sel == 1) ? in1 :
                 (sel == 2) ? in2 :
                 (sel == 3) ? in3 :
                 4'bx; // Unknown
endmodule
