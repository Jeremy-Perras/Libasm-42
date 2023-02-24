NAME = x86_64
NAME_LIB = libasm.a

NASM = nasm
CC = gcc

NASMFLAGS = -f macho64 -g -F dwarf 
CFLAGS = -Wall -Wextra -Werror -g

MKDIR = mkdir -p
OUT_DIR := out

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s
OBJS = $(addprefix $(OUT_DIR)/,$(SRCS:%.s=%.o))

$(OUT_DIR)/%.o: %.s
	$(MKDIR) $(@D)
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME) : $(OBJS)
	ar rcs $(NAME_LIB) $(OBJS)

ccproject :
	$(CC) $(CFLAGS) main.c $(NAME_LIB) -o $(NAME)

all : $(NAME)

clean :
	rm -rf $(OBJS)

fclean : clean
	rm -f $(NAME_LIB)
	rm -f $(NAME)

re : fclean all