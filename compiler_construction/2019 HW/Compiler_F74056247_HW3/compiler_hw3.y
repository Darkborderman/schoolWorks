/*	Definition section */
%code requires{
#include<string.h>
#include<stdlib.h>
#include<stdio.h>
#include <ctype.h>
extern int yylineno;
extern int yylex();
extern char* yytext;   // Get current token from lex
extern char buf[256];  // Get current code line from lex
void yyerror(char *s);
void sematic_error(char *reason,char* variable);

typedef struct variable
{
    char *name;
    char *type;
    char *value;
}variable;

//define function name and its parameter
typedef struct scope
{
    char *name;
    char *type;
    variable parameters[10];
}scope;
//define what a variable need

//function scope and variable
scope scopes[10];
scope currentScope;
variable variables[10][10];
void *fp;

/* Symbol table function - you can add new function if needed. */
int add_variable(char* name,char* type,char* value,int scopeNumber);
void add_scope(char* name,char* type);
int find_scope(char* name);
int find_variable(char* name, int scopeNumber);
void initialize();

void debugScopes();
void debugScope(int index);
void debugVariable(variable var);
void debugVariables();

variable initVariable(char* name,char* type, char* value);

//output variable like lcd
void outputConst(variable var);
//output declaration like istore
void outputStore(variable var);
void outputLoad(variable var);
void outputPrint(variable var);

int getParameterCount(int index);
void addParameter(variable var,int index);

}

/* Use variable or self-defined structure to represent
 * nonterminal and token type
 */
%union {
    char* string;
    variable var;
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
%token RETURN SEMICOLON

/* Token with return, which need to sepcify type */
%token <var> I_CONST
%token <var> F_CONST
%token <var> TRUE
%token <var> FALSE
%token <string> STRING_LITERAL
%token <string> ID

/* Nonterminal with return, which need to sepcify type */
%type <string> type
%type <string> function_parameter
%type <var> function_head
%type <string> declaration_statement
%type <string> function_scope
%type <var> value
%type <var> arithmetic_statement
%type <var> execution_statement

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
        int i=find_scope(currentScope.name);
        variable tmp=initVariable($2,$1,$4.value);

        //Normal declaration
        if(find_variable($2,i)==-1 && i!=0){
            outputConst($4);
            add_variable(tmp.name,tmp.type,tmp.value,i);
            outputStore(tmp);
        }

        //Global declaration
        if(strcmp(currentScope.name,"global")==0){
            add_variable(tmp.name,tmp.type,tmp.value,0);
            fprintf(fp,".field public static %s %s = %s\n",$2,$1,$4.value);
        }
        $$=$1;
     }
    | type ID {
        int i=find_scope(currentScope.name);
        variable tmp=initVariable($2,$1,"");

        //Normal declaration
        if(find_variable($2,i)==-1 && i!=0){
            // no assign value means use default value
            variable val=initVariable("",$1,"");
            outputConst(val);
            add_variable(tmp.name,tmp.type,tmp.value,i);
            outputStore(tmp);
        }

        //Global declaration
        if(strcmp(currentScope.name,"global")==0){
            add_variable(tmp.name,tmp.type,tmp.value,0);
            fprintf(fp,".field public static %s %s\n",$2,$1);
        }
        $$=$1;
     }
    | declaration_statement COMMA ID {
        int i=find_scope(currentScope.name);
        if(find_variable($3,i)==-1){

            add_variable($3,$1,"",i);

        }else sematic_error("Redeclared variable",$3);
        if(strcmp(currentScope.name,"global")==0){
            fprintf(fp,".field public static %s %s\n",$3,$1);
        }
    }
    | declaration_statement COMMA ID ASGN arithmetic_statement{

        int i=find_scope(currentScope.name);
        if(find_variable($3,i)==-1){
            add_variable($3,$1,$5.value,i);
        }else sematic_error("Redeclared variable",$3);
        if(strcmp(currentScope.name,"global")==0){
            fprintf(fp,".field public static %s %s = %s\n",$3,$1,$5.value);
        }
    }
    | declaration_statement COMMA declaration_statement { }

arithmetic_statement
    : LB arithmetic_statement RB { $$=$2; }
    | arithmetic_statement ADD arithmetic_statement {
        
        if(strcmp($1.name,"")==0) outputConst($1);
        else outputLoad($1);
        if(strcmp($3.name,"")==0) outputConst($3);
        else outputLoad($3);
        
        if(strcmp($1.type,"I")==0&&strcmp($3.type,"I")==0)
            fprintf(fp,"iadd\n");
        if(strcmp($1.type,"F")==0&&strcmp($3.type,"F")==0)
            fprintf(fp,"fadd\n");
    }
    | arithmetic_statement SUB arithmetic_statement {

        if(strcmp($1.name,"")==0) outputConst($1);
        else outputLoad($1);
        if(strcmp($3.name,"")==0) outputConst($3);
        else outputLoad($3);
        
        if(strcmp($1.type,"I")==0&&strcmp($3.type,"I")==0)
            fprintf(fp,"isub\n");
        if(strcmp($1.type,"F")==0&&strcmp($3.type,"F")==0)
            fprintf(fp,"fsub\n");
    }
    | arithmetic_statement MUL arithmetic_statement {
        if(strcmp($1.name,"")==0) outputConst($1);
        else outputLoad($1);
        if(strcmp($3.name,"")==0) outputConst($3);
        else outputLoad($3);
        
        if(strcmp($1.type,"I")==0&&strcmp($3.type,"I")==0)
            fprintf(fp,"imul\n");
        if(strcmp($1.type,"F")==0&&strcmp($3.type,"F")==0)
            fprintf(fp,"fmul\n");
    }

    | arithmetic_statement DIV arithmetic_statement {
        if(strcmp($1.name,"")==0) outputConst($1);
        else outputLoad($1);
        if(strcmp($3.name,"")==0) outputConst($3);
        else outputLoad($3);
        
        if(strcmp($1.type,"I")==0&&strcmp($3.type,"I")==0)
            fprintf(fp,"idiv\n");
        if(strcmp($1.type,"F")==0&&strcmp($3.type,"F")==0)
            fprintf(fp,"fdiv\n");
    }
    | arithmetic_statement MOD arithmetic_statement {
        if(strcmp($1.name,"")==0) outputConst($1);
        else outputLoad($1);
        if(strcmp($3.name,"")==0) outputConst($3);
        else outputLoad($3);
        
        if(strcmp($1.type,"I")==0&&strcmp($3.type,"I")==0)
            fprintf(fp,"irem\n");
    }
    | INC arithmetic_statement { $$=$2;}
    | DEC arithmetic_statement { $$=$2;}
    | arithmetic_statement INC {$$=$1;}
    | arithmetic_statement DEC {$$=$1;}
    | execution_statement { $$=$1;}
    | value { $$=$1;}

expression_statement
    : assignment_statement SEMICOLON
    | execution_statement SEMICOLON
    | arithmetic_statement SEMICOLON
    | RETURN arithmetic_statement SEMICOLON {
        int i=find_scope(currentScope.name);
        if(strcmp($2.name,"")==0) outputConst($2);
        else outputLoad($2);
        
        if(strcmp(scopes[i].type,"I")==0) fprintf(fp,"ireturn\n");
        if(strcmp(scopes[i].type,"F")==0) fprintf(fp,"freturn\n");
        fprintf(fp,".end method\n");
    }
    | RETURN SEMICOLON {
        fprintf(fp,"return\n");
        fprintf(fp,".end method\n");
    }

assignment_statement
    : ID ASGN arithmetic_statement {
        int i=find_scope(currentScope.name);
        int index=find_variable($1,i);
        variable tmp=variables[i][index];
        
        outputStore(tmp);
    }
    | ID ADDASGN arithmetic_statement {
        int i=find_scope(currentScope.name);
        int index=find_variable($1,i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"iadd\n");
        if(strcmp(tmp.type,"F")==0) fprintf(fp,"fadd\n");
        outputStore(tmp);
    }
    | ID SUBASGN arithmetic_statement {
        int i=find_scope(currentScope.name);
        int index=find_variable($1,i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"isub\n");
        if(strcmp(tmp.type,"F")==0) fprintf(fp,"fsub\n");
        outputStore(tmp);
    }
    | ID MULASGN arithmetic_statement {
        int i=find_scope(currentScope.name);
        int index=find_variable($1,i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"imul\n");
        if(strcmp(tmp.type,"F")==0) fprintf(fp,"fmul\n");
        outputStore(tmp);
    }
    | ID DIVASGN arithmetic_statement {
        int i=find_scope(currentScope.name);
        int index=find_variable($1,i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"idiv\n");
        if(strcmp(tmp.type,"F")==0) fprintf(fp,"fdiv\n");
        outputStore(tmp);

    }
    | ID MODASGN arithmetic_statement {
        int i=find_scope(currentScope.name);
        int index=find_variable($1,i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"irem\n");
        outputStore(tmp);
    }
    | assignment_statement COMMA assignment_statement { }

execution_statement
    : PRINT LB value RB {
        if(strcmp($3.name,"")==0) outputConst($3);
        outputPrint($3);
        variable tmp=initVariable("","I","10");
        $$=tmp;
    }
    | ID LB argument_list RB {
        variable tmp=initVariable("","I","10");
        $$=tmp;
    }
    | ID LB RB{
        printf("%s",$1);
        int i=find_scope($1);
        fprintf(fp,"invokestatic compiler_hw3/%s()%s\n",scopes[i].name,scopes[i].type);
        variable tmp=initVariable("","I","10");
        $$=tmp;
    }

argument_list
    : value {

    }
    | value COMMA argument_list {
        
    }

value
    : I_CONST { 
        char *temp=(char*)malloc(sizeof(char)*strlen(yytext)+1);
        strncpy(temp,yytext,strlen(yytext));
        variable tmp=initVariable("","I",temp);
        $$=tmp;
        }
    | F_CONST {
        char *temp=(char*)malloc(sizeof(char)*strlen(yytext)+1);
        strncpy(temp,yytext,strlen(yytext));
        variable tmp=initVariable("","F",temp);
        $$=tmp;
        }
    | TRUE {
        variable tmp=initVariable("","Z","1");
        $$=tmp;
        }
    | FALSE {
        variable tmp=initVariable("","Z","0");
        $$=tmp;
        }
    | STRING_LITERAL {
        variable tmp=initVariable("","S",$1);
        $$=tmp;
        }
    | ID {
        int i=find_scope(currentScope.name);
        int index=find_variable($1,i);
        if(index==-1){
            index=find_variable($1,0);
            i=0;
        }
        variable tmp=variables[i][index];
        $$=tmp;
        }

function_declaration
    : function_parameter LCB func {
        
    }
    | function_parameter SEMICOLON { }
func
    : program RCB { }

function_head
    : type ID LB {

        add_scope($2,$1);
        currentScope.name=$2;
        currentScope.type=$1;
        variable tmp=initVariable($2,$1,"");
        $$=tmp;
    }

function_parameter
    :function_head parameter_list RB {

        $$="";
        }
    | function_head RB {
        //speical case for main
        if(strcmp(currentScope.name,"main")==0){
            fprintf(fp,".method public static main([Ljava/lang/String;)V\n");
        }else{
            fprintf(fp,".method public static %s()%s\n",currentScope.name,currentScope.type);
        }
        fprintf(fp,".limit stack 50\n.limit locals 50\n");

        $$="";
        }

parameter_list
    :type ID {
        //add item in parameter scope inside
        // printf("%s",currentScope.name);
        int index=find_scope(currentScope.name);
        variable tmp=initVariable($2,$1,"");
        addParameter(tmp,index);
    }
    | parameter_list COMMA type ID { }

function_scope
    :LCB program RCB { }

if_statement
    : IF LB condition RB function_scope { }
    | IF LB condition RB function_scope else_statement { }
    | IF LB condition RB SEMICOLON { }

else_statement
    : ELSE if_statement { }
    | ELSE function_scope { }

while_statement
    : WHILE LB condition RB function_scope { }
    | WHILE LB condition RB SEMICOLON { }

condition
    : arithmetic_statement comparaters arithmetic_statement {}
    | arithmetic_statement {}

comparaters
    : EQ
    | LT
    | LTE
    | MT
    | MTE
    | NE

/* actions can be taken when meet the token or rule */
type
    : VOID {$$ = "V"; }
    | BOOL  {  $$ = "Z"; } 
    | FLOAT { $$ = "F"; }
    | INT { $$ = "I"; }
    | STRING { $$ = "S"; }

%%



/* C code section */
int main(int argc, char** argv)
{
    fp=fopen("./text.j","w+");
    fprintf(fp,".class public compiler_hw3\n");
    fprintf(fp,".super java/lang/Object\n");

    yylineno = 0;
    initialize();

    yyparse();
	printf("\nTotal lines: %d \n",yylineno+1);

    fclose(fp);
    debugScope(1);
    // debugScopes();
    // debugVariables();
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


void initialize(){
    for(int i=0;i<=9;i++){
        scopes[i].name="";
        scopes[i].type="";
        for(int j=0;j<=9;j++){
            scopes[i].parameters[j].name="";
            scopes[i].parameters[j].type="";
            scopes[i].parameters[j].value="";
        }
    }
    scopes[0].name="global";
    currentScope.name="global";
    for(int i=0;i<=9;i++){
        for(int j=0;j<=9;j++){
            variables[i][j].name="";
            variables[i][j].type="";
            variables[i][j].value="";
        }
    }
}

//
int add_variable(char* name,char* type,char* value,int scopeNumber){
    for(int i=0;i<=9;i++){
        if(strcmp(variables[scopeNumber][i].name,"")==0){
            variables[scopeNumber][i].name=name;
            variables[scopeNumber][i].type=type;
            variables[scopeNumber][i].value=value;
            return i;
        }
    }
    return -1;
}

int find_variable(char* name, int num){
    for(int i=0;i<=9;i++){
        if(strcmp(variables[num][i].name,name)==0){
            return i;
        }
    }
    return -1;
}
void add_scope(char* name,char* type){
    for(int i=0;i<=9;i++){
        if(strcmp(scopes[i].name,"")==0){
            scopes[i].name=name;
            scopes[i].type=type;
            return;
        }
    }
}
int find_scope(char* name){
    for(int i=0;i<=9;i++){
        if(strcmp(scopes[i].name,name)==0){
            return i;
        }
    }
    return -1;
}
void debugScopes(){
    printf("%10s %10s\n","Scope","Type");
    for(int i=0;i<=9;i++){
        printf("%10s %10s\n",scopes[i].name,scopes[i].type);
    }
}
void debugVariables(){
    printf("%10s %10s %10s\n","Name","Type","Value");
    for(int i=0;i<=9;i++){
        printf("Scope %s\n",scopes[i].name);
        for(int j=0;j<=9;j++){
            variable tmp=variables[i][j];
            printf("%10s %10s %10s\n",tmp.name,tmp.type,tmp.value);
        }
    }
}
void debugScope(int index){
    printf("%10s %10s\n",scopes[index].name,scopes[index].type);
    for(int i=0;i<=9;i++){
        debugVariable(scopes[index].parameters[i]);
    }
}
void debugVariable(variable var){
    printf("%10s %10s %10s\n",var.name,var.type,var.value);
}

variable initVariable(char* name,char* type,char* value){
    variable tmp;
    tmp.name=name;
    tmp.type=type;
    tmp.value=value;
    if( strcmp(tmp.type,"I")==0 && strcmp(tmp.value,"")==0)
        tmp.value="0";
    if( strcmp(tmp.type,"F")==0 && strcmp(tmp.value,"")==0)
        tmp.value="0.0";
    if( strcmp(tmp.type,"Z")==0 && strcmp(tmp.value,"")==0)
        tmp.value="0";
    if( strcmp(tmp.type,"S")==0 && strcmp(tmp.value,"")==0)
        tmp.value="\"\"";
    return tmp;
}

void outputConst(variable var){
    fprintf(fp,"ldc %s\n",var.value);
}
//
void outputPrint(variable var){
    //Constant
    if(strcmp(var.name,"")==0){
        fprintf(fp,"getstatic java/lang/System/out Ljava/io/PrintStream;\n");
        fprintf(fp,"swap\n");
        if( strcmp(var.type,"I")==0){
            fprintf(fp,"invokevirtual java/io/PrintStream/println(I)V\n");
        }
        if( strcmp(var.type,"F")==0){
            fprintf(fp,"invokevirtual java/io/PrintStream/println(F)V\n");
        }
        if( strcmp(var.type,"Z")==0){
            fprintf(fp,"invokevirtual java/io/PrintStream/println(I)V\n");
        }
        if( strcmp(var.type,"S")==0){
            fprintf(fp,"invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V\n");
        }
    }
    //ID
    else{
        int scope=find_scope(currentScope.name);
        int index=find_variable(var.name,scope);
        outputLoad(var);
        //use recursive to print the rest
        variable tmp=initVariable("",var.type,var.value);
        outputPrint(tmp);
    }
}

void outputStore(variable var){
    int i=find_scope(currentScope.name);
    int index=find_variable(var.name,i);

    if(strcmp(var.type,"S")==0){
        fprintf(fp,"astore %d\n",index);
    }
    if(strcmp(var.type,"Z")==0){
        fprintf(fp,"istore %d\n",index);
    }
    if(strcmp(var.type,"F")==0){
        fprintf(fp,"fstore %d\n",index);
    }
    if(strcmp(var.type,"I")==0){
        fprintf(fp,"istore %d\n",index);
    }
}
void outputLoad(variable var){
    //find out it is global or local
    int i=find_scope(currentScope.name);
    int index=find_parameter(var.name,i);
    //parameter
    if(index!=-1) {
        index=find_parameter(var.name,i);
        if(strcmp(var.type,"S")==0){
            fprintf(fp,"aload %d\n",index);
        }
        if(strcmp(var.type,"Z")==0){
            fprintf(fp,"iload %d\n",index);
        }
        if(strcmp(var.type,"F")==0){
            fprintf(fp,"fload %d\n",index);
        }
        if(strcmp(var.type,"I")==0){
            fprintf(fp,"iload %d\n",index);
        }
    //local
    }else{
        index=find_variable(var.name,i);
        if(index!=-1){
            if(strcmp(var.type,"S")==0){
                fprintf(fp,"aload %d\n",index);
            }
            if(strcmp(var.type,"Z")==0){
                fprintf(fp,"iload %d\n",index);
            }
            if(strcmp(var.type,"F")==0){
                fprintf(fp,"fload %d\n",index);
            }
            if(strcmp(var.type,"I")==0){
                fprintf(fp,"iload %d\n",index);
            }
        //global
        }else{
            fprintf(fp,"getstatic compiler_hw3/%s %s\n",var.name,var.type);
        }
    }
}
int getParameterCount(int index){
    int counter=0;
    for(int i=0;i<=9;i++){
        if(strcmp(scopes[index].parameters[i].name,"")!=0){
            counter++;
        }
    }
    return counter;
}

void addParameter(variable var,int index){
    for(int i=0;i<=9;i++){
        if(strcmp(scopes[index].parameters[i].name,"")==0){
            scopes[index].parameters[i].name=var.name;
            scopes[index].parameters[i].type=var.type;
            scopes[index].parameters[i].value=var.value;
            return;
        }
    }
}
int find_parameter(char* name,int index){
    for(int i=0;i<=9;i++){
        if(strcmp(scopes[index].parameters[i].name,name)==0){
            return i;
        }
    }
    return -1;
}