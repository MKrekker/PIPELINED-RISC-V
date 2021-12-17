TOPLEVEL_LANG = vhdl
VHDL_SOURCES = $(shell pwd)/ALU.vhdl

TOPLEVEL = alu
MODULE = alu_tb
SIM_ARGS=--vcd=anyname.vcd 
include $(shell cocotb-config --makefiles)/Makefile.sim
