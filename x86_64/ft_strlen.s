global _ft_strlen

_ft_strlen:

  push  rcx            ; save and clear out counter
  mov rcx , 0          ; put 0 inside rcx

_strlen_next:

  cmp   [rdi], byte 0  ; null byte yet? [rdi] - \0 = 0 ?
  jz    exit           ; yes, get out

  inc   rcx            ; char is ok, count it
  inc   rdi            ; move to next char
  jmp   _strlen_next   ; process again

exit:

  mov   rax, rcx       ; rcx = the length (put in rax)

  pop   rcx            ; restore rcx
  ret                  ; get out

