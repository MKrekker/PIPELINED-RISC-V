import cocotb
from cocotb.triggers import Timer
from adder_check import adder_check
import random


@cocotb.test()
async def adder_tb1(dut):
	"""Test adder"""

	a_in 	= int(255)
	b_in 	= int(12)


	dut.a_in.value 	= a_in
	dut.b_in.value 	= b_in

	await Timer(5, units='ns')

	assert dut.c_out.value == adder_check(a_in, b_in), "false result, should be 267"

@cocotb.test()
async def randomised_test(dut):
	"""Test adder"""
	for i in range(10):
		a_in 	= random.randint(0,50000)
		b_in 	= random.randint(0,50000)


		dut.a_in.value 	= a_in
		dut.b_in.value 	= b_in

		await Timer(5, units='ns')

		assert dut.c_out.value == adder_check(a_in, b_in), "Randomised test failed "
