main:
        # prompt for number
        li      $v0, 4
        la      $a0, prompt
        syscall

        # take user input
        li      $v0, 5
        syscall
        move    $t0, $v0

        blt     $t0, 42, low_guess
        bgt     $t0, 42, high_guess

        # output correct guess
        li      $v0, 4
        la      $a0, correct_str
        syscall

        j       finish

high_guess:
        # notify number is too high
        li      $v0, 4
        la      $a0, high_str
        syscall
        j       finish

low_guess:
        # notify number is low
        li      $v0, 4
        la      $a0, low_str
        syscall


        j       finish

finish:
        jr      $ra

        .data
prompt:
        .asciiz "Guess what number I'm thinking: "

correct_str:
        .asciiz "Correct answer!\n"

high_str:
        .asciiz "Too high\n"

low_str:
        .asciiz "Too low\n"
