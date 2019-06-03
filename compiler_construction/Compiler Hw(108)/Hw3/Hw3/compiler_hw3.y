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
int lookup_func(char *id, int flag);
void insert_func(char* id, int type_mode, int flag);

int var_num;
int var_flag;
int assign_flag;
int error_flag;
int type_flag;
int scope_flag = 0;
char print_buf[30];
int print_i = 0;
int id_flag = 0;
int check = 0;
int exe_flag = 1;

int func_num; //count
int func_flag = 0;
int func_temp; //No.
int func_para = 0; //parameter count
char func_name[30];

int id_num = 0;
int label_num[20] = {0};
int exit_num[20] = {0};
int if_flag[20] = {0};
int else_flag = 0;

int for_flag[20] = {0};
int for_mode[20] = {0};
int for_id[20] = {0};
int prev_type = 0;

int pass_flag;
int print_flag;
int error_count;
FILE *file;

struct data{
	char id[30];

	int type;
	char type_name[10];

    int int_value;
    double dou_value;

    int assign_bit;
	int scope;
}symbol_table[100];

struct funct{
	char id[30];

	int type;
    char para[30];
    int para_st[30];
    int para_type[30];

    int para_count;
}func_table[20];

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
%token VAR NEWLINE INT FLOAT VOID FUNC MAIN RETURN

%token ADD SUB MUL DIV REMAIN INCR DECR
%token GREATER LESS GREATER_EQUAL LESS_EQUAL EQUAL NEQUAL
%token ASSIGN ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN REMAIN_ASSIGN
%token AND OR NOT LB RB LCB RCB SEM COMMA

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
%type <f_val> for_stat
%type <f_val> for_compute
%type <f_val> func_stat

/* Yacc will start at this nonterminal */
%start program

/* Grammar section */
%%

program
    : program stat  { assign_flag = 0; error_flag = 0; type_flag = 0; id_flag = 0; print_flag = 0; id_num = 0; prev_type = 0; }
    |
;

stat
    : declaration
    | compound_stat
    | expression_stat
    | print_func
    | compare_stat
    | if_else_stat
    | for_stat
    | func_stat
;

declaration
    : VAR ID type ASSIGN val NEWLINE
    {
        if(lookup_symbol($2, scope_flag, 1) == -1){
            if($3 == 1){
                if(error_flag == 0){
                        insert_symbol($2,"int", $3, scope_flag);
                        assign_symbol(lookup_symbol($2, scope_flag, 1), $5);
                        printf("declare %s in block of depth %d \n", $2, scope_flag);
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
                        fprintf(file, "\tldc 0\n");
                        assign_symbol(lookup_symbol($2, scope_flag, 1), 0);
                        printf("declare %s in block of depth %d \n", $2, scope_flag);
                    }
                }
            }

            else if($3 == 2){
                if(error_flag == 0){
                    insert_symbol($2,"float", $3, scope_flag);
                    fprintf(file, "\tldc 0.000000\n");
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

                    fprintf(file, "\tiload %d\n", temp);
                    if(type_flag == 2){
                        fprintf(file, "\ti2f\n");
                        fprintf(file, "\tfadd\n");
                    }
                    else{
                        fprintf(file, "\tiadd\n");
                    }
                }

                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value += $3;
                    if(type_flag == 1){
                        fprintf(file, "\ti2f\n");
                    }
                    fprintf(file, "\tfload %d\n", temp);
                    fprintf(file, "\tfadd\n");
                    type_flag = 2;
                }
                assign_symbol(temp, temp_value);
                    //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }
        yylineno++;
    }

    | ID
    {
        int temp = lookup_symbol($1, scope_flag, 2);
        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }
        else{
            if(error_flag == 0 ){
                if(symbol_table[temp].type == 1){
                    fprintf(file, "\tiload %d\n", temp);
                }

                else if(symbol_table[temp].type == 2){
                    fprintf(file, "\tfload %d\n", temp);
                }
            }
        }
        id_num = temp;
    } SUB_ASSIGN val NEWLINE
    {
        printf("SUB_ASSIGN \n");
        int temp = id_num;
        double temp_value = 0;
        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }
        else{
            if(error_flag == 0 ){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value -= $4;
                    if(type_flag == 2){
                        fprintf(file, "\tfstore %d\n", var_num);
                        fprintf(file, "\ti2f\n");
                        fprintf(file, "\tfload %d\n", var_num);
                        fprintf(file, "\tfsub\n");
                    }
                    else{
                        fprintf(file, "\tisub\n");
                    }
                }

                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value -= $4;
                    if(type_flag == 1){
                        fprintf(file, "\ti2f\n");
                    }
                    fprintf(file, "\tfsub\n");
                    type_flag = 2;
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
            if(error_flag == 0 && exe_flag){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value *= $3;
                    fprintf(file, "\tiload %d\n", temp);
                    if(type_flag == 2){
                        fprintf(file, "\ti2f\n");
                        fprintf(file, "\tfmul\n");
                    }
                    else{
                        fprintf(file, "\timul\n");
                    }
                }

                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value *= $3;
                    if(type_flag == 1){
                        fprintf(file, "\ti2f\n");
                    }
                    fprintf(file, "\tfload %d\n", temp);
                    fprintf(file, "\tfmul\n");
                    type_flag = 2;

                }
                assign_symbol(temp, temp_value);
                    //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }

        yylineno++;
    }

    | ID{
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;

        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    fprintf(file, "\tiload %d\n", temp);
                }

                else if(symbol_table[temp].type == 2){
                    fprintf(file, "\tfload %d\n", temp);
                }
            }
        }
    } DIV_ASSIGN val NEWLINE
    {
        printf("DIV_ASSIGN \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;

        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }

        if($4 == 0){
            print_error("The devisor can't be 0", NULL);
            error_flag = 1;
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value /= $4;
                    if(type_flag == 2){
                        fprintf(file, "\tfstore %d\n", var_num);
                        fprintf(file, "\ti2f\n");
                        fprintf(file, "\tfload %d\n", var_num);
                        fprintf(file, "\tfdiv\n");
                    }
                    else{
                        fprintf(file, "\tidiv\n");
                    }
                }

                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value /= $4;
                    if(type_flag == 1){
                        fprintf(file, "\ti2f\n");
                    }
                    fprintf(file, "\tfdiv\n");
                    type_flag = 2;
                }
                assign_symbol(temp, temp_value);
                    //printf("variable %s is depth %d \n", $1, scope_flag);
            }
        }

        yylineno++;
    }

    | ID{
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    fprintf(file, "\tiload %d\n", temp);
                }
            }
        }
    } REMAIN_ASSIGN val NEWLINE
    {
        printf("REMAIN_ASSIGN \n");
        int temp = lookup_symbol($1, scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }

        if($4 == 0){
            print_error("The remainder can't be 0", NULL);
            error_flag = 1;
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    test = (int)temp_value % (int)$4;

                    if(type_flag == 2){
                        print_error("Float can't be mod", NULL);
                        error_flag = 1;
                    }
                    else{
                        fprintf(file, "\tirem\n");
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
                    fprintf(file, "\tiload %d\n", temp);
                    fprintf(file, "\tldc 1\n");
                    fprintf(file, "\tiadd\n");
                }
                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value++;
                    fprintf(file, "\tfload %d\n", temp);
                    fprintf(file, "\tldc 1.000000\n");
                    fprintf(file, "\tfadd\n");
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
                    fprintf(file, "\tiload %d\n", temp);
                    fprintf(file, "\tldc 1\n");
                    fprintf(file, "\tisub\n");
                }
                else if(symbol_table[temp].type == 2){
                    temp_value = symbol_table[temp].dou_value;
                    temp_value--;
                    fprintf(file, "\tfload %d\n", temp);
                    fprintf(file, "\tldc 1.000000\n");
                    fprintf(file, "\tfsub\n");
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
    | val ADD term
    {
        printf("Add \n");
        $$ = $1 + $3;
        if(type_flag == 1){
            fprintf(file,"\tiadd\n");
        }
        else if(type_flag == 2){
            fprintf(file,"\tfadd\n");
        }
    }

    | val SUB term
    {
        printf("Sub \n");
        $$ = $1 - $3;
        if(type_flag == 1){
            fprintf(file,"\tisub\n");
        }
        else if(type_flag == 2){
            fprintf(file,"\tfsub\n");
        }
    }
;

term
    : initializer   { $$ = $1; }
    | term MUL initializer
    {
        printf("Mul \n");
        $$ = $1 * $3;
        if(type_flag == 1){
            fprintf(file,"\timul\n");
        }
        else if(type_flag == 2){
            fprintf(file,"\tfmul\n");
        }
    }

    | term DIV initializer
    {
        if($3 == 0){
            print_error("The devisor can't be 0", NULL);
            error_flag = 1;
            $$ = $1;
        }
        else{
            printf("Div \n");
            $$ = $1 / $3;
            if(type_flag == 1){
                fprintf(file,"\tidiv\n");
            }
            else if(type_flag == 2){
                fprintf(file,"\tfdiv\n");
            }
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
            printf("Remain \n");
            $$ = (int)$1 % (int)$3;
            fprintf(file,"\tirem\n");
        }
    }
;

initializer
    : I_CONST
    {
        $$ = $1;
        fprintf(file, "\tldc %d\n", (int)$1);
        if(type_flag != 2){
            type_flag = 1;
        }
        if(type_flag == 2){
            //prev_type = 1;
            fprintf(file, "\ti2f\n");
        }

    }

    | F_CONST
    {
        $$ = $1;
        if(type_flag == 1){
            if(prev_type < 2){
                fprintf(file, "\ti2f\n");
            }
        }
        if(type_flag != 2){
            type_flag = 2;
        }

        fprintf(file, "\tldc %lf\n", $1);
    }

    | group     { $$ = $1; }
    | ID
    {
        if(func_flag){
            int i = 0;
            int test = 1;
            char *delim = " ";
            char *pch;
            char copy[30];
            strcpy(copy, func_table[func_temp].para);
            printf("%s\n", copy);
            pch = strtok(copy, delim);
            while(pch != NULL){
                test = strcmp($1, pch);
                if(test == 0){
                    if(func_table[func_temp].para_type[i] == 1){
                        fprintf(file, "\tiload %d\n", func_table[func_temp].para_st[i]);
                        type_flag = 1;
                        break;
                    }
                    else if(func_table[func_temp].para_type[i] == 2){
                        fprintf(file, "\tfload %d\n", func_table[func_temp].para_st[i]);
                        type_flag = 2;
                        break;
                    }
                }
                pch = strtok(NULL, delim);
                i++;
            }

        }
        else{
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
                        $$ = symbol_table[temp].int_value;
                        fprintf(file, "\tiload %d\n", temp);

                        if(type_flag != 2){
                            type_flag = 1;
                        }
                        if(type_flag == 2){
                            fprintf(file,"\ti2f\n");
                        }
                    }
                    else if(symbol_table[temp].type == 2){
                        if(type_flag == 1){
                            fprintf(file, "\ti2f\n");
                        }
                        if(type_flag != 2){
                            type_flag = 2;
                        }
                        //printf("temp = %d)
                        $$ = symbol_table[temp].dou_value;
                        fprintf(file, "\tfload %d\n", temp);
                    }
                    strcpy(print_buf, $1);
                    print_i = temp;
                    id_flag = 1;
                }
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

            if(type_flag == 1){
                fprintf(file,   "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n"
	                            "\tswap\n"
	                            "\tinvokevirtual java/io/PrintStream/print(I)V\n" );
            }
            else if(type_flag == 2){
                fprintf(file,   "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n"
	                            "\tswap\n"
	                            "\tinvokevirtual java/io/PrintStream/print(F)V\n" );
            }

            if(id_flag){
                printf("variable %s is depth %d \n", print_buf, symbol_table[print_i].scope);
            }
        }
        yylineno++;
    }

    | PRINT LB STRING RB NEWLINE
    {
        printf("Print : \" %s \" \n", $3);
        fprintf(file, "\tldc \"%s\"\n", $3);
        fprintf(file,   "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n"
	                    "\tswap\n"
	                    "\tinvokevirtual java/io/PrintStream/print(Ljava/lang/String;)V\n" );
        yylineno++;
    }

    | PRINTLN group NEWLINE
    {
        if(error_flag == 0){
            print_value($2, type_flag, 2);

            if(type_flag == 1){
                fprintf(file,   "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n"
	                            "\tswap\n"
	                            "\tinvokevirtual java/io/PrintStream/println(I)V\n" );
            }
            else if(type_flag == 2){
                fprintf(file,   "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n"
	                            "\tswap\n"
	                            "\tinvokevirtual java/io/PrintStream/println(F)V\n" );
            }

            if(id_flag){
                printf("variable %s is depth %d \n", print_buf, symbol_table[print_i].scope);
            }
        }
        yylineno++;
    }

    | PRINTLN LB STRING RB NEWLINE
    {
        printf("Println : \" %s \" \n", $3);
        fprintf(file, "\tldc \"%s\"\n", $3);
        fprintf(file,   "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n"
	                    "\tswap\n"
	                    "\tinvokevirtual java/io/PrintStream/println(Ljava/lang/String;)V\n" );
        yylineno++;
    }
;

compound_stat
    : COMMENTLINE NEWLINE   { yylineno++; }
    | NEWLINE   { yylineno++; }
    | LCB NEWLINE   { scope_flag++; yylineno++; }
    | RCB NEWLINE   {
        remove_symbol(scope_flag);
        scope_flag--;
        exe_flag = 1;
        yylineno++;

        if(if_flag[scope_flag]){
            if(else_flag){
                fprintf(file, "EXIT_%d%d : \n", scope_flag, exit_num[scope_flag]);
                else_flag = 0;
                exit_num[scope_flag]++;
            }
            else{
                fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
                fprintf(file, "EXIT_%d%d : \n", scope_flag, exit_num[scope_flag]);
                label_num[scope_flag]++;
                exit_num[scope_flag]++;
            }
            if_flag[scope_flag] = 0;
        }
        else if(for_flag[scope_flag]){
            if(for_mode[scope_flag] == 1){
                double temp_value = 0;
                if(symbol_table[for_id[scope_flag]].type == 1){
                    temp_value = symbol_table[for_id[scope_flag]].int_value;
                    temp_value++;
                    fprintf(file, "\tiload %d\n", for_id[scope_flag]);
                    fprintf(file, "\tldc 1\n");
                    fprintf(file, "\tiadd\n");
                }
                else if(symbol_table[for_id[scope_flag]].type == 2){
                    temp_value = symbol_table[for_id[scope_flag]].dou_value;
                    temp_value++;
                    fprintf(file, "\tfload %d\n", for_id[scope_flag]);
                    fprintf(file, "\tldc 1.000000\n");
                    fprintf(file, "\tfadd\n");
                }
                assign_symbol(for_id[scope_flag], temp_value);
            }

            else if(for_mode[scope_flag] == 2){
                double temp_value = 0;
                if(symbol_table[for_id[scope_flag]].type == 1){
                    temp_value = symbol_table[for_id[scope_flag]].int_value;
                    temp_value--;
                    fprintf(file, "\tiload %d\n", for_id[scope_flag]);
                    fprintf(file, "\tldc 1\n");
                    fprintf(file, "\tisub\n");
                }
                else if(symbol_table[for_id[scope_flag]].type == 2){
                    temp_value = symbol_table[for_id[scope_flag]].dou_value;
                    temp_value--;
                    fprintf(file, "\tfload %d\n", for_id[scope_flag]);
                    fprintf(file, "\tldc 1.000000\n");
                    fprintf(file, "\tfsub\n");
                }
                assign_symbol(for_id[scope_flag], temp_value);
            }

            fprintf(file, "\tgoto Label_%d%d\n", scope_flag, label_num[scope_flag] - 1);
            fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
            label_num[scope_flag]++;
            for_mode[scope_flag] = 0;
            for_flag[scope_flag] = 0;
        }
    }
;

if_else_stat
    : IF LB{

        if_flag[scope_flag] = 1;
    } compare RB LCB NEWLINE
    {
        scope_flag++;
        yylineno++;
    }
    | RCB ELSE IF {
        remove_symbol(scope_flag);
        scope_flag--;
        fprintf(file, "\tgoto EXIT_%d%d\n", scope_flag, exit_num[scope_flag]);
        fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
        label_num[scope_flag]++;

    } LB compare RB LCB NEWLINE
    {

        scope_flag++; yylineno++;
    }

    | RCB ELSE {
        remove_symbol(scope_flag);
        scope_flag--;
        fprintf(file, "\tgoto EXIT_%d%d\n", scope_flag, exit_num[scope_flag]);
        fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
        label_num[scope_flag]++;
        else_flag = 1;

    } LCB NEWLINE
        {
        scope_flag++; yylineno++;
        }

/*    | ELSE IF LB compare RB LCB NEWLINE
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
        yylineno++;
    }

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
    }*/

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
    : val{
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    } GREATER val
    {
        if($1 > $4){
            $$ = 1;
        }
        else{
            $$ = 0;
        }

        if(type_flag == 2){
            fprintf(file, "\tfcmpl\n");
            fprintf(file, "\tifle Label_%d%d\n", scope_flag, label_num[scope_flag]);
        }

        else if(type_flag == 1){
            if(prev_type == 2){
                fprintf(file, "\ti2f\n");
                fprintf(file, "\tfcmpl\n");
                fprintf(file, "\tifle Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
            else{
                fprintf(file, "\tif_icmple Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
        }

        //label_num++;
    }

    | val{
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    } LESS val
    {
        if($1 < $4){
            $$ = 1;
        }
        else{
            $$ = 0;
        }

        if(type_flag == 2){
            fprintf(file, "\tfcmpl\n");
            fprintf(file, "\tifge Label_%d%d\n", scope_flag, label_num[scope_flag]);
        }

        else if(type_flag == 1){
            if(prev_type == 2){
                fprintf(file, "\ti2f\n");
                fprintf(file, "\tfcmpl\n");
                fprintf(file, "\tifge Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
            else{
                fprintf(file, "\tif_icmpge Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
        }
        //label_num++;
    }

    | val{
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    } GREATER_EQUAL val
    {
        if($1 >= $4){
            $$ = 1;
        }
        else{
            $$ = 0;
        }

        if(type_flag == 2){
            fprintf(file, "\tfcmpl\n");
            fprintf(file, "\tiflt Label_%d%d\n", scope_flag, label_num[scope_flag]);
        }

        else if(type_flag == 1){
            if(prev_type == 2){
                fprintf(file, "\ti2f\n");
                fprintf(file, "\tfcmpl\n");
                fprintf(file, "\tiflt Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
            else{
                fprintf(file, "\tif_icmplt Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
        }

        //label_num++;
    }

    | val{
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    } LESS_EQUAL val
    {
        if($1 <= $4){
            $$ = 1;
        }
        else{
            $$ = 0;
        }

        if(type_flag == 2){
            fprintf(file, "\tfcmpl\n");
            fprintf(file, "\tifgt Label_%d%d\n", scope_flag, label_num[scope_flag]);
        }

        else if(type_flag == 1){
            if(prev_type == 2){
                fprintf(file, "\ti2f\n");
                fprintf(file, "\tfcmpl\n");
                fprintf(file, "\tifgt Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
            else{
                fprintf(file, "\tif_icmpgt Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
        }
        //label_num++;
    }

    | val{
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    } EQUAL val
    {
        if($1 == $4){
            $$ = 1;
        }
        else{
            $$ = 0;
        }

        if(type_flag == 2){
            fprintf(file, "\tfcmpl\n");
            fprintf(file, "\tifne Label_%d%d\n", scope_flag, label_num[scope_flag]);
        }

        else if(type_flag == 1){
            if(prev_type == 2){
                fprintf(file, "\ti2f\n");
                fprintf(file, "\tfcmpl\n");
                fprintf(file, "\tifne Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
            else{
                fprintf(file, "\tif_icmpne Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
        }

        //label_num++;
    }

    | val{
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    } NEQUAL val
    {
        if($1 != $4){
            $$ = 1;
        }
        else{
            $$ = 0;
        }

        if(type_flag == 2){
            fprintf(file, "\tfcmpl\n");
            fprintf(file, "\tifeq Label_%d%d\n", scope_flag, label_num[scope_flag]);
        }
        else if(type_flag == 1){
            if(prev_type == 2){
                fprintf(file, "\ti2f\n");
                fprintf(file, "\tfcmpl\n");
                fprintf(file, "\tifeq Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
            else{
                fprintf(file, "\tif_icmpeq Label_%d%d\n", scope_flag, label_num[scope_flag]);
            }
        }

        //label_num++;
    }

;

for_stat
    : FOR{
        for_flag[scope_flag] = 1;
        fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
        label_num[scope_flag]++;
    } LB compare RB LCB NEWLINE
    {
        scope_flag++;
        yylineno++;
    }

    | FOR for_compute SEM{
        for_flag[scope_flag] = 1;
        fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
        label_num[scope_flag]++;
    } compare SEM for_compute LCB NEWLINE
    {
        scope_flag++;
        yylineno++;
    }

    /*| FOR LB for_compute SEM{
        for_flag = 1;
        fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
        label_num[scope_flag]++;
    } compare SEM for_compute RB LCB NEWLINE
    {
        scope_flag++;
        yylineno++;
    }*/

;

for_compute
    : ID ASSIGN val
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
        }
    }

    | ID INCR
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
                for_mode[scope_flag] = 1;
                for_id[scope_flag] = temp;
            }
        }
    }

    | ID DECR
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
                for_mode[scope_flag] = 2;
                for_id[scope_flag] = temp;
            }
        }
    }
;

func_stat
    : FUNC ID{
        strcpy(func_table[func_num].id, $2);
        if(func_num == 0) fprintf(file, "\tgoto Main\n");
        fprintf(file, "%s : \n", $2);
        fprintf(file, "\tastore 19\n");
    } LB func_declare RB type LCB NEWLINE
    {
        func_table[func_num].para_count = func_para;
        func_temp = func_num;
        func_para = 0;
        func_flag = 1;
        func_num++;
        yylineno++;
        scope_flag++;
    }

    | FUNC MAIN LB RB LCB NEWLINE
    {
        fprintf(file,"Main : \n");
        yylineno++;
    }

    | RETURN val NEWLINE { fprintf(file,"\tret 19\n"); yylineno++; func_flag = 0; }

    | ID ASSIGN ID{
        int i = 0;
        for(i = 0;i < func_num; i++){
            if(strcmp($3, func_table[i].id) == 0){
                func_temp = i;
            }
        }
    } LB func_var RB NEWLINE
    {
        fprintf(file, "\tjsr %s\n", func_table[func_temp].id);
        int temp = lookup_symbol($1, scope_flag, 2);
        if(temp == -1){
            print_error("No declare before using the variable", $1);
        }
        else{
            if(error_flag == 0){
                int type = symbol_table[temp].type;
                if(type == 1){
                    symbol_table[temp].assign_bit = 1;
                    //symbol_table[temp].int_value = (int)data;
                    if(type_flag == 2){
                        fprintf(file,"\tf2i\n");
                    }
                    fprintf(file,"\tistore %d\n", temp);
                }
                else if(type == 2){
                    symbol_table[temp].assign_bit = 1;
                    //symbol_table[temp].dou_value = data;
                    if(type_flag == 1){
                        fprintf(file,"\ti2f\n");
                    }
                    fprintf(file,"\tfstore %d\n", temp);
                }
                //assign_symbol(temp, $1);
            }
        }
        func_para = 0;
        yylineno++;
    }
;

func_declare
    : ID type COMMA{
        if(func_para == 0){
            strcpy(func_table[func_num].para, $1);
            strcat(func_table[func_num].para, " ");
        }
        else{
            strcat(func_table[func_num].para, $1);
            strcat(func_table[func_num].para, " ");
        }
        if($2 == 1){
            func_table[func_num].para_type[func_para] = 1;
        }
        if($2 == 2){
            func_table[func_num].para_type[func_para] = 2;
        }
        func_table[func_num].para_st[func_para] = func_para + 10;
        func_para++;
    } func_declare{}

    | ID type
    {
        if(func_para == 0){
            strcpy(func_table[func_num].para, $1);
            strcat(func_table[func_num].para, " ");
        }
        else{
            strcat(func_table[func_num].para, $1);
            strcat(func_table[func_num].para, " ");
        }
        if($2 == 1){
            func_table[func_num].para_type[func_para] = 1;
        }
        if($2 == 2){
            func_table[func_num].para_type[func_para] = 2;
        }
        func_table[func_num].para_st[func_para] = func_para + 10;
        func_para++;
    }

;
func_var
    : val COMMA{
        if(func_table[func_temp].para_type[func_para] == 1){
            if(type_flag == 2){
                fprintf(file, "\tf2i\n");
                fprintf(file, "\tistore %d\n", func_table[func_temp].para_st[func_para]);
            }
            else if(type_flag == 1){
                fprintf(file, "\tistore %d\n", func_table[func_temp].para_st[func_para]);
            }
        }
        else if(func_table[func_temp].para_type[func_para] == 2){
            if(type_flag == 1){
                fprintf(file, "\ti2f\n");
                fprintf(file, "\tfstore %d\n", func_table[func_temp].para_st[func_para]);
            }
            else if(type_flag == 2){
                fprintf(file, "\tfstore %d\n", func_table[func_temp].para_st[func_para]);
            }
        }
        type_flag = 0;
        func_para++;
    } func_var {}

    | val
    {
        if(func_table[func_temp].para_type[func_para] == 1){
            if(type_flag == 2){
                fprintf(file, "\tf2i\n");
                fprintf(file, "\tistore %d\n", func_table[func_temp].para_st[func_para]);
            }
            else if(type_flag == 1){
                fprintf(file, "\tistore %d\n", func_table[func_temp].para_st[func_para]);
            }
        }
        else if(func_table[func_temp].para_type[func_para] == 2){
            if(type_flag == 1){
                fprintf(file, "\ti2f\n");
                fprintf(file, "\tfstore %d\n", func_table[func_temp].para_st[func_para]);
            }
            else if(type_flag == 2){
                fprintf(file, "\tfstore %d\n", func_table[func_temp].para_st[func_para]);
            }
        }
        type_flag = 0;
        func_para++;
    }
;

%%

/* C code section */
int main(int argc, char** argv)
{
    yylineno = 0;
    var_num = 0;
    pass_flag = 1;
    print_flag = 0;
    error_count = 0;
    file = fopen("test.j","w");
    fprintf(file,   ".class public main\n"
                    ".super java/lang/Object\n"
                    ".method public static main([Ljava/lang/String;)V\n"
                    ".limit stack %d\n"
                    ".limit locals %d\n", 30, 20);

    yyparse();

    fprintf(file,   "\treturn\n"
                    ".end method\n");
    fclose(file);

    if(error_count > 0){
        remove("test.j");
    }

    printf("\n");
	printf("Total lines : %d\n",yylineno);
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
	printf("The symbol table : \n");
    printf("ID \t Type \t Data \n");

	for(i = 0;i < var_num;i++){
        if(symbol_table[i].assign_bit == 0){
                printf("%s \t %s \t undefined \n",symbol_table[i].id,symbol_table[i].type_name);
        }
        else{
            if(symbol_table[i].type == 1){
                printf("%s \t %s \t %d\n",symbol_table[i].id,symbol_table[i].type_name,symbol_table[i].int_value);
            }
            else{
                printf("%s \t %s \t %f\n",symbol_table[i].id,symbol_table[i].type_name,symbol_table[i].dou_value);
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
        if(type_flag == 2){
            fprintf(file,"\tf2i\n");
        }
        fprintf(file,"\tistore %d\n", id);
    }
    else if(type == 2){
        symbol_table[id].assign_bit = 1;
        symbol_table[id].dou_value = data;
        if(type_flag == 1){
            fprintf(file,"\ti2f\n");
        }
        fprintf(file,"\tfstore %d\n", id);
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
    error_count++;
}

int lookup_func(char* id, int flag)
{
    int i;

    for(i = 0;i < func_num;i++){
        if(strcmp(func_table[i].id, id) == 0){
            return i;
        }
    }

    return -1;
}
