bits 64
extern	_ft_strlen
section .text
    global  _ft_atoi_base ; rdi = char *str, rsi = char *base
;------------------------------------------------------------------------------;
;int get_base_length(char *base)(char c);                                      ;
;------------------------------------------------------------------------------;
    
    _ft_check_base:
        cmp	byte [rdi + r12], 0x09
        je	_is_not_allowed
        cmp	byte [rdi + r12], 0x0A
        je	_is_not_allowed
        cmp	byte [rdi + r12], 0x0B
        je	_is_not_allowed
        cmp	byte [rdi + r12], 0x0C
        je	_is_not_allowed
        cmp	byte [rdi + r12], 0x0D
        je	_is_not_allowed
        cmp	byte [rdi + r12], 0x20
        je	_is_not_allowed
        cmp	byte [rdi + r12], 0x2B
        je	_is_not_allowed
        cmp	byte [rdi+ r12], 0x2D
        je	_is_not_allowed
        inc r12
        cmp BYTE [rdi+ r12], BYTE 0
        je _ft_check_base_return
        jmp _ft_check_base

    _is_not_allowed:
        mov		rax, -1
        ret

    _ft_check_base_return:
        mov rax, r12
        ret 

    _ft_check_multiple:
        mov r15, rdi
        mov r14, rdi
        xor r12, r12
        inc r13
        jmp _ft_check_multiple_loop 

    _ft_check_multiple_loop:
        cmp BYTE [r15 + r12], 0
        je  _ft_check_multiple_return
        mov cl, BYTE [r14 + r13]
        cmp cl, BYTE [r15 + r12]
        je _is_not_allowed
        inc r13
        cmp BYTE [r14 + r13], 0
        je _loop1
        jmp _ft_check_multiple_loop
    
    _loop1:
        inc r12
        mov r13, r12
        inc r13
        jmp _ft_check_multiple_loop
    
    _ft_check_multiple_return:
        mov rax, 10
        ret

;------------------------------------------------------------------------------;
;int check_errors(char *str, char *base)     rdi = *str, rsi = *base           ;
;------------------------------------------------------------------------------;
    _start_errors:
        xor r12, r12
        jmp _ft_check_is_space


    _ft_check_is_space:
        cmp	byte [rdi + r12], 0x09
        je _is_space
        cmp	byte [rdi + r12], 0x0A
        je _is_space
        cmp	byte [rdi + r12], 0x0B
        je _is_space
        cmp	byte [rdi + r12], 0x0C
        je _is_space
        cmp	byte [rdi + r12], 0x0D
        je _is_space
        cmp	byte [rdi + r12], 0x20
        je _is_space
        jmp _check_is_sign

    _is_space:
        inc r12
        cmp	byte [rdi + r12], 0
        je _is_not_allowed
        jmp _ft_check_is_space

    _is_sign:
        inc r12
        cmp	byte [rdi + r12], 0
        je _is_not_allowed
        jmp  _check_is_sign

    _is_odd:
        add r9, -1
        jmp _is_sign
    
    _is_minus:
        cmp r9, 1
        je _is_odd
        add r9,1
        jmp _is_sign

    _check_is_sign:
        cmp	byte [rdi + r12], 0x2B
        je	_is_sign
        cmp	byte [rdi+ r12], 0x2D
        je	_is_minus
        jmp _is_inside_start

    _is_inside_start:
        mov r15, rdi ; str
        mov r14, rsi ; base
        xor r13, r13
        mov rax, r12
        jmp _ft_check_base_inside_str 

   _ft_check_base_inside_str:
        cmp BYTE [r15 + r12], 0
        je  _ft_check_base_inside_return
        mov cl, BYTE [r14 + r13]
        cmp cl, BYTE [r15 + r12]
        je _next_char
        inc r13
        cmp BYTE [r14 + r13], 0
        je _loop_base_inside
        jmp _ft_check_base_inside_str 

    _next_char:
        inc r12
        xor r13, r13
        jmp _ft_check_base_inside_str

    _loop_base_inside:
        cmp BYTE [r15 + r12], 0
        jne _is_not_allowed
        jmp _ft_check_base_inside_str

   _ft_check_base_inside_return:
        ret
;------------------------------------------------------------------------------;
;int get_nb(char c, char *base); rdi = char c, rsi = char *base                ;
;------------------------------------------------------------------------------; 
    _get_nbr:
        xor r12, r12
        jmp _get_nbr_loop
    
    _get_nbr_loop:
        cmp dil, BYTE[rsi + r12]
        je _get_nbr_return
        inc r12
        jmp _get_nbr_loop

    _get_nbr_return:
        mov rax,r12
        ret 

;------------------------------------------------------------------------------;
;int get_result(char *str,char *base); rdi = char *str, rsi = char *base       ;
;------------------------------------------------------------------------------; 
    _get_result:
        xor r10, r10 ; len
        xor r11, r11
        xor r14, r14 ; result

        push rdi
        mov rdi, rsi
        call _ft_strlen
        pop rdi
        mov r10, rax

        jmp _get_result_loop

    _get_result_loop:
        cmp BYTE [rdi + r13], 0
        je _get_result_return
        mov rax, r10
        mul r14
        mov r14, rax
        push rdi
        mov dil, BYTE [rdi + r13]
        call  _get_nbr
        pop rdi
        add r14, rax
        inc r13
        jmp _get_result_loop 

    _get_result_return:
        mov rax, r14
        ret

;------------------------------------------------------------------------------;
;int ft_atoi(char *str, char *base); rdi = char *str, rsi = char *base         ;
;------------------------------------------------------------------------------;     

    _ft_atoi_base:
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
     
        xor rax, rax
        xor rcx, rcx
        xor rdx, rdx
        xor r9, r9
       
        push rdi
        mov rdi, rsi
        call _ft_check_base
        pop rdi
        cmp rax, 1
        jl _return
       
        push rdi
        mov rdi, rsi
        call _ft_check_multiple
        pop rdi
        cmp rax, -1
        je _return
       
        call _start_errors
        cmp rax, -1
        je _return
        mov r13, rax
        call _get_result
        cmp r9, 0
        je  _is_even
        cmp r9, 0
        je  _is_odd_
      
    _is_even:
        inc r9
        jmp _return

    _is_odd_:
        mov r9, -1
        jmp _return
    _return:
        
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        mul r9
        ret
