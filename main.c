#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int ft_strlen(char *);
char *ft_strcpy(char *, char *);

int main() {
  char *s = "Hello wolrd";
  char t[40];
  printf("%d", ft_strlen("Hello word"));

  printf("%s", ft_strcpy(s, t));
  return 0;
}

// global _ft_strlen

//     _ft_strlen : mov rax,
//                  0;
// init rax to 0 jmp loop_count;
// jump to loop_count function

//     loop_count : cmp BYTE[rdi + rax],
//                  0;
// je exit;
// je = (rdi[rax] == 0)->exit inc rax;
// rax < -rax + 1 jmp loop_count;
// jump loop_count

//     exit : ret;
// return rax
