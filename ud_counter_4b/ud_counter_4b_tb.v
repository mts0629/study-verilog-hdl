`timescale 1ns/100ps

module ud_counter_4b_tb();
    // Clock signal
    parameter PERIOD = 2;
    reg clk = 0;
    always begin
        #(PERIOD / 2) clk = ~clk;
    end

    reg        up, down;
    reg        rst_n;
    wire [3:0] count;
    wire       carry, borrow;

    ud_counter_4b counter(
        clk, up, down, rst_n, count, carry, borrow
    );

    initial begin
        rst_n  <= 0;
        up     <= 1;
        down   <= 0;

        #1 rst_n <= 1;

        #20;

        up   <= 0;
        down <= 1;

        #20;

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, counter);
    end
endmodule
