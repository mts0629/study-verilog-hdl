`timescale 1 ns/100 ps

module reg_4b_tb();
    reg        stb;
    reg  [3:0] d;
    wire [3:0] q;

    reg_4b r4b(stb, d, q);

    initial begin
        stb <= 1;
        d  <= 1'h0;

        #1 stb <= 0;
        #1 d <= 4'h5;
        #1 stb <= 1;
        #1 stb <= 0;
        #1 d <= 4'h3;
        #1 stb <= 1;
        #1 d <= 4'h1;
        #1 stb <= 0;
        #1 stb <= 1;
        #1 stb <= 0;

        #1 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, r4b);
    end
endmodule
