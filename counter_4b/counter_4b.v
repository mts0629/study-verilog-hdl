// 4-bit counter
module counter_4b(clk, rst_n, count);
    input        clk;   // Clock signal
    input        rst_n; // Asynchronous reset signal
    output [3:0] count; // Output

    reg    [3:0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 4'h0;
        end else begin
            count <= count + 1;
        end
    end
endmodule
