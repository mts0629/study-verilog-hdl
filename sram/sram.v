// 8-bit SRAM
module sram(addr, data, cs, rd, wr);
    input [9:0] addr;       // Address
    input       rd, cs, wr; // Read, chip select, write
    input [7:0] data;       // Data (input/output)

    wire [9:0] addr;
    wire       rd, cs, wr;
    wire [7:0] data;

    // 8-bit memory, 1024-bit (10-bit address)
    reg [7:0] mem[1023:0];

    // Read data
    assign data = (cs && rd) ? mem[addr] : 8'hzz;

    // Write data
    always @(addr or data or cs or wr) begin
        if (cs && wr) begin
            mem[addr] <= data;
        end
    end
endmodule
