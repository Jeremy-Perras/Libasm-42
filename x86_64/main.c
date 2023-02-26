#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int ft_strlen(char *);
char *ft_strcpy(char *, char *);
int ft_strcmp(char *, char *);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
int main() {
  char *s = "Hello wolrd";
  char t[40];

  printf("%d\n", ft_strlen("Hello word"));
  printf("%s\n", ft_strcpy(t, s));
  printf("%d\n", ft_strcmp("Tripouille", "TripouillE"));
  printf("%zd", ft_write(1, s, 11));
  // return 0;
  printf("Write return: %zd\n", ft_write(21, "wrong file descriptor", 21));
  printf("Error code: %d\n", errno);
  return (1);
}
