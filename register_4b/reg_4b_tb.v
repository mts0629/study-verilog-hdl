`timescale 1 ns/100 ps

module reg_4b_tb();
    reg        stb;
    reg        en;
    reg        rst_n; 
    reg  [3:0] d;
    wire [3:0] q;

    reg_4b r4b(stb, en, rst_n, d, q);

    initial begin
        stb   <= 0;
        en    <= 0;
        rst_n <= 0;       // Reset
        d     <= 1'h0;

        #1 rst_n <= 1;
        #1 d     <= 4'h1;
        #1 stb   <= 1;    // q doesn't be changed
        #1 stb   <= 0;
        // q=4'h3
        #1 en    <= 1;    // Write enable
        #1 d     <= 4'h3;
        #1 stb   <= 1;    // q=4'h3
        #1 stb   <= 0;
        // En=1
        #1 d     <= 4'h5;
        #1 stb   <= 1;    // q=4'h5
        #1 stb   <= 0;
        // Reset
        #1 d     <= 4'h1;
        #1 rst_n <= 0;    // Reset, q=4'h0

        #1 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, r4b);
    end
endmodule
