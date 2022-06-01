# This file will be performing a syscall which print an integer
# More information about register values and their corresponding
# syscall will be included in the link below:
# https://cgi.cse.unsw.edu.au/~cs1521/22T2/resources/mips-tute.html#IOSystemCalls

# .text segment is where the text for the code lives
        .text
main:
        la      $a0, my_string	# $a0 = address of the string
                                # $a0 is used to specify the first argument
                                # of a syscall or functions

        li      $v0, 4		    # $v0 = 4
                                # Kind of a "syscall number" we set to print an integer

        syscall				    # perform a syscall where $v0 = 4, $a0 = addr of my_string

        jr		$ra


# .data segment is where the data lives
# For us, it's more specifically, global and static variables
        .data
                                # label for the string
                                # referring to the label in $a0 above
my_string:                      # passes its address to it
        .asciiz "Hello World!\n"  # .asciiz = ascii data, z(ero)/null terminated

