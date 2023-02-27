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
char *ft_strdup(const char *s1);
typedef struct s_list {
  void *data;
  struct s_list *next;
} t_list;

void ft_list_push_front(t_list **begin_list, void *data);

int main() {
  t_list *test = NULL;
  int i = 10;
  ft_list_push_front(&test, &i);
  int *c = (int *)(test->data);
  printf("%d\n", *c);
  printf("%lu\n", sizeof(void *));
  return (1);
}
