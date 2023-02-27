%define MACH_SYSCALL(nb) 0x2000000| nb
%define WRITE 4
extern	___error

bits 64 

section .text
   global _ft_write
       _ft_write:
           mov rax, MACH_SYSCALL(WRITE)
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