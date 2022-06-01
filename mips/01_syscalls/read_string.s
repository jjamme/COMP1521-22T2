# This file will be performing a syscall which print an integer
# More information about register values and their corresponding
# syscall will be included in the link below:
# https://cgi.cse.unsw.edu.au/~cs1521/22T2/resources/mips-tute.html#IOSystemCalls

# .text segment is where the text for the code lives
        .text
main:
        # Ask for user input
        la      $a0, prompt
        li      $v0, 4
        syscall

        # Take user's input
        la      $a0, user_input # addr of label holding the string
        la      $a1, 10         # size of string
        li      $v0, 8
        syscall

        # Print user's string
        la      $a0, user_input
        li      $v0, 4
        syscall

        jr		$ra


# .data segment is where the data lives
# For us, it's more specifically, global and static variables
        .data
prompt:
		.asciiz "Enter your 10 letter string: "	# string prompt

user_input:
		.space	10                              # .space 10 = make space for 10 bytes
