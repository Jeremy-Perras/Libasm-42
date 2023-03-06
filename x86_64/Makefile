NAME = x86_64
NAME_LIB = libasm.a
NAME_LIB_BONUS = libasm_bonus.a

NASM = nasm
CC = gcc

NASMFLAGS = -f macho64 
# -g -F dwarf for debug
CFLAGS = -Wall -Wextra -Werror -fsanitize=address  
# -g for debug 
# be careful with -fsanitize=address 
MKDIR = mkdir -p
OUT_DIR := out

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS = $(addprefix $(OUT_DIR)/,$(SRCS:%.s=%.o))

BONUS_SRCS	= ft_atoi_base_bonus.s ft_list_push_front_bonus.s ft_list_size_bonus.s ft_list_sort_bonus.s ft_list_remove_if_bonus.s

BONUS_OBJS	=	$(addprefix $(OUT_DIR)/,$(BONUS_SRCS:%.s=%.o))

$(OUT_DIR)/%.o: %.s
	$(MKDIR) $(@D)
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME_LIB) : $(OBJS)
	ar rcs $(NAME_LIB) $(OBJS)

$(NAME) : $(NAME_LIB)

ccproject :
	 $(CC) $(CFLAGS) main.c $(NAME_LIB) -o $(NAME)

bonus:	$(OBJS) $(BONUS_OBJS)
	@ar rcs $(NAME_LIB) $(OBJS) $(BONUS_OBJS)

ccprojectbonus:
	 $(CC) $(CFLAGS) main_bonus.c $(NAME_LIB) -o $(NAME)


ccprojectM1 :
	arch -x86_64 $(CC) $(CFLAGS) main.c $(NAME_LIB) -o $(NAME)


	
all : $(NAME_LIB)

clean :
	rm -rf $(OBJS)
	rm -rf $(BONUS_OBJS)
	
fclean : clean
	rm -f $(NAME_LIB_BONUS)
	rm -f $(NAME_LIB)
	rm -f $(NAME)

re : fclean all