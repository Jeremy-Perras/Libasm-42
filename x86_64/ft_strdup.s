bits 64
extern _malloc
extern _ft_strlen
extern _ft_strcpy
extern	___error

section .text
    global _ft_strdup ;rdi = *char

   _ft_strdup:
	    push r12
        call	_ft_strlen
		mov r12,rdi
        inc	rax
        mov	rdi, rax
        call	_malloc
        cmp	rax, 0
        je	_error_return
		mov rdi, rax
		mov rsi, r12
        call	_ft_strcpy
		pop r12
		ret

    _error_return:
		pop r12
        ret




