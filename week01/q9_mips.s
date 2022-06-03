# The following link will help me find what I need in order to perform the right syscalls
# https://cgi.cse.unsw.edu.au/~cs1521/22T2/resources/mips-tute.html#IOSystemCalls
            .text
main:
        li		$a0, prompt     # argument = addr of `prompt`
        li		$v0, 4          # $v0 = 4
        syscall                 # Syscall, with $v0 = 4 to print string
                                # with address of string to print for the argument

        li      $v0, 5          # $v0 = 5
        syscall                 # Syscall will read an integer and store it in $v0
        move    $t0, $v0        # $t0 = $v0

        mul     $t1, $t0, $t0   # $t1 = $t0 * $t0

        move	$a0, $t1        # argument = integer to print
        li		$v0, 1          # $v0 = 1
        syscall                 # Syscall, with $v0 = 1 to print integer

        li      $v0, 0          # return register, $v0 = 0
        jr      $ra             # return

        .data
prompt:
        .asciiz "Enter a number: "
