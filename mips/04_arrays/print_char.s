        .text
main:
        li      $t0, 0                          # i = 0

while_i_lt_10:
        bge     $t0, 10, end_while_i_lt_10      # if i >= 10 goto end_while_i_lt_10

        # sizeof(char) and sizeof(byte) == 1 byte
        # given an array ['a', 'b', 'c'], in memory the distance of
        # one element to the next, i.e. 'a' to 'b' is 1 char/1 byte.
        # I will need to jump 1 byte from reading from the addr of arr[0]
        # in order to reach arr[1]

        # I will show two methods to show the address incrementing
        # and another which doesn't show that as much but is cleaner
        # Please understand BOTH methods


        ##########
        #METHOD 1#
        ##########
                                                # I'll call the num below "INDEXER"
                                                # later I may call it the offset
        mul     $t1, $t0, 1                     # i = i * 1     Obviously can be omitted

        # Move from the start of &int_arr by the offset calc'd above
        la      $t2, char_arr                   # $t2 = &char_arr
        add     $t2, $t2, $t1                   # &int_arr + INDEXER

        # basically *(&int_arr + INDEXER)
        lb      $t3, ($t2)
        ############################################################################

        ##########
        #METHOD 2#
        ##########

        mul     $t1, $t0, 1                      # offset = i * 1
        lb      $t3, char_arr($t1)               # offset from &char_arr by $t1 (i * 4) bytes
        ############################################################################

        # print array[i]
        move    $a0, $t3
        li      $v0, 11
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
char_arr:
        .byte 'a', 'b', 'z', 'y', 'x', 'w', 'v', 'u', 't', 'g'
