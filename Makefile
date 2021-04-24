#if you want to compile the program change NAME to name of the program
NAME = reg

all: 
	nasm -f elf64  $(NAME).asm -l $(NAME).list -o $(NAME).o
	ld $(NAME).o -o $(NAME)
