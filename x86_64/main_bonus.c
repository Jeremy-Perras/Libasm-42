#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int ft_strlen(char *);
int ft_strcmp(void *, void *);
typedef struct s_list {
  void *data;
  struct s_list *next;
} t_list;

void ft_list_push_front(t_list **begin_list, void *data);
int ft_list_size(t_list *begin_list);
void ft_list_sort(t_list **begin_list, int(cmp)(void *, void *));
void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
                       void (*free_fct)(void *));
void removee(void *s) { *(char *)s = 'X'; };
int ft_atoi_base(char *str, char *base);
int main() {
  t_list *test = NULL;
  int i = 48;
  int k = 123;
  int l = 48;
  int m = 83;
  int n = 120;

  ft_list_push_front(&test, (&i));
  ft_list_push_front(&test, &k);
  ft_list_push_front(&test, &l);
  ft_list_push_front(&test, &m);
  ft_list_push_front(&test, &n);
  printf("\nsize : %d\n", ft_list_size(test));
  printf("\n");
  t_list *tmp = test;
  while (test) {
    int *c = test->data;
    printf("%d\n", *c);
    test = test->next;
  }
  test = tmp;
  int j = 48;
  ft_list_remove_if(&test, &j, &ft_strcmp, &removee);
  printf("\n");
  while (test) {
    int *c = (int *)(test->data);
    printf("%d\n", *c);
    test = test->next;
  }
  test = tmp;
  printf("\n");
  ft_list_sort(&test, &ft_strcmp);
  while (test) {
    int *c = (int *)(test->data);
    printf("%d\n", *c);
    test = test->next;
  }
  printf("\n---ATOI_BASE---\n");
  printf("%d\n", ft_atoi_base("+-1050", "0123"));
  printf("%d\n", ft_atoi_base("+--1030", "0123"));
  printf("%d\n", ft_atoi_base("           +-1020", "0123"));
  printf("%d\n", ft_atoi_base("dsf +-1050", "0123"));
  printf("%d\n", ft_atoi_base("16", "0123456789abcdef"));
  printf("%d\n", ft_atoi_base("48", "0123456789abcdef"));
  printf("%d\n ", ft_atoi_base("54687441", "0123456789abcdef"));
  return (1);
}

void ft_list_sort(t_list **begin_list, int (*cmp)());