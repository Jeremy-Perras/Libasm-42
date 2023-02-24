global      _ft_strcpy

_ft_strcpy:
            mov rax, 0

_strcpy_next:
            cmp BYTE[rsi + rax], 0
            jz _exit
            mov cl, BYTE[rsi + rax]
            mov BYTE[rdi + rax], cl
            inc rax
            jmp _strcpy_next

_exit:
            mov BYTE[rdi + rax], 0
            mov rax, rdi
            ret