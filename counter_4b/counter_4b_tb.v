`timescale 1 ns/100 ps

module counter_4b_tb();
    // Clock signal
    parameter PERIOD = 2;
    reg clk = 0;
    always begin
        #(PERIOD / 2) clk = ~clk;
    end

    reg        rst_n; 
    wire [3:0] count;

    counter_4b counter(clk, rst_n, count);

    initial begin
        rst_n <= 0;    // Reset
        #2 rst_n <= 1;

        #32

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, counter);
    end
endmodule
