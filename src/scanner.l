%{

#include <stdio.h>
#include <stdio.h>
#include "../build/parser.tab.h"

%}

%%

escreva		{return ESCREVA;}
[0-9]+		{yylval.inteiro = atoi(yytext); return NUM;}
[ \t\n]+	{;}
.		{return yytext[0];}

%%

int yywrap() {
  return 1;
}