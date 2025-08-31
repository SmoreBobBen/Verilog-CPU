WAVEFORM := add_wave
TESTFILE := testbench.vcd
TESTBENCH := Adder_tb.v
VFILES := hadd.v fadd.v
CREATED := $(WAVEFORM) $(TESTFILE)

# create waveform file (left) using given files and testbench (right)
$(WAVEFORM) : $(TESTBENCH) $(VFILES)
	iverilog -o $@ $^
	vvp $@

all: clean $(WAVEFORM) test simulate 

simulate :
	gtkwave $(TESTFILE)

test :
	echo "This is a makefile test"

clean :
	rm -f $(CREATED)
