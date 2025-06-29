%{
 #include <stdio.h>
 #include <assert.h>

 extern int yylex(void);
 extern void yyerror(const char*);
 #define YYDEBUG 1

 static int Pop();
 static int Top();
 static void Push(int val);

%}

%token T_Int

%%
S : S E '\n' { 
	printf("= %d\n", Top());
	$$ = $2;
	printf("TOP $$, $1, $2: %d, %d, %d\n", $$, $1, $2);
 }
 |
 ;
E : E E '+' { 
	Push(Pop() + Pop()); 
	$$ = $1 + $2;
	printf("====> values $$, $1, $2: %d, %d, %d\n", $$, $1, $2);

}
 | E E '-' { 
 	int op2 = Pop(); Push(Pop() - op2); 
 }
 | E E '*' { 
 	Push(Pop() * Pop()); 
 }
 | E E '/' { 
 	int op2 = Pop(); Push(Pop() / op2);
 	 }
 | T_Int { 
 	printf("T_Int found: %d\n", yylval); Push(yylval); 
 	$$ = $1;
 	printf("====> value of $$, $1: %d, %d\n", $$, $1);

 }
 ;
%%

static int stack[100], count = 0;
static int Pop() {
 assert(count > 0);
 return stack[--count];
}
static int Top() {
 assert(count > 0);
 return stack[count-1];
}
static void Push(int val) {
 assert(count < sizeof(stack)/sizeof(*stack));
 stack[count++] = val;
}

/*
int main() {
 return yyparse();
}
*/