// 7-segment LED decoder
module decoder_7seg(bcd, segment);
  input  [3:0] bcd;     // 0-9
  output [6:0] segment; // [a,b,c,d,e,f,g]

  assign segment = (bcd == 4'b0000) ? 7'b1111110 : // 0
                   (bcd == 4'b0001) ? 7'b0110000 : // 1
                   (bcd == 4'b0010) ? 7'b1101101 : // 2
                   (bcd == 4'b0011) ? 7'b1111001 : // 3
                   (bcd == 4'b0100) ? 7'b0110011 : // 4
                   (bcd == 4'b0101) ? 7'b1011011 : // 5
                   (bcd == 4'b0110) ? 7'b1011111 : // 6
                   (bcd == 4'b0111) ? 7'b1110000 : // 7
                   (bcd == 4'b1000) ? 7'b1111111 : // 8
                   (bcd == 4'b1001) ? 7'b1111011 : // 9
                   7'bx; // Unknown
endmodule
