        .text
main:
        li      $t0, 0

scan_loop:
        bge     $t0, 10, end_scan

        li      $v0, 5
        syscall
        move    $t2, $v0

        mul     $t1, $t0, 4
        sw      $t2, numbers($t1)

        addi    $t0, $t0, 1
        b       scan_loop

end_scan:
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
        .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
