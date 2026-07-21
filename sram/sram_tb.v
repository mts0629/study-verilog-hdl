`timescale 1 ns/100 ps

module sram_tb();
    reg [9:0] addr;
    reg       rd, cs, wr;
    reg [7:0] data;

    sram ram(addr, data, cs, rd, wr);

    initial begin
        addr <= 10'h0;
        rd   <= 0;
        cs   <= 0;
        wr   <= 0;
        data <= 0;

        #1 data <= 8;
        #1 addr <= 256;
        #1 cs   <= 1;
        #1 wr   <= 1;
        #1 wr   <= 0;
        #1 cs   <= 0;

        #1 data <= 16;
        #1 addr <= 512;
        #1 cs   <= 1;
        #1 wr   <= 1;
        #1 wr   <= 0;
        #1 cs   <= 0;

        #1 addr <= 256;
        #1 cs   <= 1;
        #1 rd   <= 1;

        #1 addr <= 512;

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, ram);
    end
endmodule
