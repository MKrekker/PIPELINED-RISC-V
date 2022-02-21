import cocotb
from cocotb.triggers import Timer
import random


@cocotb.test()
async def controlunit_tb(dut):
	"""Test adder"""
	for i in range(15):
		op5			= random.randint(0,1)
		funct3 		= random.randint(0, 7)
		funct7_5 	= random.randint(0, 1)
		ALUOp	    = random.randint(0, 3)


		dut.op5.value 	   	= op5
		dut.funct3.value   	= funct3
		dut.funct7_5.value 	= funct7_5
		dut.ALUOp.value		= ALUOp

		await Timer(5, units='ns')
