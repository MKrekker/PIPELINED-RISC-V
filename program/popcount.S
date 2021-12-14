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
	       lw   x10,-4(s0)       #input1(weight
               lw   x11,-8(s0)       #input2(data) 
             
               addi x12, zero, 32  #end pcnt_loop
               addi t0, zero, 0    #count_pcnt
               addi t1, zero, 0    #index for loop
               addi x13, zero,35   #threshold
  	       
  	       
xnor:          not  x11, x11
               xor  x10, x10, x11
        
popcount:      beq  t1, x12, substract
               srl  t3, x10, t1
               andi t2, t3, 1
               add  t0, t0, t2
               addi t1, t1, 1
               jal popcount
            
substract:     add  x10, zero, t0
               slli x10, x10, 1
               addi  t0, x10, -32
               add t5, t5, t0
                
result1:       blt t5, x13, result0
	       addi t4, zero, 1
	       jal end               #should be choose to jal init
               
               
 result0:      addi t4, zero, 0
	       addi s0, s0, -8
               jal init 
 
 
 
  end:         addi sp, sp, 16
