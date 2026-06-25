`timescale 1 ns/100 ps

module decoder_7seg_tb();
  reg  [3:0] bcd;
  wire [6:0] segment;

  decoder_7seg decoder(bcd, segment);

  initial begin
    // Change input 0 to 9
    bcd <= 4'b0000;

    repeat(9)
      #1 bcd <= bcd + 4'b0001;
    #1 $finish;
  end

  initial begin
    $dumpfile("decoder_7seg.vcd");
    $dumpvars(0, decoder);
  end
endmodule
