`timescale 1 ns/100 ps

module alu_4b_tb();
    reg  [3:0] a;
    reg  [3:0] b;
    reg  [3:0] op;
    wire [3:0] res;

    alu_4b alu(a, b, op, res);

    initial begin
        a  <= 4'b0111; // h7
        b  <= 4'b0001; // h1

        // Add: h7 + h1 = h8
        op <= 4'b0000;
        #1;
        // Sub: h7 - h1 = h6
        op <= 4'b0001;
        #1;
        // And: h7 & h1 = h1 
        op <= 4'b0010;
        #1;
        // Or: h7 | h1 = h7
        op <= 4'b0011;
        #1;
        // Xor: h7 ^ h1 = h6
        op <= 4'b0100;
        #1;
        // Shift left: h7 << h1 = he
        op <= 4'b0101;
        #1;
        // Shift right: h7 >> h1 = h3
        op <= 4'b0110;
        #1;
        // Arithmetic left shift: -h8 >> h1 = -h4 (4'b1100 = hc)
        a  <= 4'b1000;
        op <= 4'b0111;
        #1;
        // Less than: -h8 < h1 -> h1
        op <= 4'b1000;
        #1;
        // Less than (unsigned): h8 > h1 -> h0
        op <= 4'b1001;
        #1;

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, alu);
    end
endmodule
