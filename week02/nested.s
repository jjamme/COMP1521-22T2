        .text
main:
        li      $t0, 1
        li      $t1, 0

check_i:
        bgt     $t0, 10, end_func

        li      $t1, 0
check_j:
        bge     $t1, $t0, newline

        li      $a0, '*'
        li      $v0, 11
        syscall

        addi    $t1, $t1, 1

        j       check_j


newline:
        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t0, $t0, 1

        j       check_i

end_func:
        jr      $ra

