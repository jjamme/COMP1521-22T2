        .text
main:
        li      $t0, 0          # $t0 = row

while_row_ge_six:
        bge     $t0, 6, end_row_ge_six

        li      $t1, 0
while_col_ge_twelve:
        bge     $t1, 12, end_while_col_ge_twelve

        la      $t2, flag                               # $t2 = &flag
        mul     $t3, $t0, 12                            # $t3 = row * number_of_columns
        add     $t3, $t3, $t1                           # $t3 = $t3 + col

        add     $t4, $t3, $t2                           # $t4 = offset + &flag

        lb      $a0, $t4
        li      $v0, 11
        syscall

        addi    $t1, $t1, 1
        b       while_col_ge_twelve
end_while_col_ge_twelve:

        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t0, $t0, 1
        b       while_row_ge_six

end_row_ge_six:



main__end:
        jr      $ra


        .data
flag:
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
