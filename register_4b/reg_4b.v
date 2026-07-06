// 4-bit register
module reg_4b(stb, rst_n, d, q);
    input        stb;   // Strobe signal
    input        rst_n; // Asynchronous reset signal
    input  [3:0] d;     // Input
    output [3:0] q;     // Output

    reg    [3:0] q;

    always @(posedge stb or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'h0;
        end else begin
            q <= d;
        end
    end
endmodule
