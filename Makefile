all: rule_bison rule_flex rule_main link_flex_bison_and_main
rule_flex:  clear flex preprocess_compile_and_assemble_flex
rule_bison: bison preprocess_compile_and_assemble_bison
rule_main: preprocess_compile_and_assemble_main
load: load_elf

SRC_MAIN := main.c
OBJECT_MAIN := main.o
SRC_FLEX := scanner.l
FLEX_OUTPUT := lex.yy.c
OBJECT_FLEX := lex.yy.o 
SRC_BISON := parser
BISON_TYPE := .y
BISON_OUTPUT := $(SRC_BISON).tab.c
OBJECT_BISON := $(SRC_BISON).tab.o
ELF := compiler.elf

# BEGIN Flex section ====================================================
flex:
	flex $(SRC_FLEX)

preprocess_compile_and_assemble_flex:
	gcc $(FLEX_OUTPUT) -c 

link_flex:
	gcc $(OBJECT_FLEX) -o $(ELF)

# END Flex section ========================================================

# BEGIN bison section =======================================================
bison:
	bison $(SRC_BISON)$(BISON_TYPE) -d

preprocess_compile_and_assemble_bison:
	gcc $(BISON_OUTPUT) -c 

# END bison section ===========================================================


# BEGIN main section ========================================================

preprocess_compile_and_assemble_main:
	gcc -c $(SRC_MAIN) -o $(OBJECT_MAIN)

# END main section ==========================================================

# BEGIN compile section =====================================================
link_flex_bison_and_main:
	gcc $(OBJECT_FLEX) $(OBJECT_BISON) $(OBJECT_MAIN)  -o $(ELF)

load_elf:
	./${ELF}

clear:
	clear

# END compile section ========================================================