        .text
main:
        li      $t0, 20                 # x = 20

start_loop:
        bge     $t0, 35, end_loop       # if x >= 35, goto end_loop

        # print x
        move    $a0, $t0
        li      $v0, 1
        syscall

        # print newline
        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t0, $t0, 1             # x += 1

        j       start_loop              # goto start_loop

end_loop:
        li      $v0, 0
        jr      $ra
