%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
extern int yylineno;
extern int yylex();
void yyerror(char *);
%}

%token NUMBER

%union {
	int integer_num;
}

%type <integer_num> factor group term expression NUMBER

%%

lines
	:
	| lines expression '\r' '\n'{ printf(" = %d\n", $2); } 	/*For Windows*/
	| lines expression '\n'		{ printf(" = %d\n", $2); }	/*For Linux*/
	;
expression
	: term						{ $$ = $1; }
	| expression '+' term		{ printf("Add   \n"); $$ = $1 + $3; }
	| expression '-' term		{ printf("Sub   \n"); $$ = $1 - $3; }
	;
term
	: factor					{ $$ = $1; }
	| term '*' factor			{ printf("Mul   \n"); $$ = $1 * $3; }
	| term '/' factor			{ printf("Div   \n"); $$ = $1 / $3; }
	;
factor
	: NUMBER					{ $$ = $1; }
	| group						{ $$ = $1; }
	;
group
	: '(' expression ')'		{ $$ = $2; }
	;

%%
int main(int argc, char** argv)
{
	yyparse();
	return 0;
}
void yyerror(char *s)
{
	printf("%s on %d line \n", s, yylineno);
}
