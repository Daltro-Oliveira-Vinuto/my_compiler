#include <stdio.h>
#include "parser.tab.h"

void yyerror(const char *s) {
	fprintf(stderr, "Error while parsing: %s\n", s);
}

int main() {
	printf("Starting the compiling process...\n\n");
	
	// obs.: yyparse WILL call call yylex
	if (yyparse() == 0) {
		printf("Parse sucessfull\n");
	} else {
		printf("Parse failed\n");
	}

	return 0;
}