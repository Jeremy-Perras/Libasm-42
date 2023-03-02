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

void sigsegv(int signal);
void sigsegv(int signal) {
  (void)signal;
  printf(".SIGSEGV");
  exit(EXIT_SUCCESS);
}

void ft_list_sort(t_list **begin_list, int(cmp)(void *, void *));
int lower(void *d1, void *d2) { return ((long long)d1 > (long long)d2); }
void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
                       void (*free_fct)(void *));
void removee(void *s) { *(char *)s = 'X'; };
int ft_atoi_base(char *str, char *base);
int main() {
  // t_list *test = NULL;
  // int i = 48;
  // int k = 123;
  // int l = 48;
  // int m = 83;
  // int n = 120;

  // ft_list_push_front(&test, (&i));
  // ft_list_push_front(&test, &k);
  // ft_list_push_front(&test, &l);
  // ft_list_push_front(&test, &m);
  // ft_list_push_front(&test, &n);
  // t_list *tmp = test;
  // while (test) {
  //   int *c = test->data;
  //   printf("%d\n", *c);
  //   test = test->next;
  // }
  // test = tmp;
  // int j = 48;
  // ft_list_remove_if(&test, &j, &ft_strcmp, &removee);
  // printf("\n");
  // while (test) {
  //   int *c = (int *)(test->data);
  //   printf("%d\n", *c);
  //   test = test->next;
  // }
  // printf("%lu", sizeof(void *));
  // signal(SIGSEGV, sigsegv);
  // t_list *list = NULL;
  // ft_list_sort(&list, &lower);
  // ft_list_push_front(&list, (void *)1);
  // ft_list_sort(&list, &lower);
  // ft_list_push_front(&list, (void *)2);
  // ft_list_push_front(&list, (void *)3);
  // ft_list_push_front(&list, (void *)4);
  // ft_list_push_front(&list, (void *)-1);
  // ft_list_push_front(&list, (void *)5);
  // ft_list_push_front(&list, (void *)-2);
  // ft_list_push_front(&list, (void *)6);
  // ft_list_push_front(&list, (void *)-3);
  // ft_list_push_front(&list, (void *)7);
  // ft_list_push_front(&list, (void *)0);
  // ft_list_sort(&list, &lower);
  // // t_list *tmp = list;
  // // while (tmp != NULL) {
  // //   int *c = (int *)tmp->data;
  // //   printf("%d", c);
  // //   tmp = tmp->next;
  // // }
  printf("%d", ft_atoi_base("---1020", "0123"));
  return (1);
}

void ft_list_sort(t_list **begin_list, int (*cmp)());
