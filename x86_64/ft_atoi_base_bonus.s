bits 64
extern		ft_strlen
section .text
    global  _ft_atoi_base ; rdi = char *str, rsi = char *base
    _init:
      
        ret

    _ft_check_base:
        cmp	byte [rdi], 0x09
        je	_not_allowed
        cmp	byte [rdi], 0x0A
        je	_not_allowed
        cmp	byte [rdi], 0x0B
        je	_not_allowed
        cmp	byte [rdi], 0x0C
        je	_not_allowed
        cmp	byte [rdi], 0x0D
        je	_not_allowed
        cmp	byte [rdi], 0x20
        je	_not_allowed
        cmp	byte [rdi], 0x2B
        je	_not_allowed
        cmp	byte [rdi], 0x2D
        je	_not_allowed
        inc r12
        cmp BYTE [rdi], BYTE 0
        je _ft_check_base_return
        jmp _ft_check_base

    _is_not_allowed:
        mov		rax, 0
        ret

    _ft_check_base_return:
        mov rax, r12
        ret 

    _ft_check_multiple:
        mov r15, rdi
        jmp _loop1
    _loop1
        jmp _loop2



    _ft_atoi_base:
    
        push r11
        push r12
        push r13
        push r14
        push r15
        push rdi
        xor rax, rax

        mov rdi, rsi
        call ft_check_base
        cmp rax, 1
        jl _return
        call _ft_check_multiple
        pop rdi
        mov r11, rax
    



    _return:
        ret

    ;   int get_base_length(char *base) {
    ;   int base_length;
    ;   int j;

    ;   base_length = 0;
    ;   while (base[base_length]) {
    ;     if (base[base_length] == '-' || base[base_length] == '+')
    ;       return (0);
    ;     j = base_length + 1;
    ;     while (base[j]) {
    ;       if (base[base_length] == base[j])
    ;         return (0);
    ;       ++j;
    ;     }
    ;     ++base_length;
    ;   }
    ;   if (base_length < 2)
    ;     return (0);
    ;   return (base_length);
    ; }