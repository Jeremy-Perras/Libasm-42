bits 64
extern _malloc
extern _ft_strlen
extern _ft_strcpy
extern	___error

section .text
    global _ft_strdup
    
   _ft_strdup:
        call	_ft_strlen		
        push	rdi		
        inc	rax		
        mov	rdi, rax
        call	_malloc
        cmp	rax, 0
        je	_error_exit	
        pop		rsi
        call	_ft_strcpy	
        ret			

    _error_exit:
        ret





