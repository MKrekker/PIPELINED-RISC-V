.text


popcount_cook: 	li a0, 1023
		li a1, 1431655765 
		li a2, 858993459
		li a3, 252645135
		
		# x -= ((x >> 1) & 0x55555555)
		srli t0, a0, 1
		and  t0, t0, a1
		sub  a0, a0, t0
		
		# x = (x & 0x33333333) + ((x >> 2) & 0x33333333
		 
		and  t1, a0, a2
		srli t2, a0, 2
		and  t2, t2, a2
		add  a0, t1, t2
		
		# x = (x + (x >> 4)) & 0x0F0F0F0F
		srli t3, a0, 4
		add  t4, a0, t3
		and  a0, t4, a3
		
		# x += (x >> 8)
		
		srli t5, a0, 8
		add  a0, a0, t5
		
		# x += (x >> 16)
		
		srli t6, a0, 16
		add  a0, a0, t6
		
		# x & 0x0000003F
		
		andi a0, a0, 63