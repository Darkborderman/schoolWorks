%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
extern int yylineno;
extern int yylex();
void yyerror(char *);

FILE *file;

%}

%union {
	int intVal;
}

%token NUMBER

%type <intVal> factor group term expression NUMBER



%%
lines
    :
    | lines expression '\n'  	{
					printf(" = %d\n", $2); 
					fprintf(file,	"getstatic java/lang/System/out Ljava/io/PrintStream;\n"
							"swap		;swap the top two items on the stack \n"
							"invokevirtual java/io/PrintStream/println(I)V\n" );
				}
    | lines expression '\r' '\n'     {
                    printf(" = %d\n", $2); 
                    fprintf(file,   "getstatic java/lang/System/out Ljava/io/PrintStream;\n"
                            "swap       ;swap the top two items on the stack \n"
                            "invokevirtual java/io/PrintStream/println(I)V\n" );
                }
    ;

expression
    : term   { $$ = $1; }
    | expression '+' term {printf("Add  \n"); $$ = $1 + $3; fprintf(file,"iadd \n");}
    | expression '-' term {printf("Sub  \n"); $$ = $1 - $3; fprintf(file,"isub \n");}
    ;

term
    : factor   { $$ = $1; }
    | term '*' factor  {printf("Mul  \n"); $$ = $1 * $3; fprintf(file,"imul \n");}
    | term '/' factor  {printf("Div  \n"); $$ = $1 / $3; fprintf(file,"idiv \n");}
    ;

factor
    : NUMBER   { $$ = $1; fprintf(file,"ldc %d\n" , $1);}
    | group   { $$ = $1; fprintf(file,"ldc %d\n" , $1);}
    ;

group
    : '(' expression ')' { $$ = $2; }
    ;

%%
int main(int argc, char** argv)
{

	file = fopen("Computer.j","w");
	
	fprintf(file,	".class public main\n"
		     	".super java/lang/Object\n"
			".method public static main([Ljava/lang/String;)V\n"
			"	.limit stack %d\n"
			"	.limit locals %d\n",10,10);

    	yyparse();


	fprintf(file,	"return\n"
		     	".end method\n");
	
	fclose(file);
	printf("Generated: %s\n","Computer.j");

    	return 0;
}


void yyerror(char *s) {
    printf("%s on %d line \n", s , yylineno);
}


