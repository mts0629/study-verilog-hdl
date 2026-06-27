`timescale 1 ns/100 ps

module barrel_shifter_tb();
    reg  [7:0] in;
    reg  [2:0] sft;
    wire [7:0] out;

    barrel_shifter shifter(in, sft, out);

    initial begin
        in  <= 8'b01000001;
        sft <= 3'b000;

        repeat(8)
          #1 sft <= sft + 3'b001;

        #1 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, shifter);
    end
endmodule
