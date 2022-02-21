import cocotb
from cocotb.triggers import Timer


@cocotb.test()
def mux_tb1(dut):
	"""Test mux 2 to 1"""

	port_in1 = int(255)
	port_in2 = int(12)
	sel		 = int(0)

	dut.port_in1.value = port_in1
	dut.port_in2.value = port_in2
	dut.sel.value	   = sel

	yield Timer(5, units='ns')

	assert dut.port_out.value == port_in1, "False port"

@cocotb.test()
def mux_tb2(dut):
	"""Test mux 2 to 1"""

	port_in1 = int(255)
	port_in2 = int(12)
	sel		 = int(1)

	dut.port_in1.value = port_in1
	dut.port_in2.value = port_in2
	dut.sel.value	   = sel

	yield Timer(5, units='ns')

	assert dut.port_out.value == port_in1, "False port"
