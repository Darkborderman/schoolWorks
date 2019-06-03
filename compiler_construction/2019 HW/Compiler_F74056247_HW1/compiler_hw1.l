/* Definition section */
%{
	#include <stdio.h>
	#include <stdlib.h>

	int commentCount=0;
%}

/* Define regular expression label */

letter [a-zA-Z]
id {letter}+({letter}|[0-9])*
integer [0-9]+
floating [0-9]+[.][0-9]+
	/* string must excape \" \\ \* and such */
string \"(\$\{.*\}|\\.|[^\"\\])*\"

/* Rules sections */
%%
	/*Arithmetic operators*/
"+" { printf("%s \t ADD\n",yytext); }
"-"	{ printf("%s \t SUB\n",yytext); }
"*" { printf("%s \t MUL\n",yytext); }
"/" { printf("%s \t DIV\n",yytext); }
"%" { printf("%s \t MOD\n",yytext); }
"++" { printf("%s \t INC\n",yytext); }
"--" { printf("%s \t DEC\n",yytext); }

	/*Comparison operators*/
">" { printf("%s \t MT\n",yytext); }
"<" { printf("%s \t LT\n",yytext); }
">=" { printf("%s \t MTE\n",yytext); }
"<=" { printf("%s \t LTE\n",yytext); }
"==" { printf("%s \t EQ\n",yytext); }
"!=" { printf("%s \t NE\n",yytext); }

	/*Assignment operators*/
"="	{ printf("%s \t ASGN\n",yytext); }
"+=" { printf("%s \t ADDASGN\n",yytext); }
"-=" { printf("%s \t SUBASGN\n",yytext); }
"*=" { printf("%s \t MULASGN\n",yytext); }
"/=" { printf("%s \t DIVASGN\n",yytext); }

	/*Logical operators */
"&&" { printf("%s \t AND\n",yytext); }
"||" { printf("%s \t OR\n",yytext); }
"!" { printf("%s \t NOT\n",yytext); }

	/*Keywords*/
"int" { printf("%s \t INT\n",yytext); }
"float" { printf("%s \t FLOAT\n",yytext); }
"bool" { printf("%s \t BOOL\n",yytext); }
"void" { printf("%s \t VOID\n",yytext); }
"print" { printf("%s \t PRINT\n",yytext); }
"if" { printf("%s \t IF\n",yytext); }
"else" { printf("%s \t ELSE\n",yytext); }
"for" { printf("%s \t FOR\n",yytext); }
"while" { printf("%s \t WHILE\n",yytext); }
"true" { printf("%s \t TRUE\n",yytext); }
"false" { printf("%s \t FALSE\n",yytext); }
"return" { printf("%s \t RET\n",yytext); }
"continue" { printf("%s \t CONT\n",yytext); }
"break" { printf("%s \t BREAK\n",yytext); }
"string" { printf("%s \t STRING\n",yytext); }
{string} {
		printf("\" \t QUOTA\n");

		for(int i=1;i<=strlen(yytext)-2;i++)
			printf("%c", yytext[i]);
		
		printf(" \t STR_CONST\n");
		printf("\" \t QUOTA\n");
	}

	/*other symbols */
"(" { printf("%s \t LB\n",yytext); }
")" { printf("%s \t RB\n",yytext); }
"[" { printf("%s \t LSB\n",yytext); }
"]" { printf("%s \t RSB\n",yytext); }
"{" { printf("%s \t LCB\n",yytext); }
"}" { printf("%s \t RCB\n",yytext); }
";" { printf("%s \t SEMICOLON\n",yytext); }
"," { printf("%s \t COMMA\n",yytext); }
"\n" {;}
" " {;}


{id}	{ printf("%s \t ID\n", yytext); }
{integer} {printf("%s \t I_CONST\n",yytext);}
{floating} {printf("%s \t F_CONST\n",yytext);}
"/*"([^*]|\*+[^*/])*\*+"/" {
	for(int i=0;i<=strlen(yytext)-1;i++){
		if(yytext[i]=='\n')
			commentCount++;
	}
	printf("%s \t C Comment\n", yytext);
	commentCount++;
	}
("//")[^\n\r]* {
	commentCount++;
	printf("%s \t C++ Comment\n", yytext);
	}

%%

/*	C Code section */
int yywrap(void)
{
    return 1;
}
//remove trailing whitespace and newline

int main(int argc,char *argv[])
{
	yyin = fopen(argv[1],"r");
	yylex();
	fclose(yyin);

	FILE *fp=fopen(argv[1],"r");
	int lineCount=0;
	char c;
	while((c=fgetc(fp))!=EOF)
	{
		if(c=='\n') lineCount++;
	}
	
	printf("\nParse over, the line number is %d.\n\n",lineCount);
	printf("comment: %d lines\n\n",commentCount);

	return 0;
}
