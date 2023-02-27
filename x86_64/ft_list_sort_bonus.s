bits 64

extern _ft_list_size
section .text
    global  _ft_list_sort ; rdi = **begin_list, rsi (*cmp)()
    _ft_list_sort:
            push	rbx					
			push	r15  ; *begin_list 
            push    r12  ; tmp3
            push    r13  ; Fonction
            push    r11  ; begin_list->next
            mov     r13, rsi	
			cmp		rdi, 0				
			jz		_return
			mov		r15, [rdi]			
			cmp		rsi, 0
			jz		_return
			jmp		_ft_list_sort_next

    _ft_list_sort_next:
        jmp _loop1

    _loop1:
        cmp r15, 0
        je _return
        mov r11, [r15 + 8]
        cmp r11, 0
        je _return
        jmp _loop2
        mov r15, [r15 + 8]

        
    _loop2:
        mov rdi, r15
        mov rsi, r11
        call r13
        cmp rax, 0
        jg _if_greater
        mov r11, [r15 + 8]
        cmp r11, 0
        je _loop1
        
    _if_greater:
        mov r12, r11
        mov r11, r15
        mov r15, r12
        jmp _loop2

    _return:
        pop r11
        pop r13
        pop r12
        pop r15
        ret




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