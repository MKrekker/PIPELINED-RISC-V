TOPLEVEL_LANG = vhdl
VHDL_SOURCES = $(shell pwd)/adder.vhdl

TOPLEVEL = adder
MODULE = adder_tb
SIM_ARGS=--vcd=anyname.vcd 
include $(shell cocotb-config --makefiles)/Makefile.sim
