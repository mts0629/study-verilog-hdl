SRCS = $(wildcard ./*.v)

.PHONY: test clean

test:
	iverilog $(SRCS)
	vvp ./a.out

clean:
	@rm a.out *.vcd
