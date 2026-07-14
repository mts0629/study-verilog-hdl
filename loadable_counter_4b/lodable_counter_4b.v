// 4-bit lodable counter
module lodable_counter_4b(clk, load, in, count);
    input        clk;   // Clock signal
    input        load;  // Load enable signal
    input  [3:0] in;    // Load input value
    output [3:0] count; // Output

    reg    [3:0] count;

    always @(posedge clk or posedge load) begin
        if (load) begin
            count <= in;
        end else begin
            count <= count + 1;
        end
    end
endmodule
