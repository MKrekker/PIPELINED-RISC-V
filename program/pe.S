# uint_xlen_t pcnt(uint_xlen_t rs1)
# {
#	int count = 0;
#	for (int index = 0; index < XLEN; index++)
#		count += (rs1 >> index) & 1;
#	return count;
# }

.globl __start
  
  .text
  __start:
  
  create_stack: 
                 #create stack
    		 addi sp, sp, -16
    		 #save s0
   		 sw s0, 16(sp)
    		 #update s0
    		 addi s0, sp, 16
    		 
		#write some data in stack
                  li x18, 4
                  sw x18, -16(s0)
                  li x18, 6
                  sw x18, -12(s0)
                  li x18, 11
                  sw x18, -8(s0)
                  li x18, 17 
                  sw x18, -4(s0)
 
  
	       addi t5, zero, 0	  
  	      
init:	    	
	     # read and assign data from stack
	       lw   x10,-4(s0)       #input1(weight)
               lw   x11,-8(s0)       #input2(data) 
             
               addi t0, zero, 0    #count_pcnts
               addi x13, zero,35   #threshold
  	       
  	       
xnor:          not  x11, x11
               xor  x10, x10, x11
        
popcount:      
               srli  t3, x10, 0
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 1
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 2
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 3
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 4
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 5
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 6
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 7
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 8
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 9
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 10
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 11
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 12
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 13
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 14
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 15
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 16
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 17
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 18
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 19
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 20
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 21
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 22
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 23
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 24
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 25
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 26
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 27
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 28
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 29
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 30
               andi t2, t3, 1
               add  t0, t0, t2
               
               srli  t3, x10, 31
               andi t2, t3, 1
               add  t0, t0, t2
               
            
substract:     add  x10, zero, t0
               slli x10, x10, 1
               addi  t0, x10, -32
               add t5, t5, t0
                
result1:       blt t5, x13, result0
	       addi t4, zero, 1
	       jal end               
               
               
 result0:      addi t4, zero, 0
	       addi s0, s0, -8
               jal init 
 
 
 
  end:         addi sp, sp, 16
