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
int ft_list_size(t_list *begin_list);

void ft_list_sort_test(t_list **begin_list, int(cmp)(char *, char *)) {
  t_list *tmp = *begin_list;
  t_list *tmp2;
  void *tmp3;
  while (tmp) {
    tmp2 = tmp->next;
    while (tmp2) {
      if (cmp(tmp->data, tmp2->data) > 0) {
        tmp3 = tmp2->data;
        tmp2->data = tmp->data;
        tmp->data = tmp3;
      }
      tmp2 = tmp2->next;
    }
    tmp = tmp->next;
  }
}
void ft_list_sort(t_list **begin_list, int(cmp)(char *, char *));
int main() {
  t_list *test = NULL;
  int i = 48;
  int j = 83;
  int k = 123;
  int l = 102;
  int m = 83;
  int n = 124;

  ft_list_push_front(&test, (&i));
  ft_list_push_front(&test, &j);
  ft_list_push_front(&test, &k);
  ft_list_push_front(&test, &l);
  ft_list_push_front(&test, &m);
  ft_list_push_front(&test, &n);
  t_list *tmp = test;
  while (test) {
    int *c = test->data;
    printf("%d\n", *c);
    test = test->next;
  }
  test = tmp;
  ft_list_sort(&test, &ft_strcmp);
  printf("\n");
  while (test) {
    int *c = (int *)(test->data);
    printf("%d\n", *c);
    test = test->next;
  }
  return (1);
}

void ft_list_sort(t_list **begin_list, int (*cmp)());
