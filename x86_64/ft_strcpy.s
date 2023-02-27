bits 64

section .text
    global  _ft_strcpy

        _ft_strcpy:
            xor rax, rax

        _strcpy_next:
            cmp BYTE[rsi + rax], 0
            je _return
            mov cl, BYTE[rsi + rax]
            mov BYTE[rdi + rax], cl
            inc rax
            jmp _strcpy_next
            
        _return:
            mov BYTE[rdi + rax], 0
            mov rax, rdi
            ret