bits 64

section .text
    global  _ft_list_size
    _ft_list_size: ;  rdi =  *begin_list
        xor rax, rax
        mov rsi, rdi
    _list_size_next:
        cmp rdi, 0
        je _return
        inc rax
        mov rdi, [rdi + 8]
        jmp  _list_size_next 

    _return:
        mov rdi, rsi
        ret
            