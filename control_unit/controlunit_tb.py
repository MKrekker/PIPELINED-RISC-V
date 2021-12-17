import cocotb
from cocotb.triggers import Timer
import random


@cocotb.test()
async def controlunit_tb(dut):
	"""Test adder"""
	arr = [3,111,35, 51, 99, 19, 55, 60]
	for i in range(0,8):
		op			= arr[i]
		funct3 		= random.randint(0, 7)
		funct7_5 	= random.randint(0, 1)


		dut.op.value 	   	= op
		dut.funct3.value   	= funct3
		dut.funct7_5.value 	= funct7_5

		await Timer(5, units='ns')
