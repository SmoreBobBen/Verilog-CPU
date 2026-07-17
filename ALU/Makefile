# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

#enable waveform generation
WAVES ?= 1

VERILOG_SOURCES += $(PWD)/ALU.sv

# name of the toplevel module being tested
COCOTB_TOPLEVEL = ALU

# basename of the Python test file
COCOTB_TEST_MODULES = test_ALU

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

view : sim_build/ALU.fst
	gtkwave sim_build/ALU.fst
