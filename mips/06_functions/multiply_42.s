        .text
main:

main__prologue:
        begin                           # begin stackframe
        push    $ra                     # | $ra
        # Prompt for input
        la      $a0, prompt
        li      $v0, 4
        syscall

        # Scan for input
        li      $v0, 5
        syscall
        move    $t0, $v0

        # Print result str
        la      $a0, result_str
        li      $v0, 4
        syscall

        # Call mult_42
                                        # I only want to use $sX instead
        move    $a0, $t0                # of $tX if I need the value in $sX
        jal     mult_42
        move    $t0, $v0

        # Print result
        la      $a0, result_str
        li      $v0, 4
        syscall

        move    $a0, $t0
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

main__epilogue:
        pop     $ra                     # | $ra
        end                             # ends current stackframe
        
        li      $v0, 0
        jr      $ra


mult_42:

mult_42__prologue:
        begin                           # starts new stackframe
        push    $ra                     # | $ra

        move    $t0, $a0

        mul     $t0, $t0, 42

mult__epilogue:
        pop     $ra                     # | $ra
        end                             # ends current stackframe

        move    $v0, $t0
        jr      $ra



        .data
prompt:
        .asciiz "Give me an integer and I'll multiply it by 42\n"

result_str:
        .asciiz "Your number multiplied by 42 is: "
