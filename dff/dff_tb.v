`timescale 1 ns/100 ps

module dff_tb();
    // Clock signal
    parameter CLK_PERIOD_NS = 10; // Period: 10 ns
    reg clk = 0;
    always begin
        #(CLK_PERIOD_NS / 2) clk = ~clk;
    end

    reg  d;
    wire q;

    dff ff(clk, d, q);

    initial begin
        d <= 1'b0;

        #(CLK_PERIOD_NS)
        #(CLK_PERIOD_NS) d <= 1'b1;
        #(CLK_PERIOD_NS)
        #(CLK_PERIOD_NS) d <= 1'b0;
        #(CLK_PERIOD_NS) $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, ff);
    end
endmodule
