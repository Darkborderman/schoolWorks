/* Maybe I'll hate compiler construction from now on*/
/* This assigment is really, really difficult to me*/
/* I feel awful for writing bad, unmaintainable code.  Sucks*/
/*	Definition section */
%{
#include<string.h>
#include<stdlib.h>
#include<stdio.h>
extern int yylineno;
extern int yylex();
extern char* yytext;   // Get current token from lex
extern char buf[256];  // Get current code line from lex
void yyerror(char *s);
void sematic_error(char *reason,char* variable);

typedef struct Symbols {
   char* name;
   char* kind;
   char* type;
   char* attribute;
} Symbol;

// symbolTable[scope count][max variable number]
// when exit the scope then set index to 0, -- scope number  
// and dump symbol
Symbol symbolTable[10][20];
// store each row variable count of symbolTable  
int symbolIndex[10];
// store current scope number
// if wanna print dump then use printDump=1
// lex will print dump and decrement scope
// if only wanna decrement scope just -- 
int scopeNumber=0;
int indexNumber=0;
int printDump=0;

/* Symbol table function - you can add new function if needed. */
int lookup_symbol(char *name);
int lookup_table(char *name);
void create_symbol();
void insert_symbol(char* name,char* kind,char* type, int scopeNumber, int indexNumber);
void dump_symbol();

%}

/* Use variable or self-defined structure to represent
 * nonterminal and token type
 */
%union {
    int i_val;
    double f_val;
    char* string;
}

/* Token without return */
%token ADD SUB MUL DIV MOD INC DEC
%token MT LT MTE LTE EQ NE
%token ASGN ADDASGN SUBASGN MULASGN DIVASGN MODASGN
%token AND OR NOT
%token LB RB LCB RCB LSB RSB COMMA
%token PRINT 
%token IF ELSE FOR WHILE
%token VOID INT FLOAT STRING BOOL
%token TRUE FALSE
%token RETURN SEMICOLON

/* Token with return, which need to sepcify type */
%token <i_val> I_CONST
%token <f_val> F_CONST
%token <string> STRING_LITERAL
%token <string> ID

/* Nonterminal with return, which need to sepcify type */
%type <string> type
%type <string> function_parameter
%type <string> declaration_statement
%type <string> function_scope


/* Yacc will start at this nonterminal */
%start program

/* Grammar section */
%%

program
    : program statements
    | statements

statements
    : statement
    | function_declaration

statement
    : declaration_statement SEMICOLON
    | expression_statement
    | if_statement
    | while_statement

declaration_statement
    : type ID ASGN arithmetic_statement {
        if(lookup_symbol($2)==0){
            insert_symbol($2,"variable",$1,scopeNumber,indexNumber);
            indexNumber++;
            symbolIndex[scopeNumber]++;
        }else sematic_error("Redeclared variable",$2);
        $$=$1;
     }
    | type ID {
        if(lookup_symbol($2)==0){
            insert_symbol($2,"variable",$1,scopeNumber,indexNumber);
            indexNumber++;
            symbolIndex[scopeNumber]++;
        }else sematic_error("Redeclared variable",$2);
        $$=$1;
     }
    | declaration_statement COMMA ID {
        if(lookup_symbol($3)==0){
            insert_symbol($3,"variable",$1,scopeNumber,indexNumber);
            indexNumber++;
            symbolIndex[scopeNumber]++;
        }else sematic_error("Redeclared variable",$3);
    }
    | declaration_statement COMMA ID ASGN arithmetic_statement{
        if(lookup_symbol($3)==0){
            insert_symbol($3,"variable",$1,scopeNumber,indexNumber);
            indexNumber++;
            symbolIndex[scopeNumber]++;
        }else sematic_error("Redeclared variable",$3);
    }
    | declaration_statement COMMA declaration_statement

arithmetic_statement
    : LB arithmetic_statement RB
    | arithmetic_statement ADD arithmetic_statement
    | arithmetic_statement SUB arithmetic_statement
    | arithmetic_statement MUL arithmetic_statement
    | arithmetic_statement DIV arithmetic_statement
    | arithmetic_statement MOD arithmetic_statement
    | INC arithmetic_statement
    | DEC arithmetic_statement
    | arithmetic_statement INC
    | arithmetic_statement DEC
    | value

expression_statement
    : assignment_statement SEMICOLON
    | execution_statement SEMICOLON
    | arithmetic_statement SEMICOLON
    | RETURN arithmetic_statement SEMICOLON
    | RETURN SEMICOLON

assignment_statement
    : ID ASGN arithmetic_statement { if(lookup_table($1)==0) sematic_error("Undeclared variable",$1); }
    | ID ADDASGN arithmetic_statement { if(lookup_table($1)==0) sematic_error("Undeclared variable",$1); }
    | ID SUBASGN arithmetic_statement { if(lookup_table($1)==0) sematic_error("Undeclared variable",$1); }
    | ID MULASGN arithmetic_statement { if(lookup_table($1)==0) sematic_error("Undeclared variable",$1); }
    | ID DIVASGN arithmetic_statement { if(lookup_table($1)==0) sematic_error("Undeclared variable",$1); }
    | ID MODASGN arithmetic_statement { if(lookup_table($1)==0) sematic_error("Undeclared variable",$1); }
    | assignment_statement COMMA assignment_statement

execution_statement
    : PRINT LB argument_list RB
    | ID LB argument_list RB { if(lookup_table($1)==0) sematic_error("Undeclared variable",$1); }
    | ID LB RB{ if(lookup_table($1)==0) sematic_error("Undeclared variable",$1); }

argument_list
    : value
    | value COMMA argument_list

value
    : I_CONST
    | F_CONST
    | TRUE
    | FALSE
    | STRING_LITERAL
    | ID { if(lookup_table($1)==0) sematic_error("Undeclared variable",$1); }

function_declaration
    : function_parameter function_scope {
        if(symbolIndex[scopeNumber]!=-1) printDump=1;
        else scopeNumber--; }
    | function_parameter SEMICOLON {
        scopeNumber--;
        }

function_parameter
    : type ID LB parameter_list RB {
        insert_symbol($2,"function",$1,scopeNumber,symbolIndex[scopeNumber]+1);
        symbolIndex[scopeNumber]++;
        scopeNumber++;
        }
    | type ID LB RB {
        insert_symbol($2,"function",$1,scopeNumber,symbolIndex[scopeNumber]+1);
        symbolIndex[scopeNumber]++;
        scopeNumber++;
        }

 /*Since here scope hasn't derived, this f**king basterd*/
 /*We need to +1 to advance to correct scope*/
parameter_list
    :type ID {
        if(lookup_symbol($2)==0){
            insert_symbol($2,"parameter",$1,scopeNumber+1,symbolIndex[scopeNumber+1]+1);
            symbolIndex[scopeNumber+1]++;
        }
     }
    | parameter_list COMMA type ID {
        if(lookup_symbol($4)==0){
            insert_symbol($4,"parameter",$3,scopeNumber+1,symbolIndex[scopeNumber+1]+1);
            symbolIndex[scopeNumber+1]++;
        }
     }

function_scope
    :LCB program RCB {
        indexNumber=0;
    }

if_statement
    : IF LB condition RB function_scope {
        if(symbolIndex[scopeNumber]!=-1) printDump=1;
        else scopeNumber--; }
    | IF LB condition RB function_scope else_statement {
        if(symbolIndex[scopeNumber]!=-1) printDump=1;
        else scopeNumber--; }
    | IF LB condition RB SEMICOLON { scopeNumber--; }

else_statement
    : ELSE if_statement {
        if(symbolIndex[scopeNumber]!=-1) printDump=1;
        else scopeNumber--; }
        /* since I judge scope by condition*/
        /* I need to add fxxking 1 to prevent SEGFAULT*/
    | ELSE function_scope {
        scopeNumber++;
        if(symbolIndex[scopeNumber]!=-1) printDump=1;
        else scopeNumber--; }

while_statement
    : WHILE LB condition RB function_scope {
        if(symbolIndex[scopeNumber]!=-1) printDump=1;
        else scopeNumber--; }
    | WHILE LB condition RB SEMICOLON { scopeNumber--; }

condition
    : arithmetic_statement comparaters arithmetic_statement {scopeNumber++; indexNumber=0;}
    | arithmetic_statement {scopeNumber++; indexNumber=0;}

comparaters
    : EQ
    | LT
    | LTE
    | MT
    | MTE
    | NE

/* actions can be taken when meet the token or rule */
type
    : VOID { $$ = "VOID"; }
    | BOOL  { $$ = "BOOL"; } 
    | FLOAT { $$ = "FLOAT"; }
    | INT { $$ = "INT"; }
    | STRING { $$ = "STRING"; }

%%



/* C code section */
int main(int argc, char** argv)
{
    yylineno = 0;
    create_symbol();

    yyparse();
    dump_symbol();
	printf("\nTotal lines: %d \n",yylineno+1);

    return 0;
}

void yyerror(char *s)
{
    printf("%d:%s",yylineno+1,buf);
    printf("\n|-----------------------------------------------|\n");
    printf("| Error found in line %d: %s\n", yylineno+1, buf);
    printf("| %s", s);
    printf("\n|-----------------------------------------------|\n\n");
}
void sematic_error(char *reason,char* variable){
    printf("%d:%s",yylineno+1,buf);
    printf("\n|-----------------------------------------------|\n");
    printf("| Error found in line %d: %s\n", yylineno+1, buf);
    printf("| %s %s", reason,variable);
    printf("\n|-----------------------------------------------|\n\n");
}

void create_symbol() {
    for(int i=0;i<=9;i++){
        for(int j=0;j<=19;j++){
            symbolTable[i][j].name="";
            symbolTable[i][j].kind="";
            symbolTable[i][j].type="";
            symbolTable[i][j].attribute="";
        }
        symbolIndex[i]=-1;
    }
    //use array, no need to renew array
}
void insert_symbol(char* name,char* kind,char* type, int scopeNumber, int indexNumber) {
    symbolTable[scopeNumber][indexNumber].name=name;
    symbolTable[scopeNumber][indexNumber].kind=kind;
    symbolTable[scopeNumber][indexNumber].type=type;
    symbolTable[scopeNumber][indexNumber].attribute="";
}
//0 -> never appeared before, 1-> appeared before
int lookup_symbol(char *name) {
    for(int i=0;i<=symbolIndex[scopeNumber];i++){
        //search through symbol table
        if (strcmp(symbolTable[scopeNumber][i].name,name) == 0){
             return 1;
         }
    }
    return 0;
}
//much like loopup_symbol, but look the full table smaller to its scope
//0-> never appeared before, 1-> appeared before
int lookup_table(char *name){
    for(int i=0;i<=scopeNumber;i++){
        for(int j=0;j<=symbolIndex[i];j++){
            if(strcmp(symbolTable[i][j].name,name)==0){
                return 1;
            }
        }
    }
    return 0;
}
void dump_symbol() {
    printf("\n%-10s%-10s%-12s%-10s%-10s%-10s\n\n",
           "Index", "Name", "Kind", "Type", "Scope", "Attribute");
    
    // print index-lengthed variable information
    for(int i=0;i<=symbolIndex[scopeNumber];i++){
        printf("%-10d%-10s%-12s%-10s%-10d%-10s\n\n",
            i,symbolTable[scopeNumber][i].name,symbolTable[scopeNumber][i].kind,symbolTable[scopeNumber][i].type,scopeNumber,"");
    }
    printf("\n");
}

// insert variable,parameter,and function
