        .text
main:
        li      $t0, 24

loop:
        bge     $t0, 42, end_func

        move    $a0, $t0
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t0, $t0, 3

        j       loop

end_func:
        jr      $ra
