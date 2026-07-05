// 4-bit register
module reg_4b(stb, d, q);
    input        stb; // Strobe signal
    input  [3:0] d;   // Input
    output [3:0] q;   // Output

    reg    [3:0] q;

    always @(posedge stb) begin
        q <= d;
    end
endmodule
