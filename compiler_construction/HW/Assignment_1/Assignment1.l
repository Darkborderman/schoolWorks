%{

/*	Definition section */

/*	insert the C library and variables you need */

	#include <stdio.h>
	#include <stdlib.h>
	#include <ctype.h>
	#include <string.h>

/*
	Symbol table function

	TAs create the basic function which you have to fill.
	We encourage you define new function to make the program work better.
	However, the four basic functions must be finished.
*/
	void create_symbol();
	void insert_symbol();
	int lookup_symbol();
	void dump_symbol();
	int line_num = 1;

	int var_num=0;
	struct data_block{
		char name[30];
		int type_num;
		char type_name[6];
	}symbol_table[100];
	int type_buf;
	char type_name_buf[10];
	void print_type(char* id,int mode,char* name);

%}

/*	define regular expression label */

letter [a-zA-Z]
digit [0-9]
id {letter}+({letter}|{digit})*
%x INPUT_STRING1
%x INPUT_STRING2
%x COMMENT1
%x COMMENT2
%x COMMENT3
%x comment

%%

 /*	Rules section */

" "					{;}
[i|I][n|N][t|T]		{type_buf = 1; strcpy(type_name_buf,yytext);}
[d|D][o|O][u|U][b|B][l|L][e|E] {type_buf = 2; strcpy(type_name_buf,yytext);}
";" 				{printf("%s \t SEMICOLON \n",yytext); type_buf=0;type_name_buf[0]='\0';}
","					{printf("%s \t COMMA \n",yytext);}
[p|P][r|R][i|I][n|N][t|T] {printf("%s \t PRINT FUNCTION \n",yytext);	/* C action code */	;}
"//".*"\n"		{printf("%s \t COMMENT1 \n",yytext); ++line_num;}
"/*"				{printf("%s",yytext); BEGIN comment;}
	   <comment>[^*\n]*	   {printf("%s",yytext);}
	   <comment>"*"+[^*/\n]*   {printf("%s",yytext);}
	   <comment>\n		   {printf("%s",yytext);++line_num;}
	   <comment>"*"+"/"	   {printf("%s\n \t COMMENT2 \n",yytext);BEGIN 0;}

["]					{printf("%s \t QUOTATION \n",yytext); BEGIN INPUT_STRING1;}
	<INPUT_STRING1>[^"]*	{printf("%s \t STINRG \n",yytext); BEGIN INPUT_STRING2;}
	<INPUT_STRING2>["]		{printf("%s \t QUOTATION \n",yytext); BEGIN 0;}


[i|I][f|F]			{printf("%s \t IF FUNCTION\n",yytext);}
[e|E][l|L][s|S][e|E] {printf("%s \t ELSE FUNCTION\n",yytext);}
[w|W][h|H][i|I][l|L][e|E] {printf("%s \t WHILE FUNCTION\n",yytext);}
"=" 				{printf("%s \t ASSIGN \n",yytext);}
[f|F][o|O][r|R]		{printf("%s \t FOR FUNCTION\n",yytext);}

{id} 				{print_type(yytext,type_buf,type_name_buf); insert_symbol(yytext,type_buf,type_name_buf);}
{digit}+"."{digit}+	{printf("%s \t FLAOTNUMBER \n",yytext);}
{digit}+			{printf("%s \t NUMBER \n",yytext);}
[\n]+				{line_num++;}
[\t]+				{;}

[>|<|>=|<=|==|!=]	{printf("%s \t RELATIONAL \n",yytext);}
[+|-|*|/|]			{printf("%s \t OPERATOR \n",yytext);}
"%"					{printf("%s \t REMAINDER \n",yytext);}
"^"					{printf("%s \t EXPONENTIATION \n",yytext);}
"("					{printf("%s \t LB \n",yytext);}
")"					{printf("%s \t RB \n",yytext);}

[\n|.]*				{;}

%%

/*	C Code section */

/*	You have to define your C function in this section */

int main(int argc,char *argv[]){

	var_num=0;
	yyin = fopen(argv[1],"r");
	yylex();

	printf("Parse over, the line number is %d\n\n",line_num);
	dump_symbol();

	return 0;
}

int yywrap(void) {
    return 1;
}

void create_symbol(){
	printf("Create a symbol table\n");
}

void insert_symbol(char* s,int mode,char* name){

	if(var_num==0)
		create_symbol();

	if(lookup_symbol(s)==-1){
		printf("Insert a symbol:%s\n",s);
		strcpy(symbol_table[var_num].name,s);
		symbol_table[var_num].type_num = mode;
		if(mode==0)
			strcpy(symbol_table[var_num].type_name,"undefined");
		else
			strcpy(symbol_table[var_num].type_name,name);

		var_num++;
	}
	
}

int lookup_symbol(char* sym){
	for(int i=0;i<var_num;i++){
		if(strcmp(symbol_table[i].name,sym)==0)
			return i;
	}
	return -1;
}

void dump_symbol(){
	printf("The symbol table dump:\n");
	for(int i=0;i<var_num;i++){
		printf("%d \t %s\t%s\n",i+1,symbol_table[i].name,symbol_table[i].type_name);
	}
}

void print_type(char* id,int mode,char* name)
{
	if(lookup_symbol(id)==-1)
	{
		switch(mode)
		{
			case 1:
				printf("%s \t %s TYPE VAR\n",id,name);
				break;
			case 2:
				printf("%s \t %s TYPE VAR\n",id,name);
				break;
			default:
				break;
		}
	}
	else
		printf("%s \t ID\n",id);
}