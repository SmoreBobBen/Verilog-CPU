WAVEFORM    := add_wave
TESTFILE    := testbench.vcd
TESTBENCH   := tb_add8.v
VFILES      := add8.v
DEPENDENCIES:= fadd.v hadd.v
CREATED     := $(WAVEFORM) $(TESTFILE)

# create waveform file (left) using given files and testbench (right)
$(WAVEFORM) : $(TESTBENCH) $(VFILES) $(DEPENDENCIES)
	iverilog -o $@ $^
	vvp $@

all: clean $(WAVEFORM) test simulate 

simulate :
	gtkwave $(TESTFILE)

test :
	echo "This is a makefile test"

clean :
	rm -f $(CREATED)
