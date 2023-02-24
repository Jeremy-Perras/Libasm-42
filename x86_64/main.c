#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int ft_strlen(char *);
char *ft_strcpy(char *, char *);
int ft_strcmp(char *, char *);
int main() {
  char *s = "Hello wolrd";
  char t[40];

  printf("%d\n", ft_strlen("Hello word"));
  printf("%s\n", ft_strcpy(t, s));
  printf("%d\n", ft_strcmp(t, s));
  return 0;
}
