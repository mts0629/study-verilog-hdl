// 4-bit up/down counter
module ud_counter_4b(clk, up, down, rst_n, count, carry, borrow);
    input        clk;      // Clock
    input        up, down; // Up/down
    input        rst_n;    // Reset
    output [3:0] count;    // Output
    input        carry;    // Carry
    input        borrow;   // Borrow

    reg    [3:0] count;
    wire         carry, borrow;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 0;
        end else if (up & !down) begin
            // Count up
            if (count == 9) begin
                count <= 0; // Wraparound
            end else begin
                count <= count + 1;
            end
        end else if (!up & down) begin
            // Count down
            if (count == 0) begin
                count <= 9; // Wraparound
            end else begin
                count <= count - 1;
            end
        end
    end
endmodule
