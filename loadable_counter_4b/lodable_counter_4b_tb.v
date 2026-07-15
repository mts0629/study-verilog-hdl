`timescale 1 ns/100 ps

module lodable_counter_4b_tb();
    // Clock signal
    parameter PERIOD = 2;
    reg clk = 0;
    always begin
        #(PERIOD / 2) clk = ~clk;
    end

    reg        load; 
    reg  [3:0] in;
    wire [3:0] count;

    lodable_counter_4b counter(clk, load, in, count);

    initial begin
        load <= 1;
        in   <= 0;      // Reset

        #1 load <= 0;

        #16

        #1 in <= 2;
        #1 load <= 1;   // Set 2
        #1 load <= 0;
        #1 in <= 0;

        #32

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, counter);
    end
endmodule
