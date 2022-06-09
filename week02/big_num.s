        .text
main:
        la      $a0, prompt
        li      $v0, 4
        syscall

        li      $v0, 5
        syscall
        move    $t0, $v0                # x = $t0

        ble     $t0, 46340, square      # if $t0 < 46340 goto square
        
        la      $a0, too_big
        li      $v0, 4
        syscall

        j       end_func

square:
        mul     $t1, $t0, $t0

        move    $a0, $t1
        li      $v0, 1
        syscall

end_func:
        li      $v0, 0
        jr      $ra

        .data
prompt:
        .asciiz "Enter a number: "

too_big:
        .asciiz "square too big for 32 bits\n"
