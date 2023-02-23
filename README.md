# Liibasm-42
nasm -f macho64 -g -F dwarf ft_strcpy.s //Debug
gcc -g3 main.c ft_strlen.o ft_strcpy.o // seg fault on ft_strcpy
disassemble -n ft_strcpy // see address
br s -a  0x100003f42 // breakpoint



