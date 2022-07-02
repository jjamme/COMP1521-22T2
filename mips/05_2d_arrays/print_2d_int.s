        .text
main:
        li      $t0, 0                  # row = 0

if_row_ge_N_ROW:
        # if $t0 >= N_ROW, goto end_if_row_ge_N_ROW
        bge     $t0, 2, end_if_row_gt_N_ROW

        li      $t1, 0                  # col = 0

if_col_ge_N_COL:
        # if $t1 >= N_COL, goto end_if_col_ge_N_COL
        bge     $t1, N_COL, end_if_col_ge_N_COL

        # With a 1-D array we skip sizeof(element) to jump to the start
        # of the next element from the previous one
        # We can visualise 2-D arrays as layers (rows) of 1-D arrays
        #
        # First we must "skip" to the desired layer (row) by multiplying
        # the `wanted_row` we want to be on by the number of columns there are
        # as this will skip N_COL elements `wanted_row` times
        # From here, we can then treat it like a 1-D array
        mul     $t2, $t0, N_COL         # $t2 = row * N_COL
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


N_ROW   = 2
N_COL   = 10

        .data
int_arr:
		.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
		.word 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
