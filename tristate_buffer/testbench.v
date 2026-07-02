`timescale 1 ns/100 ps

module tristate_buffer_tb();
    reg  in, sel;
    wire out;

    tristate_buffer buffer(in, sel, out);

    initial begin
        // out = 0
        in  <= 1'b0;
        sel <= 1'b1;
        #1;

        // out = 1
        in  <= 1'b1;
        #1;

        // out = Hi-Z
        sel <= 1'b0;
        #1;
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, buffer);
    end
endmodule
