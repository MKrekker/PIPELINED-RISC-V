import cocotb
from cocotb.triggers import Timer
import random


@cocotb.test()
async def mux_tb1(dut):
	"""Test mux 3 to 1"""

	a 	= int(255)
	b 	= int(12)
	c 	= int(25)
	sel	= int(2)

	dut.a.value 	= a
	dut.b.value 	= b
	dut.c.value 	= c
	dut.sel.value  	= sel

	await Timer(5, units='ns')

	assert dut.y.value == a, "False port"

@cocotb.test()
async def mux_tb2(dut):
	"""Test mux 3 to 1"""

	a 	= int(255)
	b 	= int(12)
	c 	= int(25)
	sel	= int(1)

	dut.a.value 	= a
	dut.b.value 	= b
	dut.c.value 	= c
	dut.sel.value  	= sel

	await Timer(5, units='ns')

	assert dut.y.value == b, "False port"

@cocotb.test()
async def mux_tb3(dut):
	"""Test mux 3 to 1"""

	a 	= int(255)
	b 	= int(12)
	c 	= int(25)
	sel	= int(0)

	dut.a.value 	= a
	dut.b.value 	= b
	dut.c.value 	= c
	dut.sel.value  	= sel

	await Timer(5, units='ns')

	assert dut.y.value == c, "False port"
