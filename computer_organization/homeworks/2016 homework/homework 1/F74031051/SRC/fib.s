
main:   addi $t0 $t0 0
        addi $t1 $t1 1
        addi $t2 $t2 0
        addi $t3 $t3 0        # counter

FOR:    add $t0 $t1 $t2
        add $t2 $zero $t1
        add $t1 $zero $t0
        addi $t3 $t3 1
        bne $t3 24 FOR
        sw $t0 0($t0)



        jr $ra          # retrun to caller