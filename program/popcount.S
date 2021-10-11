


	.text
	
Init:	addi a0, zero, 0
	addi a1, zero, 0
	addi a2, zero, 32
	addi a3, zero, 15
	
for:	bge  a1, a2, end_for	
	srl  t0, a3, a1
	andi t0, t0, 1
	add  a0, a0, t0
	addi a1, a1, 1
	jal for
end_for:
	sw a1, 0(a0)
	lw a1, 0(a0)