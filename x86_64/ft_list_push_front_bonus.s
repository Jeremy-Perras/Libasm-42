bits 64
extern	_malloc
section .text
    global _ft_list_push_front
    _ft_list_push_front:				
                push	rbx				
                push	rdi				
                push	rsi				
                mov		rdi, 16
                xor		rax, rax
                call	_malloc			;
                pop		rsi
                pop		rdi
                cmp		rax, 0
                je      _error_exit			
                mov		[rax], rsi		
                mov		rcx, [rdi]
                mov		[rax + 8], rcx	
                mov		[rdi], rax		
   _error_exit:
                pop		rbx			
                ret