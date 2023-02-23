global _ft_strcpy

_ft_strcpy:
	push rdx
	mov rdx , 0

_strcpy_next:
    cmp [rdi], byte 0
    jz exit

    add rdx, rcx
    inc rcx
    inc rdi
    jmp _strcpy_next


exit: 
  mov   rax, rdx       ; rcx = the length (put in rax)

  pop   rdx            ; restore rcx
  ret                  ; get out
