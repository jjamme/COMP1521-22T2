# This file will be performing a syscall which print an integer
# More information about register values and their corresponding
# syscall will be included in the link below:
# https://cgi.cse.unsw.edu.au/~cs1521/22T2/resources/mips-tute.html#IOSystemCalls

        .text				# .text segment is where the text for the code lives
main:
        li      $a0, 42		# $a0 = 42
							# $a0 is used to specify the first argument
							# of a syscall or functions

        li      $v0, 1		# $v0 = 1
							# Kind of a "syscall number" we set to print an integer

        syscall				# perform a syscall where $v0 = 1, $a0 = 42

		jr		$ra
