import cocotb
from cocotb.triggers import Timer
import random


@cocotb.test()
async def alu_tb(dut):
	"""Test adder"""
	for i in range(15):
		src_a 		= random.randint(0, 50000)
		src_b 		= random.randint(0, 50000)
		alu_control = random.randint(0, 7)


		dut.SrcA.value 		 = src_a
		dut.SrcB.value 		 = src_b
		dut.ALUControl.value = alu_control

		await Timer(5, units='ns')
