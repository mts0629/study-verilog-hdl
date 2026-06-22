// Timescale 1 ns, round to 100 ps
`timescale 1 ns/100 ps

// Test bench for 4-bit adder
module adder4b_tb();
  reg   [3:0] in1, in2;
  wire  [3:0] result;
  wire        cy;

  adder4b adder(in1, in2, result, cy);

  initial begin
    // Initial inputs
    in1 <= 4'b0000;
    in2 <= 4'b0000;

    // Change inputs for every 1 ns
    #1 in1 <= 4'b0001;
    #1 in2 <= 4'b0001;
    #1 in2 <= 4'b0011;
    #1 in2 <= 4'b0111;
    #1 in2 <= 4'b1111;
    #1 $finish;
  end

  initial begin
    // Dump VCD (Value Change Dump)
    $dumpfile("adder4b.vcd");
    $dumpvars(0, adder);
  end
endmodule
