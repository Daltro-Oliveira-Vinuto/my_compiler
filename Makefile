all:  clear flex
load: load_elf

SRC := lex01
TYPE := .l
ELF := ${SRC}.elf
FLEX_OUTPUT := lex.yy.c

flex:
	flex ${SRC}${TYPE}
	gcc -Wall ${FLEX_OUTPUT} -o ${ELF}

load_elf:
	./${ELF}

clear:
	clear