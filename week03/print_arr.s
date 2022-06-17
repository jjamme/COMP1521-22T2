        .text
main:
        li      $t0, 0

start_print:
        bge     $t0, 10, end_print

        #la      $t1, numbers
        #mul     $t3, $t0, 4
        #add     $t1, $t1, $t3
        #lw      $t2, ($t1)

        mul     $t1, $t0, 4
        lw      $t2, numbers($t1)

        move    $a0, $t2
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t0, $t0, 1
        b       start_print

end_print:
        jr      $ra

        .data
numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
