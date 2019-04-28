.data
.text
main:
	addi $t1, $t1, 25 #use t1 as fib25
	addi $t2, $t2, 1 # a
	addi $t3, $t3, 0 # b
	addi $t4, $t4, 1 # looping i
	addi $t5, $t5, 0 # t
	jal fib
	li $v0, 10 # program stop
	syscall
fib:
	add $t5, $t2 $t3 #t=a+b
	sub $t3,$t3,$t3
	add $t3,$t2,$zero #b=a
	sub $t2,$t2,$t2
	add $t2,$t5,$zero #a=t
	addi $t4, $t4 1 # use t4 as i
	bne $t4, $t1, fib
	add $t0, $t2,$zero
	jr $ra
