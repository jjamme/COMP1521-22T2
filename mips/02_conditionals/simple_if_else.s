        .data
prompt:         .asciiz "Enter a number: "
negative_input: .asciiz "Your number is negative\n"
positive_input: .asciiz "Your number is positive\n"


        .text
main:
        # Print prompt for number input
        la      $a0, prompt
        li      $v0, 4
        syscall

        # Scan for integer
        li      $v0, 5
        syscall
        move    $t0, $v0                # $t0 = $v0

test_number:
        bgez    $t0, if_positive        # if $t0 >= 0, jump to print positive label
                                        # if it doesn't branch then $t0 MUST be < 0
                                        # so continue on to `if_negative`

if_negative:
        # Print negative input
        la      $a0, negative_input
        li      $v0, 4
        syscall

        j       end_if                  # Jump to return so that it doesn't execute
                                        # `if_positive` code

if_positive:
        # Print positive input
        la      $a0, positive_input
        li      $v0, 4
        syscall

end_if:
        li      $v0, 0
        jr      $ra
