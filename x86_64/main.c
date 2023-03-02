#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/fcntl.h>
#include <unistd.h>

int ft_strlen(char *);
char *ft_strcpy(char *, char *);
int ft_strcmp(char *, char *);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
char *ft_strdup(const char *s1);
ssize_t ft_read(int fd, void *buf, size_t count);

int main() {
  char tmp[100];
  int fd = open("test.txt", O_RDONLY);
  printf("--- STRLEN ---\n");
  printf("mine : %d\n", ft_strlen("test"));
  printf("them : %d\n", ft_strlen("test"));
  printf("mine : %d\n", ft_strlen("testsdfjdsklfjsdfjskd"));
  printf("them : %d\n", ft_strlen("testsdfjdsklfjsdfjskd"));
  printf("mine : %d\n", ft_strlen("4454l[;[][;            "));
  printf("them : %d\n", ft_strlen("4454l[;[][;            "));

  printf("\n--- STRCPY ---\n");
  printf("mine : %s\n", ft_strcpy(tmp, "test"));
  printf("mine : %s\n", ft_strcpy(tmp, "testsdfjdsklfjsdfjskd"));
  printf("mine : %s\n", ft_strcpy(tmp, "4454l[;[][;            "));

  printf("\n--- STRCMP ---\n");
  printf("mine : %d\n", ft_strcmp(tmp, "4454l[;[][;            "));
  printf("mine : %d\n", ft_strcmp(tmp, "testsdfjdsklfjsdfjskd"));
  printf("mine : %d\n", ft_strcmp(tmp, "idsf"));

  printf("\n--- STRDUP ---\n");
  printf("mine : %s\n", ft_strdup("4454l[;[][;            "));
  printf("mine : %s\n", ft_strdup("testsdfjdsklfjsdfjskd"));
  printf("mine : %s\n", ft_strdup("idsf"));

  printf("\n--- FT_WRITE ---\n");
  ft_write(1, "test\n", ft_strlen("test") + 1);
  ft_write(1, "testsf 4343253 %$^%&%^*& sferggfb f5435 4534 22\n",
           ft_strlen("testsf 4343253 %$^%&%^*& sferggfb f5435 4534 22") + 1);

  printf("\n--- FT_READ ---\n");
  ft_read(fd, tmp, 0);
  printf("%s\n", tmp);
  ft_read(fd, tmp, 101);
  printf("%s\n", tmp);
  printf("%d\n", errno);
  ft_read(-5, tmp, 10);
  printf("%d\n", errno);
}