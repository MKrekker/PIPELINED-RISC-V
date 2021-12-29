import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
import random


@cocotb.test()
async def controlunit_tb(dut):
	"""Test data memory"""

	clock = Clock(dut.clk, 10, units="us")
	cocotb.start_soon(clock.start())

	await RisingEdge(dut.clk)

	for i in range(10):

		dut.addr_port.value  = random.randint(0,255)
		dut.write_data.value = random.randint(0,255)
		dut.write_en.value   = random.randint(0,1)
		await RisingEdge(dut.clk)
