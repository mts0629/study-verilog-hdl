`timescale 1 ns/100 ps

module decoder_7seg_tb();
    reg  [3:0] bcd;
    wire [6:0] segment;

    decoder_7seg decoder(bcd, segment);

    initial begin
        // Change input 0 to x
        bcd <= 4'b0000;

        repeat(10)
          #1 bcd <= bcd + 4'b0001;
        #1 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, decoder);
    end
endmodule
