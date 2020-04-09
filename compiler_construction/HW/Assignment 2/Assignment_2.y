/*
	Topic: Homework2 for Compiler Course
	Deadline: xxx.xx.xxxx
*/

%{

/*	Definition section */
/*	insert the C library and variables you need */

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

/*Extern variables that communicate with lex*/

extern int yylineno;
extern int yylex();

void yyerror(char *);


/*	Symbol table function

	TAs create the basic function which you have to fill.
	We encourage you define new function to make the program work better.
	However, the five basic functions must be finished.
*/

void create_symbol();								/*establish the symbol table structure*/
void insert_symbol(char* id, char* type, int data);	/*Insert an undeclared ID in symbol table*/
void symbol_assign(char* id, int data);				/*Assign value to a declared ID in symbol table*/
int lookup_symbol(char* id);						/*Confirm the ID exists in the symbol table*/
void dump_symbol();									/*List the ids and values of all data*/

int symnum;											/*The number of the symbol*/

/* Note that you should define the data structure of the symbol table yourself by any form */

%}

/* Token definition */
%token SEM PRINT WHILE INT DOUBLE LB RB
%token STRING ADD SUB MUL DIV
%token ASSIGN NUMBER FLOATNUM ID 

/* Type definition : 

	Define the type by %union{} to specify the type of token

*/

/* Type declaration : 
	
	Use %type to specify the type of token within < > 
	if the token or name of grammar rule will return value($$) 

*/

%%

/* Define your parser grammar rule and the rule action */

lines
    : 
    | lines Stmt
    ;

// define statement type Declaration, Assign, Print, Arithmetic and Branch
Stmt
	:
    ;

%%

int main(int argc, char** argv)
{
    yylineno = 0;
    symnum = 0;
    
    yyparse();

	printf("%d \n\n",yylineno);
	dump_symbol();
    return 0;
}

void yyerror(char *s) {
    printf("%s on %d line \n", s , yylineno);
}


/*symbol create function*/
void create_symbol() {

}

/*symbol insert function*/
void insert_symbol(char* id, char* type, int data) {
	
}


/*symbol value lookup and check exist function*/
int lookup_symbol(char* id){
	
}

/*symbol value assign function*/
void symbol_assign(char* id, int data) {
	
}

/*symbol dump function*/
void dump_symbol(){
	
}
