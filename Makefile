##
## EPITECH PROJECT, 2025
## B-ASM-400-LYN-4-1-asmminilibc-matis.taam
## File description:
## Makefile
##

AS				=	nasm

ASFLAGS			=	-f elf64

CC				=	gcc

CFLAGS			=	-W -Wall -Wextra -Werror -g3

SRC				=	$(wildcard src/*.asm)

OBJ				=	$(SRC:.asm=.o)

NAME			=	libasm.so

RM				=	rm -f

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -shared -o $(NAME) $(OBJ)

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
