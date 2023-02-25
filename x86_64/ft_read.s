bits 64
%define MACH_SYSCALL(nb) 0x2000000| nb
%define READ 3

section .text
    global _ft_read
    _ft_read:
        mov rax, MACH_SYSCALL(READ)
        syscall
        jc	error_exit
        ret	

    error_exit:
        mov rax, -1,
        ret