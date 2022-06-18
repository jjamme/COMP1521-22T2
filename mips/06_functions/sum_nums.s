        .text
main:

main__prologue:
        begin                           # begin stackframe
        push    $ra                     # | $ra

        # Prompt for input
        la      $a0, prompt
        li      $v0, 4
        syscall

        # Scan twice for input
        li      $v0, 5
        syscall
        move    $t0, $v0        # $t0 = x

        li      $v0, 5
        syscall
        move    $t1, $v0        # $t1 = y

        move    $a0, $t0        # first arg = $t0
        move    $a1, $t1        # second arg = $t1
        jal     sum             # call sum with args $t0 and $t1
        move    $t2, $v0        # move return value from $v0 into $t0

        # Print x
        move    $a0, $t0
        li      $v0, 1
        syscall

        # Print +
        li      $a0, '+'
        li      $v0, 11
        syscall

        # Print y
        move    $a0, $t1
        li      $v0, 1
        syscall

        # Print =
        li      $a0, '='
        li      $v0, 11
        syscall

        # Print (x + y)
        move    $a0, $t2
        li      $v0, 1
        syscall

        # Print newline
        li      $a0, '\n'
        li      $v0, 11
        syscall

main__epilogue:
        pop     $ra                     # | $ra
        end                             # ends current stackframe

        # return 0
        li      $v0, 0
        jr      $ra


sum:

sum__prologue:
        begin
        push    $ra                     # | $ra

        # Good practice to move $aX registers into other registers
        # Here it is not necessary, but is good to get into the habit of doing
        move    $t0, $a0        # $t0 = $a0
        move    $t1, $a1        # $t1 = $a1

        add     $t2, $t0, $t1   # $t2 = $t0 + $t1

sum__epilogue:
        pop     $ra                     # | $ra
        end                             # ends current stackframe

        move    $v0, $t2        # return summed numbers
        jr      $ra



        .data
prompt:
        .asciiz "Enter two numbers and I'll add them together\n"
