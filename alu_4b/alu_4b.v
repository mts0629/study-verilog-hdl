// 4-bit ALU
module alu_4b(a, b, op, res);
    input  [3:0] a;
    input  [3:0] b;
    input  [3:0] op;
    output [3:0] res;

    assign res = operation(a, b, op);

    function [3:0] operation;
        input [3:0] a;
        input [3:0] b;
        input [3:0] op;

        begin
            case (op)
                // RISC-V basic operations
                4'b0000: operation = a + b;            // ADD
                4'b0001: operation = a - b;            // SUB
                4'b0010: operation = a & b;            // AND
                4'b0011: operation = a | b;            // OR
                4'b0100: operation = a ^ b;            // XOR
                4'b0101: operation = a << b;           // SLL (shift left logical)
                4'b0110: operation = a >> b;           // SRL (shift right logical)
                4'b0111: operation = $signed(a) >>> b; // SRA (shift right arithmetic)
                4'b1000: operation = ($signed(a) < $signed(b)) ? 4'h1 : 4'h0;
                                                       // SLT (set less than)
                4'b1001: operation = (a < b) ? 4'h1 : 4'h0;
                                                       // SLTU (set less than unsigned)
                default: operation = 4'h0;
            endcase
        end
    endfunction
endmodule
