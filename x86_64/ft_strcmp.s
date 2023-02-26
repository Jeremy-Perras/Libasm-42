bits 64 ; using bl register create buffer overflow

section .text
    global _ft_strcmp

    _ft_strcmp:	
	    xor		rax, rax
        xor     rcx, rcx
        xor     rdx, rdx
        

    _strcmp_next:
        cmp  BYTE[rdi + rdx], 0
        jz  _exit
        cmp  BYTE[rsi + rdx], 0
        jz  _exit
        mov cl, BYTE[rsi + rdx]	
        cmp BYTE[rdi + rdx]	, cl
        jnz _exit
        inc rdx
        jmp _strcmp_next

    _exit:
       
        movzx rax, BYTE[rdi + rdx]
        movzx rdx, BYTE[rsi + rdx]	
        sub   rax, rdx
        ret

