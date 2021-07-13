main:
    	addi $a0, $zero, 19654 # a0= 19654
    	addi $a1, $zero, 100654  # a1=100654
    	addi $a2, $zero, 10065  # a2= 10065
    	jal average     # call average
    	j exit

average:
    	addi $sp, $sp, -4
    	sw $ra, 0x0($sp)    # Save $ra register into stack

    #--------------------------------------#
    #  \^o^/   Write your code here~  \^o^/#
    #--------------------------------------#
    
    	add $t0, $a0, $a1
	add $t0, $t0, $a2
	add $v0, $0, $0
    
div:
	slti $t1,$t0,3 
	bne $t1, 0, L1 
	subi $t0, $t0, 3
	addi $v0, $v0, 1
	j div

L1: lw $ra, 0x0($sp)    # Load $ra register from stack
    addi $sp, $sp, 4
    jr $ra

exit:
