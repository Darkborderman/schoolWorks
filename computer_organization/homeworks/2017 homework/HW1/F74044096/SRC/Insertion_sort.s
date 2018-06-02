.data
Array: .word 9, 2, 8, 1, 6, 5, 4, 10, 3, 7 # you can change the element of array

.text
main:
	addi $t0, $zero, 4097      # $t0 = 0x00001001
	sll  $t0, $t0, 16          # set the base address of your array into $t0 = 0x10010000    

	addi $s1, $zero, 36	
	addi $t1, $zero, 0	# i
				# $t3	array[i]
				# $t4	array[i - 1]
				

loop1:	
	addi $t2, $t1, 4		#i = (i - 1) + 1
	
	add $s0,$t2,$t0		#a[i]--address
	lw $t3,	0($s0)
	
	addi $t1, $t2, -4	#i = j - 1
	
loop2:
	add $s0,$t1,$t0		#a[i - 1]--address
	lw $t4,	0($s0)

	addi $t5, $zero, -4
	slt $t6, $t5, $t1		# $t6 (-4 < (i - 1))?1:0
	slt $t7, $t3, $t4		# $t7 (array[i] < array[i - 1])?1:0
	and $t8, $t6, $t7		# $t8 ($t6 && $t7)
	
	beq $t8,$zero,loop3
	
	addi $t9, $t1, 4
	add $s0,$t9,$t0
	sw $t4, 0($s0)		#write array[i+1] into array[i]
	
	addi $t1, $t1, -4	#i = i-1
	j loop2
loop3:
	addi $t1, $t1, 4	#i = i+1
	add $s0, $t1, $t0
	sw $t3, 0($s0)		#write tmp into array[i]
	
	bne $t2, $s1, loop1

	li   $v0, 10               # program stop
	syscall