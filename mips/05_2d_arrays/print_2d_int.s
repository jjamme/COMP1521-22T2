        .text
main:
        li      $t0, 0                  # row = 0

if_row_ge_N_ROW:
        # if $t0 >= N_ROW, goto end_if_row_ge_N_ROW
        bge     $t0, 2, end_if_row_gt_N_ROW

        li      $t1, 0                  # col = 0

if_col_ge_N_COL:
        # if $t1 >= N_COL, goto end_if_col_ge_N_COL
        bge     $t1, 10, end_if_col_ge_N_COL

        # I'll be using both methods of offset calculations again
        mul     $t2, $t0, 10            # $t2 = row * N_COL
        add     $t2, $t2, $t1           # $t2 = $t2 + col
        mul     $t2, $t2, 4             # $t2 = $t2 * sizeof(word)

        lw      $t3, int_arr($t2)

        move    $a0, $t3
        li      $v0, 1
        syscall

        # print space
        li      $a0, ' '
        li      $v0, 11
        syscall

        addi    $t1, $t1, 1             # j++
        b       if_col_ge_N_COL         # goto if_col_ge_N_COL

end_if_col_ge_N_COL:
        # print newline
        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t0, $t0, 1             # i++
        b       if_row_ge_N_ROW           # goto if_row_ge_N_ROW

end_if_row_gt_N_ROW:
        # return 0
        li      $v0, 0
        jr      $ra


        .data
N_ROW:  .word 2

N_COL:  .word 10

int_arr:
		.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
		.word 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
