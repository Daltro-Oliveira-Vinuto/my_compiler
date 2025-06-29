%{

#include <stdio.h>
#include <stdio.h>
#include "parser.tab.h"
extern YYSTYPE yylval;

%}


%%

[0-9]+ {yylval = atoi(yytext); return T_Int;}
[-+*/\n] { return yytext[0];}

. { /* ignore everything else */ }

%%

int yywrap();


int yywrap() {
	return 1;
}