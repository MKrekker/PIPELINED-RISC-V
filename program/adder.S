
  
  .text
  
  
  adder: 	addi a0, zero, 4
  		addi a1, zero, 5
  jumping:	add  a1, a1, a0
  		jal jumping
  		