bits 64

section .text
    global  _ft_list_remove_if ; rdi = t_list **begin_list, rsi *data_ref, rdx =  (*cmp)(), rcx = *free_fct
    _ft_list_remove_if:
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15

        
        mov r12, [rdi]; r12 = tmp
        cmp r12, 0
        je _return

        mov r14, [rdi]; save for going back
        mov r15, rdi; save for going back 

        mov r13,rdx; function cmp
        cmp r13, 0
        je _return

        mov r11,rcx; function free
        cmp r11, 0
        je _return

        mov r10, rsi; data_ref

    _loop1:
        cmp r12, 0
        je _return
        push rdi
        push rsi
        mov rdi, [r12]; tmp->data
        mov rsi, r10, ; data_ref
        call r13
        pop rdi
        pop rsi
        cmp rax, 0
        je  _find_previous_of_r12
        jmp _inc_loop1
   
    _inc_loop1:
        mov r12, [r12 + 8]
        jmp _loop1

    _find_previous_of_r12:
        cmp r14, r12
        je _free_first_elem
        cmp [r14 + 8], r12
        je _free
        mov r14, [r14 + 8]
        cmp r14, 0
        je _return
        jmp _find_previous_of_r12

    _free:
        mov r9, [r12 + 8]; tmp->next
        mov r8, r14; previous->next
        mov  [r8 + 8], r9
        push rdi
        mov  rdi,[r12]
        call r11
        pop  rdi
        jmp  _inc_loop1

    _free_first_elem:
        mov  r9, [r12 + 8]; tmp->next
        push rdi
        mov  rdi, [r12]
        call r11
        pop  rdi
        mov  r14, r9
        mov qword [r15], r9 ; r15 = *(&test) = NULL
        jmp _inc_loop1

    _return:
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        ret 
