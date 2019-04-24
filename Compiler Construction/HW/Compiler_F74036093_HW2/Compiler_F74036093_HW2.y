/*
	Topic: Homework2 for Compiler Course
	Deadline: xxx.xx.xxxx
*/

%{

/*	Definition section */
/*	insert the C library and variables you need */

#define HASHTABLESIZE 200
#define MAXIMUM_ID_LENGTH 100

#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_RESET   "\x1b[0m"

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

/*Extern variables that communicate with lex*/

extern int yylineno;
extern int yylex();

extern FILE *yyin;

void yyerror(char *);

struct Bucket{
	int occupy;
	int index;				/* determine the declare order of symbols */
	int value_assigned;		/* determine whether the symbol is given a value or not */
	
	char *id;
	char *type;
	int int_data;
};


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

int hash_function(char* s);
int myError(char *id, int error_num);

struct Bucket *symbolTable;
int error_flag;


/* Note that you should define the data structure of the symbol table yourself by any form */

%}

/* Token definition */
%token SEM PRINT WHILE INT DOUBLE LB RB
%token STRING ADD SUB MUL DIV
%token ASSIGN NUMBER FLOATNUM ID 

/* Type definition : 

	Define the type by %union{} to specify the type of token

*/
%union{
	double double_val;
	int int_val;
	char string_val[200];
}



/* Type declaration : 
	
	Use %type to specify the type of token within < > 
	if the token or name of grammar rule will return value($$) 

*/


%type <string_val> Type
%type <int_val> Assign
%type <int_val> Arith
%type <int_val> Term
%type <int_val> Factor
%type <string_val> Print
%type <int_val> Group

%type <string_val> ID
%type <string_val> STRING
%type <int_val> NUMBER
%type <double_val> FLOATNUM



%%

/* Define your parser grammar rule and the rule action */

Line
    :
	| Line Stmt				{ error_flag = 0; }
    ;

// define statement type Declaration, Assign, Print, Arithmetic and Branch
Stmt
	: Decl SEM
	| Print SEM
	| Assign SEM
	| Arith SEM				{}
    ;

Decl
	: Type ID				{ 
								//printf("insert symbol %s \n", $2);
								if(lookup_symbol($2) != -1){
									myError($2, 2);
								}else{
									insert_symbol($2, $1, 0);
								}
							}
	| Type ID ASSIGN Arith	{
								//printf("insert symbol %s \n", $2);
								//printf("assign symbol %s with %d\n", $2, $4);
								if(lookup_symbol($2) != -1){
									myError($2, 2);
								}else{
									insert_symbol($2, $1, 0);
									symbol_assign($2, $4);
								}
							}
	;
	
Type
	: INT					{	
								char *insert_type = (char*)malloc(6*sizeof(char));
								strcpy(insert_type,"int");
								strcpy($$, insert_type);
							}
	| DOUBLE				{
								char *insert_type = (char*)malloc(6*sizeof(char));
								strcpy(insert_type,"double");
								strcpy($$, insert_type);
							}
	;
	
Assign
	: ID ASSIGN Arith		{ 
								printf("ASSIGN\n");
								
								
								if(lookup_symbol($1) == -1){
									myError($1, 1);
									$$ = 0;
								}else if(error_flag){
									/* divide by 0 */
									$$ = 0;
								}else{
									symbol_assign($1, $3);	
									$$ = $3;
								}
							}
	;
	
Arith
	: Term					{	$$ = $1; }
	| Arith ADD Term		{ 
								printf("Add\n");
								$$ = $1 + $3; 
							}
	| Arith SUB Term		{ 
								printf("Sub\n");
								$$ = $1 - $3; 
							}
	;
	
Term
	: Factor				{	$$ = $1; }
	| Term MUL Factor		{ 
								printf("Mul\n");
								$$ = $1 * $3;
								//printf("mul %d\n", $1*$3);
							}
	| Term DIV Factor		{ 
								if($3 == 0){
									myError(NULL, 3);
									$$ = $1;
								}else{
									printf("Div\n");
									$$ = $1 / $3;
								}
							}
	;
	
Factor
	: Group					{	$$ = $1; }
	| NUMBER				{	$$ = $1; }
	| ID					{	
								if(lookup_symbol($1) == -1){
									myError($1, 1);
									$$ = 0;
								}else{
									$$ = symbolTable[lookup_symbol($1)].int_data;
								}
							}
	;
	
Print
	: PRINT Group			{
								if(error_flag){
									/* printf("Print : %d\n", $2); */
								}else{
									printf("Print : %d\n", $2);
								}
							}
	| PRINT LB STRING RB	{
								printf("Print : %s\n", $3);
							}
	;
	
Group
	: LB Arith RB			{ $$ = $2; }
	;

%%

int main(int argc, char** argv)
{
	yylineno = 1;
    symnum = 0;
	error_flag = 0;
	yyin = fopen(argv[1],"r");
	
    yyparse();

	printf("\n\nTotal lines: %d \n\n",yylineno);
	dump_symbol();
    return 0;
}

void yyerror(char *s) {
    printf("%s on %d line \n", s , yylineno);
}

int myError(char *id, int error_num) {
	/* case 1: Operate on undeclared variables */
	/* case 2: Re-define variables */
	/* case 3: Handle divided-by-zero error */
	error_flag = 1;
	printf(ANSI_COLOR_RED "<ERROR> " ANSI_COLOR_RESET);
	printf("on line %d: ", yylineno);
	
	switch(error_num)
	{
		case 1:
			printf("cannot find variable %s\n", id);
			break;
		case 2:
			printf("re-declaration for variable %s\n", id);
			break;
		case 3:
			printf("the division can not be 0\n");
			break;
		default:
			return -1;
	}
	return 0;
}


/*symbol create function*/
void create_symbol() {
	symbolTable = calloc(HASHTABLESIZE , sizeof(struct Bucket));
	printf("Create symbol table\n");
}

/*symbol insert function*/
/*  this function only insert the symbol and don't assign
	the value of the symbol , if you want to assign the value,
	use function "void symbol_assign(char* id, int data)" 		*/
void insert_symbol(char* id, char* type, int data) {
	if(symbolTable == NULL){
		create_symbol();
	}
	symnum++;
	char *insert_id = malloc(MAXIMUM_ID_LENGTH*sizeof(char));
	char *insert_type = malloc(6*sizeof(char));
	strcpy(insert_id, id);
	strcpy(insert_type, type);
	int bucket = hash_function(id);
	int temp = bucket;
	
	while(symbolTable[bucket].occupy != 0){
		bucket = (bucket + 1) % HASHTABLESIZE;
		if(bucket == temp){
			return;	/* the table is full */
		}
	}
	printf("Insert symbol: %s\n",id);
	symbolTable[bucket].occupy = 1;
	symbolTable[bucket].index = symnum;
	symbolTable[bucket].value_assigned = 0;
	
	symbolTable[bucket].id = insert_id;
	symbolTable[bucket].type = insert_type;
	/* symbolTable[bucket].int_data = data; */
}


/*symbol value lookup and check exist function*/
int lookup_symbol(char* id){
	int bucket = hash_function(id);
	int temp = bucket;
	
	if(symbolTable == NULL){
		return -1;
	}
	
	//printf("buc: %d\n", bucket);
	while(1){
		if(symbolTable[bucket].occupy != 0){
			//printf("laba : %s\n", symbolTable[bucket].id);
			if(strcmp(symbolTable[bucket].id, id) == 0){
				return bucket;
			}
		}
		bucket = (bucket + 1) % HASHTABLESIZE;
		if(bucket == temp){
			return -1;	/* the variable is not in the table */
		}
		
	}
	return bucket;
}

/*symbol value assign function*/
void symbol_assign(char* id, int data) {
	int bucket = lookup_symbol(id);
	if(bucket == -1)
		return;
	
	symbolTable[bucket].value_assigned = 1;
	symbolTable[bucket].int_data = data;
}

/*symbol dump function*/
void dump_symbol(){
	int i, j, data;
	printf("The symbol table:\n");
	printf("\nID \t Type \t Data\n");
	for(i = 1; i <= symnum; i++){
		for(j = 0; j < HASHTABLESIZE; j++){
			if(symbolTable[j].index == i){
				if(symbolTable[j].value_assigned == 1){
					printf("%s \t %s \t %d\n", symbolTable[j].id, symbolTable[j].type, symbolTable[j].int_data);
				}else{
					printf("%s \t %s \t (not assigned)\n", symbolTable[j].id, symbolTable[j].type);
				}
				free(symbolTable[j].id);
				free(symbolTable[j].type);
			}
		}
	}
	free(symbolTable);
}


int hash_function(char* s){
	char *temp = s;
	int bucket = 0;
	int i;
	for(i = 0; i < strlen(s); i++){
		bucket += (int)(*temp);
		temp++;
	}
	bucket %= HASHTABLESIZE;
	return bucket;
}