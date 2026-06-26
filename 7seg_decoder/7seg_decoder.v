// 7-segment LED decoder
module decoder_7seg(bcd, segment);
    input  [3:0] bcd;     // 0-9
    output [6:0] segment; // [a,b,c,d,e,f,g]

    assign segment = decode(bcd);

    function [6:0] decode;
        input [3:0] bcd;
        begin
            case (bcd)
                4'b0000: decode = 7'b1111110; // 0
                4'b0001: decode = 7'b0110000; // 1
                4'b0010: decode = 7'b1101101; // 2
                4'b0011: decode = 7'b1111001; // 3
                4'b0100: decode = 7'b0110011; // 4
                4'b0101: decode = 7'b1011011; // 5
                4'b0110: decode = 7'b1011111; // 6
                4'b0111: decode = 7'b1110000; // 7
                4'b1000: decode = 7'b1111111; // 8
                4'b1001: decode = 7'b1111011; // 9
                default: decode = 7'b0000001; // '-', unknown
            endcase
        end
    endfunction
endmodule
