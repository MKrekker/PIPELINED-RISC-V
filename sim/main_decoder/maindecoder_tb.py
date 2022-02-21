import cocotb
from cocotb.triggers import Timer
import random


@cocotb.test()
async def maindecoder_tb(dut):
	"""Test adder"""

	arr = [3,111,35, 51, 99, 19, 55, 60]
	for i in range(0,8):

		op				= int(arr[i])

		dut.op.value	= op

		await Timer(5, units='ns')
