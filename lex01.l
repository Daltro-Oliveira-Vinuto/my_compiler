%{
#include <stdio.h>
#include <stdio.h>

int numero_linhas = 0, numero_caracteres=0;

%}

ID [a-zA-Z][a-zA-Z0-9]*
DIGIT [0-9]
INTEGER {DIGIT}+
FLOATING_POINT {DIGIT}+"."{DIGIT}*
WHITESPACE [\t\n\r]

%%
\n {
	++numero_linhas; ++numero_caracteres;
	printf("Number of (lines, characters): (%d,%d)\n", 
		numero_linhas, numero_caracteres);
}


{DIGIT}+ {
	printf("You typed a digit: %s\n", yytext);
}

^{INTEGER}$ {
	printf("You typed a integer: %s\n", yytext);
}

{FLOATING_POINT} {
	printf("You typed a floating point with value: %s\n", yytext);
}

^{ID}$ {
	printf("This is a identifier: %s\n",yytext);
}

[xyz]*  {
	printf("Regular expression detected\n");
}

username {
	printf("You just typed: %s .Now -> password?\n", yytext);
}

. {
	++numero_caracteres;
	printf("Invalid token, you typed: %s\n", yytext);
}

%%

int yywrap();

int main() {
	yylex();

	printf("Numero de linhas: %d\n", numero_linhas);
	printf("Numero de caracteres: %d\n", numero_caracteres);

	return 0;

}

int yywrap() {
	return 1;
}