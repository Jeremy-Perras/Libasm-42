global _ft_strcmp

_ft_strcmp:
    xor rax,rax

_strcmp_next:
    mov al, BYTE[rsi + rax]
    mov bl, BYTE[rdi + rax] 
    cmp al,bl
    jnz _exit
    inc rax
    jmp _strcmp_next

_exit:
    movzx rax, al
    movzx  cl,bl
	sub	  rax, r8
	ret