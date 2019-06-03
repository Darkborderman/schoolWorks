/* Definition section */
%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <ctype.h>
	#include <string.h>

	/* Symbol table function */
	void create_symbol();
	void insert_symbol();
	int lookup_symbol();
	void dump_symbol();
	void test_id();
	void test_command();

	int var_num = 0;
	int flag = 0;
	struct data{
		char id[30];
		int type;
		char type_name[10];
		int error_line;
	}symbol_table[100];

	char id_buf[30];
	int type_buf = 0;
	char type_name_buf[10];
	int error_line_buf = 0;
	char last_token[5];

	int line_num = 0;
	int comment_line = 0;
	int comment_flag = 0;

%}

/* Define regular expression label */

letter [a-zA-Z]
digit [0-9]
id {letter}+({letter}|{digit})*
number {digit}+
%x	string
%x	comment

/* Rules section */
%%

" "		{;}
"+" 	{ printf("%s \t Add \n", yytext); }
"-"		{ printf("%s \t Sub \n", yytext); }
"*"		{ printf("%s \t Multiply \n",yytext); }
"/"		{ printf("%s \t Divide \n",yytext); }
"%"		{ printf("%s \t Remain \n",yytext); }
"++"	{ printf("%s \t Increment \n",yytext); }
"--"	{ printf("%s \t Decrement \n",yytext); }
"="		{ printf("%s \t Assign \n",yytext); }
"+="	{ printf("%s \t Add Assignment \n",yytext); }
"-="	{ printf("%s \t Sub Assignment \n",yytext); }
"*="	{ printf("%s \t Multiply Assignment \n",yytext); }
"/="	{ printf("%s \t Divide Assignment \n",yytext); }
"%="	{ printf("%s \t Remain Assignment \n",yytext); }
">"		{ printf("%s \t Greater than \n",yytext); }
"<"		{ printf("%s \t Less than \n",yytext); }
">="	{ printf("%s \t Greater than or Equal to \n",yytext); }
"<="	{ printf("%s \t Less than or Equal to \n",yytext); }
"=="	{ printf("%s \t Equal to \n",yytext); }
"!="	{ printf("%s \t Not Equal to \n",yytext); }
"&&"	{ printf("%s \t And \n",yytext); }
"||"	{ printf("%s \t Or \n",yytext); }
"!"		{ printf("%s \t Not \n",yytext); }
"("		{ printf("%s \t LB \n",yytext); }
")"		{ printf("%s \t RB \n",yytext); }
"{"		{ printf("%s \t LCB \n",yytext); }
"}"		{ printf("%s \t RCB \n",yytext); }

"print" { printf("%s \t PRINT function \n",yytext); }
"println"	{ printf("%s \t PRINTLN function \n",yytext); }
"for"	{ printf("%s \t FOR function \n",yytext); }
"if"	{ printf("%s \t IF function \n",yytext); }
"else"	{ printf("%s \t ELSE function \n",yytext); }

"var"	{ flag = 1; }
"int"	{ printf(" %s TYPE VAR\n",yytext); type_buf = 1; insert_symbol(id_buf,type_buf,yytext); }
"float32"	{ printf(" %s TYPE VAR\n",yytext); type_buf = 2; insert_symbol(id_buf,type_buf,yytext); }

["]					{ printf("%s \t Quotation \n",yytext); BEGIN string; }
	<string>[^"]*	{ printf("%s \t String \n",yytext);  }
	<string>["]		{ printf("%s \t Quotation \n",yytext); BEGIN 0; }

"//".*"\n"	{ printf("%s \t Comment \n",yytext); comment_line++; line_num++; }
"/*"						{ printf("%s",yytext); BEGIN comment; }
	<comment>[^*\n]*		{ printf("%s",yytext); }
	<comment>"*"[^*/\n]*	{ printf("%s",yytext); }
	<comment>\n				{ printf("%s",yytext); line_num++; comment_line++; }
	<comment>"*/"			{ printf("%s \t Comment \n",yytext);BEGIN 0; comment_flag = 1; }

{id}	{ strcpy(id_buf,yytext); test_id(yytext,type_buf,type_name_buf); }
{number}	{ printf("%s \t Number \n", yytext); }
[\n]		{ line_num++; test_command(); }


%%

/*	C Code section */
int yywrap(void)
{
    return 1;
}

void create_symbol()
{
	printf("Create a symbol table\n");
}

void insert_symbol(char *id,int type,char *type_name_buf)
{
	if(var_num == 0){
		create_symbol();
	}

	if(lookup_symbol(id) == -1){
		printf("Insert a symbol : %s\n",id);
		strcpy(symbol_table[var_num].id,id);
		symbol_table[var_num].type = type;
		strcpy(symbol_table[var_num].type_name,type_name_buf);
		var_num++;
		flag = 0;
		type_buf = 0;
	}

	else if(lookup_symbol(id) > -1){
		printf("\t Error : ID Redefined \t Line : %d \n",line_num + 1);
		strcpy(symbol_table[var_num].id,id);
		symbol_table[var_num].type = type;
		strcpy(symbol_table[var_num].type_name,"redefined");
		symbol_table[var_num].error_line = line_num + 1;
		var_num++;
		flag = 0;
		type_buf = 0;
	}
}

int lookup_symbol(char *id)
{
	int i;
	for(i = 0;i < var_num;i++){
		if(strcmp(symbol_table[i].id,id) == 0)	return i;
	}

	return -1;
}

void dump_symbol()
{
	int i;
	printf("\n");
	printf("The symbol table dump : \n");
	for(i = 0;i < var_num;i++){
		printf("%d\t %s\t %s\n",i + 1,symbol_table[i].id,symbol_table[i].type_name);
	}
}

void test_id(char *id,int type,char *type_name_buf)
{
	if(flag)	printf("%s \t",id);
	else{
		if(lookup_symbol(id) == -1){
			printf("%s \t Error : ID Undeclared \t Line : %d \n",id,line_num + 1);
			strcpy(symbol_table[var_num].id,id);
			symbol_table[var_num].type = type;
			strcpy(symbol_table[var_num].type_name,"undeclared");
			symbol_table[var_num].error_line = line_num + 1;
			var_num++;
			flag = 0;
			type_buf = 0;
		}

		else	printf("%s \t ID \n",id);
	}
}

void test_command(){
	if(comment_flag)	comment_line++;

	comment_flag = 0;
}

int main(int argc,char *argv[])
{
	yyin = fopen(argv[1],"r");
	yylex();

	printf("\n");
	printf("Parse over,the line number is %d\n",line_num);
	printf("\n");
	printf("comment: %d lines\n",comment_line);
	dump_symbol();

	return 0;
}
