##
## EPITECH PROJECT, 2025
## B-ASM-400-LYN-4-1-asmminilibc-matis.taam
## File description:
## Makefile
##

NASM			=	nasm
NASMFLAGS		=	-f elf64

LD				=	ld
LDFLAGS			=	-shared

CC				=	gcc
CFLAGS			=	-W -Wall -Wextra -Werror -g3 -I./include -fno-builtin

SRC				=	$(wildcard src/*.asm)

OBJ				=	$(SRC:.asm=.o)

NAME			=	libasm.so

RM				=	rm -f

all: $(NAME)

$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) $^ -o $@

%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

exec: $(NAME)
	$(CC) -o my_program main.c -L. -lasm $(CFLAGS)
	@LD_LIBRARY_PATH=. ./my_program

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)
	$(RM) my_program

re: fclean all

.PHONY: all clean fclean re exec
