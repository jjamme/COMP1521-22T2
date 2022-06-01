# Syscalls
Syscall is short for System Call.

A system call is **a request for service that a program makes of the kernel**. The service is generally something that only the kernel has the privilege to do, such as doing I/O. Source: https://www.gnu.org/s/libc/manual/html_node/System-Calls.html

In other words, you're asking the brains of the OS (kernel) to perform an action (syscall) and that could be a syscall for printing an integer, character or a string, as well as reading for them.

I've created two files which use a syscall to print an integer and string. Additionally, another two which read in an integer and string.
