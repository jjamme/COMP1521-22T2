        .text
main:
        la      $a0, prompt
        li      $v0, 4
        syscall

        li      $v0, 5
        syscall
        move    $t0, $v0

        # if $t0 <= 100 || $t0 >= 1000
        ble     $t0, 100, small_big
        bge     $t0, 1000, small_big

        la      $a0, medium_size
        li      $v0, 4
        syscall

        j       end_func

small_big:
        la      $a0, bad_size
        li      $v0, 4
        syscall

end_func:
        jr      $ra

        .data
prompt:
        .asciiz "Enter a number: "

bad_size:
        .asciiz "small/big\n"

medium_size:
        .asciiz "medium\n"
