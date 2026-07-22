`timescale 1 ns/100 ps

module sram_tb();
    reg  [9:0] addr;
    reg        rd, cs, wr;
    reg  [7:0] data_in;
    wire [7:0] data_io;

    sram ram(addr, data_io, cs, rd, wr);

    assign data_io = (!rd && wr) ? data_in :
                     (rd && !wr) ? data_io :
                     8'bz;

    initial begin
        addr    <= 10'h0;
        rd      <= 0;
        cs      <= 0;
        wr      <= 0;
        data_in <= 0;

        #1 data_in <= 8;
        #1 addr    <= 256;
        #1 cs      <= 1;
        #1 wr      <= 1;
        #1 wr      <= 0;
        #1 cs      <= 0;

        #1 data_in <= 16;
        #1 addr    <= 512;
        #1 cs      <= 1;
        #1 wr      <= 1;
        #1 wr      <= 0;
        #1 cs      <= 0;

        #1 data_in <= 0;

        #1 addr <= 256;
        #1 cs   <= 1;
        #1 rd   <= 1;
        #1 rd   <= 0;

        #1 addr <= 512;
        #1 rd   <= 1;
        #1 rd   <= 0;

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, ram);
    end
endmodule
