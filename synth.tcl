# Read design (from ${DESIGN})
yosys read_verilog $::env(DESIGN)

# Elaborate design hierarchy
yosys hierarchy -check -top $::env(TOP_MODULE)

# The high-level stuff
yosys proc; yosys opt
yosys fsm; yosys opt
yosys memory; yosys opt

# Mapping to internal cell library
yosys techmap; yosys opt

# Cleanup
yosys clean

# Write synthesized design
yosys write_verilog synth.v

# Visualize the design (in simple RTL netlist)
yosys show
