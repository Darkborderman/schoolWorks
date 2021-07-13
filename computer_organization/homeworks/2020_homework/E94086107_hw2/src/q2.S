main:
    addi $a0, $zero, 10 # n = 10
    addi $a1, $zero, 5  # m = 5
    jal pascal          # call pascal(10, 5)
    j exit

pascal:
    	addi $sp, $sp, -4
 	sw $ra, 0x0($sp)    # Save $ra register into stack

    #--------------------------------------#
    #  \^o^/   Write your code here~  \^o^/#
    #--------------------------------------#
	addi $sp, $sp, -12 #store variable
	sw $t0, 8($sp)
	sw $a0, 4($sp)
	sw $a1, 0($sp)
	
	bne $a0, $a1, test2 # m==n?
	addi $v0, $0, 1 # if yes, return 1
	j rtn
	
test2:	
	bne $a1, 0, gen # m==0?
	addi $v0, $0, 1 #if yes, return 1
	jal rtn

gen:
	addi $a0, $a0, -1 # get n-1 
	jal pascal # get C(n-1, m)
	addi $t0, $v0, 0 # save C(n-1) in temp, then $v0 will save other return value next.
	addi $a1, $a1, -1 # get m-1, and we have n-1
	jal pascal #get C(n-1, m-1)
	add $v0, $t0, $v0 # get C(n-1, m-1) + C(n-1, m), save in $v0 and goto return

rtn: # return
	lw $t0, 8($sp) #load variable
	lw $a0, 4($sp)
	#lw $ra, 4($sp)
	lw $a1, 0($sp)
	addi $sp, $sp, 12#???????????????sp??
	
    	lw $ra, 0x0($sp)    # Load $ra register from stack
    	addi $sp, $sp, 4
   	jr $ra

exit:
