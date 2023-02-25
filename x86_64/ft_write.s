%define MACH_SYSCALL(nb) 0x2000000| nb
%define WRITE 4
extern	___error

bits 64 

section .text
   global _ft_write
       _ft_write:
           mov rax, MACH_SYSCALL(WRITE)
           syscall
           jc	error_exit
           ret	

       error_exit:
            mov         r15, rax            ; save errno
            call        ___error            ; retrieve address to errno
            mov         [rax], r15          ; put errno in return value of __error (pointer to errno)
            mov         rax, -1
            ret
         

;global	_ft_write
;extern	___error

;_ft_write:
;	mov		rax, 0x2000004			
;	syscall
;	cmp		rax, 0			
;	jl		error			
;	ret					

;error:
;	neg		rax			
;	mov		rdi, rax		
;	call	___error	
;	mov		[rax], rdi		
;	mov		rax, -1			
;	ret				