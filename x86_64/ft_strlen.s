bits 64

section .text
  global _ft_strlen

    _ft_strlen:
      xor rcx , rcx         ; put 0 inside rcx

    _strlen_next:
      cmp   BYTE[rdi], BYTE 0  ; null byte yet? [rdi] - ' \0' = 0 ?
      je   _return           ; yes, get out
      inc   rcx            ; char is ok, count it
      inc   rdi            ; move to next char
      jmp   _strlen_next   ; process again
      
    _return:
      mov   rax, rcx       ; rcx = the length (put in rax)
      sub   rdi, rcx
      ret                  ; get out