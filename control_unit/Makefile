TOPLEVEL_LANG = vhdl
VHDL_SOURCES = $(shell pwd)/ALU_Decoder.vhdl $(shell pwd)/main_decoder.vhdl $(shell pwd)/control_unit.vhdl
TOPLEVEL = control_unit
MODULE = controlunit_tb
SIM_ARGS=--vcd=anyname.vcd 
include $(shell cocotb-config --makefiles)/Makefile.sim
