bits 64

extern _ft_list_size
section .text
    global  _ft_list_sort ; rdi = **begin_list, rsi (*cmp)()
    _ft_list_sort:
        push r12
        push r13
        push r14    
        push r15
    
        mov r12, [rdi]; r12 = tmp
        cmp qword[r12], 0
        je _return
    
        mov r14, [r12 +8] ; tmp->next (tmp2)

        mov r13,rsi; function cmp
        cmp qword[r13], 0
        je _return

    _loop1:
        cmp r12,0
        je _return
        mov r14, [r12 + 8] ; tmp2
        jmp _loop2
    
    _loop2:
        push rdi
        push rsi
        mov rdi, [r12]; tmp->data
        mov rsi, [r14]; tmp->next->data
        call r13
        pop rdi
        pop rsi
        cmp rax, 0
        jg _cmp
        mov r14, [r14 + 8]
        cmp r14, 0
        je _inc_loop1
        jmp _loop2
        
   
    _inc_loop1:
        mov r12, [r12 + 8]
        jmp _loop1


    _cmp:
        mov r15, [r12]
        mov [r12], r14
        mov [r14], r15
        mov r14, [r14 + 8]
        cmp r14, 0
        je _inc_loop1
        jmp _loop2

    _return:
        pop r15
        pop r14
        pop r13
        pop r12





;void ft_list_sort_test(t_list **begin_list, int(cmp)(char *, char *)) {
; t_list *tmp = *begin_list;
; t_list *tmp2;
; void *tmp3;
; while (tmp) {
;   tmp2 = tmp->next;
;   while (tmp2) {
;     if (cmp(tmp->data, tmp2->data) > 0) {
;       tmp3 = tmp2->data;
;       tmp2->data = tmp->data;
;       tmp->data = tmp3;
;     }
;     tmp2 = tmp2->next;
;   }
;   tmp = tmp->next;
; }
;}