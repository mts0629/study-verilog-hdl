`timescale 1 ns/100 ps

module mux4_4b_tb();
    reg  [1:0] sel;
    reg  [3:0] in0, in1, in2, in3;
    wire [3:0] result;

    mux4_4b mux(sel, in0, in1, in2, in3, result);

    initial begin
        sel <= 2'b00;
        in0 <= 4'b0001;
        in1 <= 4'b0010;
        in2 <= 4'b0100;
        in3 <= 4'b1000;

        #1 sel <= 2'b01;
        #1 sel <= 2'b10;
        #1 sel <= 2'b11;
        #1 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, mux);
    end
endmodule
