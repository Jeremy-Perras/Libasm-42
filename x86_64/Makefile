NAME = x86_64
NAME_LIB = libasm.a

NASM = nasm
CC = gcc

NASMFLAGS = -f macho64 -g -F dwarf 
CFLAGS = -Wall -Wextra -fsanitize=address -Werror -g 

MKDIR = mkdir -p
OUT_DIR := out

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS = $(addprefix $(OUT_DIR)/,$(SRCS:%.s=%.o))

BONUS_SRCS	= ft_list_push_front_bonus.s ft_list_size_bonus.s ft_list_sort_bonus.s ft_list_remove_if_bonus.s

BONUS_OBJS	=	$(addprefix $(OUT_DIR)/,$(BONUS_SRCS:%.s=%.o))

$(OUT_DIR)/%.o: %.s
	$(MKDIR) $(@D)
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME) : $(OBJS)
	ar rcs $(NAME_LIB) $(OBJS)

ccproject :
	 $(CC) $(CFLAGS) main.c $(NAME_LIB) -o $(NAME)

ccprojectM1 :
	arch -x86_64 $(CC) $(CFLAGS) main.c $(NAME_LIB) -o $(NAME)

bonus:	$(OBJS) $(BONUS_OBJS)
	ar rcs $(NAME_LIB) $(OBJS) $(BONUS_OBJS)

all : $(NAME)

clean :
	rm -rf $(OBJS)

fclean : clean
	rm -f $(NAME_LIB)
	rm -f $(NAME)

re : fclean all