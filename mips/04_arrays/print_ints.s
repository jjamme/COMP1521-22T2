        .text
main:
        li      $t0, 0                          # i = 0

while_i_lt_10:
        bge     $t0, 10, end_while_i_lt_10      # if i >= 10 goto end_while_i_lt_10

        # sizeof(word) and sizeof(int) == 4 bytes
        # given an array [1, 2, 3], in memory the distance of
        # one element to the next, i.e. 1 to 2 is 1 word/4 bytes.
        # I will need to jump 4 bytes from reading from the addr of arr[0]
        # in order to reach arr[1]

        # I will show two methods to show the address incrementing
        # and another which doesn't show that as much but is cleaner
        # Please understand BOTH methods


        ##########
        #METHOD 1#
        ##########
                                                # I'll call the num below "INDEXER"
                                                # later I may call it the offset
        mul     $t1, $t0, 4                     # i = i * 4

        # Move from the start of &int_arr by the offset calc'd above
        la      $t2, int_arr                    # $t2 = &int_arr
        add     $t2, $t2, $t1                   # &int_arr + INDEXER

        # basically *(&int_arr + INDEXER)
        lw      $t3, ($t2)
        ############################################################################

        ##########
        #METHOD 2#
        ##########

        mul     $t1, $t0, 4                     # offset = i * 4
        lw      $t3, int_arr($t1)               # offset from &int_arr by $t1 (i * 4) bytes
        ############################################################################

        # print array[i]
        move    $a0, $t3
        li      $v0, 1
        syscall

        # print newline
        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t0, $t0, 1                     # i++
        b       while_i_lt_10                   # goto while_i_lt_10

end_while_i_lt_10:
        jr      $ra



        .data
int_arr:
        .word 0, 5, 10, 13, 14, 15, 19, 22, 404, 505

