WAVEFORM    := reg_wave
TESTFILE    := testbench.vcd
TESTBENCH   := Reg32_tb.v
VFILES      := Reg32.v
DEPENDENCIES:= ../basics/components/myDFF.v
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
