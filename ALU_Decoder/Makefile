TOPLEVEL_LANG = vhdl
VHDL_SOURCES = $(shell pwd)/ALU_Decoder.vhdl

TOPLEVEL = alu_decoder
MODULE = aludecoder_tb
SIM_ARGS=--vcd=anyname.vcd 
include $(shell cocotb-config --makefiles)/Makefile.sim
