`timescale 1 ns/100 ps

module dbus_2b_tb();
    reg  [1:0] in0, in1, in2, in3, sel;
    wire [1:0] out;

    dbus_2b bus(in0, in1, in2, in3, sel, out);

    initial begin
        in0  <= 2'b10;
        in1  <= 2'b00;
        in2  <= 2'b11;
        in3  <= 2'b01;

        // out = in0
        sel <= 2'b00;
        #1;

        // out = in1
        sel <= 2'b01;
        #1;

        // out = in2
        sel <= 2'b10;
        #1;

        // out = in3
        sel <= 2'b11;
        #1;

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, bus);
    end
endmodule
