bits 64
extern	_malloc
section .text
    global _ft_list_push_front
    _ft_list_push_front:		; rdi = t_list **begin, rsi = void *data		
                push	rbx				
                push	rdi				
                push	rsi				
                mov		rdi, 16
                xor		rax, rax
                call	_malloc	
                pop		rsi
                pop		rdi
                cmp		rax, 0
                je      _error_return			
                mov		[rax], rsi	  
                mov		rcx, [rdi]
                mov		[rax + 8], rcx	
			    mov		[rdi], rax		
   _error_return:
                pop		rbx			
                ret
; [rax] = new
; new.data= data
; new.next = *begin
; *begin = new