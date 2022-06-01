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
                  
  	    	
	     # read and assign data from stack
init:	       lw   x11,-8(s0)
	        lw   x10,-4(s0)       #input1(weight)
                      #input2(data) 
               addi s0, s0, -8
               beq x10, zero, end
               jal init 
               
  end:         addi sp, sp, 16
