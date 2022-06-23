        .text
main:
main__prologue:
        begin
        push    $ra

main__body:
        li      $a0, 3
        li      $a1, 4
        la      $a2, M
        li      $a3, 2
        jal     change          # change(3, 4, M, 2)


main__epilogue:
        pop     $ra
        end

main__end:
        jr      $ra



change:
change__prologue:
        begin
        push    $ra

change__body:
        # Move $aX into $tX so that we can use it for
        # other syscalls or functions calls
        move    $t0, $a0
        move    $t1, $a1
        move    $t2, $a2
        move    $t3, $a3

        li      $t4, 0                                  # $t4 = row = 0

while_row_ge_nrows:
        bge     $t4, $t0, end_while_row_ge_nrows        # row >= nrows

        li      $t5, 0                                  # $t5 = col = 0
while_col_ge_ncols:
        bge     $t5, $t1, end_while_col_ge_ncols        # col >= ncols

        mul     $t6, $t4, $t1                           # $t6 = row * ncols
        add     $t6, $t6, $t5                           # $t6 = $t6 + col
        mul     $t6, $t6, 4                             # $t6 = $t6 * sizeof(word)

        lw      $t7, M($t6)                             # $t7 = *(&M + offset)
        mul     $t8, $t3, $t7                           # $t8 = factor * $t7

        sw      $t8, M($t6)                             # M[row][col] = $t8

        addi    $t5, $t5, 1                             # col++
        b       while_col_ge_ncols
end_while_col_ge_ncols:

        addi    $t4, $t4, 1                             # row++
        b       while_row_ge_nrows
end_while_row_ge_nrows:


        li      $t4, 0
print_i_loop:
        bge     $t4, $t0, end_print_i_loop

        li      $t5, 0
print_j_loop:
        bge     $t5, $t1, end_print_j_loop

        mul     $t6, $t4, $t1
        add     $t6, $t6, $t5
        mul     $t6, $t6, 4

        lw      $t7, M($t6)

        move    $a0, $t7
        li      $v0, 1
        syscall

        li      $a0, ' '
        li      $v0, 11
        syscall

        addi    $t5, $t5, 1
        b       print_j_loop
end_print_j_loop:
        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t4, $t4, 1
        b       print_i_loop
end_print_i_loop:


change__epilogue:
        pop     $ra
        end
change__end:
        jr      $ra


        .data
M:
        .word 1, 2, 3, 4
        .word 3, 4, 5, 6
        .word 5, 6, 7, 8
