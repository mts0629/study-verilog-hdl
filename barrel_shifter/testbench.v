`timescale 1 ns/100 ps

module barrel_shifter_tb();
    reg  [7:0] in;
    reg  [2:0] sft;
    reg        lr;
    wire [7:0] out;

    barrel_shifter shifter(in, sft, lr, out);

    integer i;

    initial begin
        for (i = 0; i < 2; i = i + 1) begin
            in  <= 8'b01000001;
            sft <= 3'b000;
            lr  <= i;

            repeat(8) begin
                #1 sft <= sft + 3'b001;
            end
        end

        #1 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, shifter);
    end
endmodule
