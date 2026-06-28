`timescale 1 ns/100 ps

module alu_4b_tb();
    reg  [3:0] a;
    reg  [3:0] b;
    reg  [3:0] op;
    wire [3:0] res;

    alu_4b alu(a, b, op, res);

    initial begin
        a  <= 4'b0110;
        b  <= 4'b0001;
        op <= 4'b0000;

        repeat(10) begin
            #1 op <= op + 1;
        end

        #1 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, alu);
    end
endmodule
