/*	Definition section */
%{

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

#define ANSI_COLOR_RED "\x1b[31m"
#define ANSI_COLOR_RED_BROAD "\x1b[1;31m"
#define ANSI_COLOR_RESET "\x1b[0m"

extern int yylineno;
extern int yylex();
extern FILE *yyin;
void print_error(char *s, char *variable);

/* Symbol table function - you can add new function if need. */
int lookup_symbol(char *id, int flag, int check);
void create_symbol();
void insert_symbol(char* id, char* type, int type_mode, int flag);
void dump_symbol();
void assign_symbol(int id, double data);
void print_value(double data, int type, int mode);
void remove_symbol(int flag);
void yyerror(char *s);
void print_error(char *s, char *variable);

int var_num;
int var_flag;
int assign_flag;
int error_flag;
int type_flag;
int scope_flag = 0;
char print_buf[30];
int print_i = 0;
int id_flag = 0;

struct data{
	char id[30];

	int type;
	char type_name[10];

    int int_value;
    double dou_value;

    int assign_bit;
	int scope;
}symbol_table[100];

%}

/* Using union to define nonterminal and token type */
%union {
    int i_val;
    double f_val;
    char string[150];
    char *s_val;
}

/* Token without return */
%token PRINT PRINTLN
%token IF ELSE FOR
%token VAR NEWLINE INT FLOAT VOID

%token ADD SUB MUL DIV REMAIN INCR DECR
%token GREATER LESS GREATER_EQUAL LESS_EQUAL EQUAL NEQUAL
%token ASSIGN ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN REMAIN_ASSIGN
%token AND OR NOT LB RB LCB RCB

/* Token with return, which need to sepcify type */
%token <i_val> I_CONST
%token <f_val> F_CONST
%token <string> STRING
%token <string> ID
%token <string> COMMENTLINE

/* Nonterminal with return, which need to sepcify type */
%type <f_val> stat
%type <i_val> INT
%type <i_val> FLOAT
%type <i_val> VOID
%type <i_val> type
%type <f_val> initializer
%type <f_val> declaration
%type <f_val> expression_stat
%type <f_val> term
%type <f_val> val
%type <f_val> group
%type <f_val> compound_stat
%type <f_val> print_func
%type <i_val> compare
%type <f_val> compare_stat
%type <f_val> if_else_stat

/* Yacc will start at this nonterminal */
%start program

/* Grammar section */
%%

program
    : program stat  { assign_flag = 0; error_flag = 0; type_flag = 0; id_flag = 0; }
    |
;

stat
    : declaration
    | compound_stat
    | expression_stat
    | print_func
    | compare_stat
    | if_else_stat
;

declaration
    : VAR ID type ASSIGN val NEWLINE
    {
        if(lookup_symbol($2, scope_flag, 1) == -1){
            if($3 == 1){
                if(error_flag == 0){
                    if(type_flag == 2){
                        print_error("Assiging the float type to variable of int type",$2);
                    }

                    else{
                        insert_symbol($2,"int", $3, scope_flag);
                        assign_symbol(lookup_symbol($2, scope_flag, 1), $5);
                        printf("declare %s in block of depth %d \n", $2, scope_flag);
                    }
                }
            }

            else if($3 == 2){
                if(error_flag == 0){
                    insert_symbol($2,"float", $3, scope_flag);
                    assign_symbol(lookup_symbol($2, scope_flag, 1), $5);
                    printf("declare %s in block of depth %d \n", $2, scope_flag);
                }
            }
        }

        else if(lookup_symbol($2, scope_flag, 1) > -1){
            print_error("Redeclare the variable",$2);
        }
        yylineno++;
    }

    | VAR ID type NEWLINE
    {
        if(lookup_symbol($2, scope_flag, 1) == -1){
            if($3 == 1){
                if(error_flag == 0){
                    if(type_flag == 2){
                        print_error("Assiging the float type to variable of int type", $2);
                    }

                    else{
                        insert_symbol($2,"int", $3, scope_flag);
                        assign_symbol(lookup_symbol($2, scope_flag, 1), 0);
                        printf("declare %s in block of depth %d \n", $2, scope_flag);
                    }
                }
            }

            else if($3 == 2){
                if(error_flag == 0){
                    insert_symbol($2,"float", $3, scope_flag);
                    assign_symbol(lookup_symbol($2, scope_flag, 1), 0);
                    printf("declare %s in block of depth %d \n", $2, scope_flag);
                }
            }
        }

        else{
            print_error("Redeclare the variable",$2);
        }
        yylineno++;
    }
;

type
    : INT { $$ = 1; }
    | FLOAT { $$ = 2; }
    | VOID { $$ = 3; }
;

expression_stat
    : ID ASSIGN val NEWLINE
    {
        printf("ASSIGN \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }
		
        else{
            if(error_flag == 0){
                assign_symbol(temp, $3);
            }

            //printf("variable %s is depth %d \n", $1, scope_flag);
        }
        yylineno++;
    }

    | ID ADD_ASSIGN val NEWLINE
    {
        printf("ADD_ASSIGN \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;
        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }
		
        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value += $3;
                }

                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value += $3;
                }
                assign_symbol(temp, temp_value);
                //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }
        yylineno++;
    }

    | ID SUB_ASSIGN val NEWLINE
    {
        printf("SUB_ASSIGN \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;
        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }
		
        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value -= $3;
                }

                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value -= $3;
                }
                assign_symbol(temp, temp_value);
                //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }
        yylineno++;
    }

    | ID MUL_ASSIGN val NEWLINE
    {
        printf("MUL_ASSIGN \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;
        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }
		
        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value *= $3;
                }

                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value *= $3;
                }
                assign_symbol(temp, temp_value);
                //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }
        yylineno++;
    }

    | ID DIV_ASSIGN val NEWLINE
    {
        printf("DIV_ASSIGN \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;

        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }

        if($3 == 0){
            print_error("The devisor can't be 0", NULL);
            error_flag = 1;
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value /= $3;
                }

                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value /= $3;
                }
                assign_symbol(temp, temp_value);
                //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }
        yylineno++;
    }

    | ID REMAIN_ASSIGN val NEWLINE
    {
        printf("REMAIN_ASSIGN \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }

        if($3 == 0){
            print_error("The remainder can't be 0", NULL);
            error_flag = 1;
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    test = (int)temp_value % (int)$3;

                    if(type_flag == 2){
                        print_error("Float can't be mod", NULL);
                        error_flag = 1;
                    }
                    else{
                        assign_symbol(temp, temp_value);
                    }
                }
                else if(symbol_table[temp].type == 2){
                    print_error("Float can't be mod", NULL);
                    error_flag = 1;
                }
                //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }
        yylineno++;
    }

    | ID INCR NEWLINE
    {
        printf("Increment \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value++;
                }
                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value++;
                }
                assign_symbol(temp, temp_value);
                //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }
        yylineno++;
    }

    | ID DECR NEWLINE
    {
        printf("Decrement \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value--;
                }
                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value--;
                }
                assign_symbol(temp, temp_value);
                //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }
        yylineno++;
    }
;

val
    : term  { $$ = $1; }
    | val ADD term  { printf("Add \n"); $$ = $1 + $3; }
    | val SUB term  { printf("Sub \n"); $$ = $1 - $3; }
;

term
    : initializer   { $$ = $1; }
    | term MUL initializer  { printf("Mul \n"); $$ = $1 * $3; }
    | term DIV initializer
    {
        if($3 == 0){
            print_error("The devisor can't be 0", NULL);
            error_flag = 1;
            $$ = $1;
        }
		
        else{
            printf("Div \n"); $$ = $1 / $3;
        }
    }

    | term REMAIN initializer
    {
        if($3 == 0){
            print_error("The remainder can't be 0", NULL);
            error_flag = 1;
            /*$$ = $1;*/
        }
		
        else if(type_flag == 2){
            print_error("Float can't be mod", NULL);
            error_flag = 1;
        }
		
        else{
            printf("Remain \n"); $$ = (int)$1 % (int)$3;
        }
    }
;

initializer
    : I_CONST   { $$ = $1; if(type_flag != 2) type_flag = 1;}
    | F_CONST   { $$ = $1; type_flag = 2; }
    | group     { $$ = $1; }
    | ID
    {
        int temp = lookup_symbol($1, scope_flag, 2);
        if(temp == -1){
            print_error("No declare before using the variable", $1);
            error_flag = 1;
            $$ = 0;
        }
		
        else{
            if(symbol_table[temp].assign_bit == 0){
                error_flag = 1;
                print_error("No assignment before using", $1);
            }
			
            else{
                if(symbol_table[temp].type == 1){
                    type_flag = 1;
                    $$ = symbol_table[temp].int_value;
                }
				
                else if(symbol_table[temp].type == 2){
                    type_flag = 2;
                    $$ = symbol_table[temp].dou_value;
                }
                strcpy(print_buf, $1);
                print_i = temp;
                id_flag = 1;
            }
        }
    }
;

group
    : LB val RB  { $$ = $2; }
;

print_func
    : PRINT group NEWLINE
    {
        if(error_flag == 0){
            print_value($2, type_flag, 1);
            if(id_flag){
                printf("variable %s is depth %d \n", print_buf, symbol_table[print_i].scope);
            }
        }
        yylineno++;
    }

    | PRINT LB STRING RB NEWLINE
    {
        printf("Print : \" %s \" \n", $3);
        yylineno++;
    }

    | PRINTLN group NEWLINE
    {
        if(error_flag == 0){
            print_value($2, type_flag, 2);
            if(id_flag){
                printf("variable %s is depth %d \n", print_buf, symbol_table[print_i].scope);
            }
        }
        yylineno++;
    }

    | PRINTLN LB STRING RB NEWLINE
    {
        printf("Println : \" %s \" \n", $3);
        yylineno++;
    }
;

compound_stat
    : COMMENTLINE NEWLINE   { yylineno++; }
    | NEWLINE   { yylineno++; }
    | LCB NEWLINE   { scope_flag++; yylineno++; }
    | RCB NEWLINE   { remove_symbol(scope_flag); scope_flag--; yylineno++; }
;

if_else_stat
    : IF LB compare RB LCB NEWLINE
    {
        if($3){
            printf("true \n");
        }
		
        else{
            printf("false \n");
        }
        scope_flag++;
        yylineno++;
    }
    | RCB ELSE IF LB compare RB LCB NEWLINE
    {
        remove_symbol(scope_flag);
        scope_flag--;
        if($5){
            printf("true \n");
        }
		
        else{
            printf("false \n");
        }
        scope_flag++; yylineno++;
    }

    | RCB ELSE LCB NEWLINE
        { remove_symbol(scope_flag); scope_flag--; scope_flag++; yylineno++; }

    | ELSE IF LB compare RB LCB NEWLINE
    {
        if($4){
            printf("true \n");
        }
		
        else{
            printf("false \n");
        }
        scope_flag++;
        yylineno++;
    }

    | ELSE LCB NEWLINE
        { scope_flag++; yylineno++; }

    | IF compare LCB NEWLINE
    {
        if($2){
            printf("true \n");
        }
		
        else{
            printf("false \n");
        }
         scope_flag++;
         yylineno++;
    }

    | RCB ELSE IF compare LCB NEWLINE
    {
        remove_symbol(scope_flag);
        scope_flag--;
        if($4){
            printf("true \n");
        }
		
        else{
            printf("false \n");
        }
        scope_flag++;
        yylineno++; }

    | ELSE IF compare LCB NEWLINE
    {
        if($3){
            printf("true \n");
        }
		
        else{
            printf("false \n");
        }
        scope_flag++;
        yylineno++;
    }

;

compare_stat
    : compare NEWLINE
    {
        if($1){
            printf("true \n");
        }
		
        else{
            printf("false \n");
        }
        yylineno++;
    }
;

compare
    : val GREATER val
    {
        if($1 > $3){
            $$ = 1;
        }
		
        else{
            $$ = 0;
        }
    }

    | val LESS val
    {
        if($1 < $3){
            $$ = 1;
        }
		
        else{
            $$ = 0;
        }
    }

    | val GREATER_EQUAL val
    {
        if($1 >= $3){
            $$ = 1;
        }
		
        else{
            $$ = 0;
        }
    }

    | val LESS_EQUAL val
    {
        if($1 <= $3){
            $$ = 1;
        }
		
        else{
            $$ = 0;
        }
    }

    | val EQUAL val
    {
        if($1 == $3){
            $$ = 1;
        }
		
        else{
            $$ = 0;
        }
    }

    | val NEQUAL val
    {
        if($1 != $3){
            $$ = 1;
        }
		
        else{
            $$ = 0;
        }
    }

;

%%

/* C code section */
int main(int argc, char** argv)
{
    yylineno = 0;
    var_num = 0;

    yyparse();

    printf("\n");
	printf("Parse over,the line number is %d\n",yylineno);
	dump_symbol();

    return 0;
}

void create_symbol()
{
    printf("Create a symbol table \n");
}

void insert_symbol(char* id, char* type, int type_mode, int flag)
{
    if(var_num == 0){
		create_symbol();
	}

	printf("Insert a symbol : %s\n",id);
    strcpy(symbol_table[var_num].id,id);
    strcpy(symbol_table[var_num].type_name,type);
	symbol_table[var_num].type = type_mode;
    symbol_table[var_num].assign_bit = 0;
    symbol_table[var_num].scope = flag;

	var_num++;
	//flag = 0;
}

int lookup_symbol(char* id, int flag, int check)
{
    int i;
    int temp = flag;

    if(check == 1){
        for(i = 0;i < var_num;i++){
            if(strcmp(symbol_table[i].id, id) == 0 && symbol_table[i].scope == temp){
                return i;
            }
        }

        return -1;
    }

    else if(check == 2){
        while(temp > -1){
            //printf("temp = %d \n", temp);
            for(i = 0;i < var_num;i++){
                if(strcmp(symbol_table[i].id, id) == 0 && symbol_table[i].scope == temp){
                    temp = -1;
                    return i;
                }
            }
            temp--;
        }
        return -1;
    }

}

void dump_symbol()
{
    int i;
	printf("\n");
	printf("The symbol table dump : \n");
    printf("Index \t ID \t Type \t Data \n");

	for(i = 0;i < var_num;i++){
        if(symbol_table[i].assign_bit == 0){
                printf("%d \t %s \t %s \t undefined \n",i + 1,symbol_table[i].id,symbol_table[i].type_name);
        }
		
        else{
            if(symbol_table[i].type == 1){
                printf("%d\t %s\t %s \t %d\n",i + 1,symbol_table[i].id,symbol_table[i].type_name,symbol_table[i].int_value);
            }
			
            else{
                printf("%d\t %s\t %s \t %f\n",i + 1,symbol_table[i].id,symbol_table[i].type_name,symbol_table[i].dou_value);
            }

        }
	}
}

void assign_symbol(int id, double data)
{
    int type = symbol_table[id].type;
    if(type == 1){
        symbol_table[id].assign_bit = 1;
        symbol_table[id].int_value = (int)data;
    }
	
    else if(type == 2){
        symbol_table[id].assign_bit = 1;
        symbol_table[id].dou_value = data;
    }
}

void print_value(double data, int type, int mode)
{
    if(mode == 1){
        if(type == 1){
            printf("Print : %d\n",(int)data);
        }

        else if(type == 2){
            printf("Print : %f\n",data);
        }
    }

    else if(mode == 2){
        if(type == 1){
            printf("Println : %d\n",(int)data);
        }

        else if(type == 2){
            printf("Println : %f\n",data);
        }
    }

}

void remove_symbol(int flag){
    int i;
    int temp = 0;
    for(i = 0; i < var_num; i++){
        if(symbol_table[i].scope == flag){
            memset(symbol_table[i].id, 0, sizeof(symbol_table[i].id));
            memset(symbol_table[i].type_name, 0, sizeof(symbol_table[i].type_name));
            //strcpy(symbol_table[i].id,id);
            //strcpy(symbol_table[i].type_name,type);
	        symbol_table[i].type = 0;
            symbol_table[i].assign_bit = 0;
            symbol_table[i].scope = 0;
            temp++;
        }
    }
    var_num -= temp;
}

void yyerror(char *s){ ; }

void print_error(char *s, char *variable)
{
    printf(ANSI_COLOR_RED_BROAD "<ERROR>" ANSI_COLOR_RESET);
    printf(ANSI_COLOR_RED " %s",s);
    if(variable != NULL){
        printf(" \"%s\"" ANSI_COLOR_RESET, variable);
    }
    printf(ANSI_COLOR_RED " (line %d)\n" ANSI_COLOR_RESET, yylineno + 1);
}

