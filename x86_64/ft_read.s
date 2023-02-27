bits 64
%define MACH_SYSCALL(nb) 0x2000000| nb
%define READ 3
extern	___error

section .text
    global _ft_read
    _ft_read:
        mov rax, MACH_SYSCALL(READ)
        syscall
        jc	error_return
        ret	

    error_return:
        mov    r15, rax		
        push	r15
        call	___error		
        pop	r15
        mov	[rax], r15		
        mov	rax, -1
        ret