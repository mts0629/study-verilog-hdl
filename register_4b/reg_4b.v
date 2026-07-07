// 4-bit register
module reg_4b(stb, en, rst_n, d, q);
    input        stb;   // Strobe signal
    input        en;    // Write enable signal
    input        rst_n; // Asynchronous reset signal
    input  [3:0] d;     // Input
    output [3:0] q;     // Output

    reg    [3:0] q;

    always @(posedge stb or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'h0;
        end else if (en) begin
            q <= d;
        end
        // Otherwise, hold data
    end
endmodule
