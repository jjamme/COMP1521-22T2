# This file will be performing a syscall which print an integer
# More information about register values and their corresponding
# syscall will be included in the link below:
# https://cgi.cse.unsw.edu.au/~cs1521/22T2/resources/mips-tute.html#IOSystemCalls

        .text				# .text segment is where the text for the code lives
main:
		li      $v0, 5      # $v0 = 5

        syscall             # syscall with $v0 = 5
                            # kind of does a `scanf("%d")` but setting $v0 = 5
                            # specifies that it's a `scanf` for an integer

        move    $t0, $v0    # return values SHOULD be given through the $v0-$v1 registers
                            # it is good practice to move them into another register
                            # whether saved or temporary depends on your use case

        move	$a0, $t0	# $a0 = $t0, notice the `move` instruction, not `li`
							# $a0 is used to specify the first argument
							# of a syscall or functions

        li      $v0, 1		# $v0 = 1
							# Kind of a "syscall number" we set to print an integer

        syscall				# perform a syscall where $v0 = 1, $a0 = 42

		jr		$ra
