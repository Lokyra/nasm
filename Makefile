CC      = nasm -f elf32 
LD      = ld -m elf_i386
SRC     = $(wildcard *.asm)
OBJ     = $(SRC:.asm=.o)
NAME    = demo
RM      = rm -f

all:    $(NAME)

$(NAME): $(OBJ)
	$(LD) $(OBJ) -o $(NAME)

%.o: %.asm
	$(CC) $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re:     fclean all

.PHONY: all clean fclean re

