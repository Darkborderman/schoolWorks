/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 2 "compiler_hw3.y" /* yacc.c:1909  */

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


#line 104 "y.tab.h" /* yacc.c:1909  */

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ADD = 258,
    SUB = 259,
    MUL = 260,
    DIV = 261,
    MOD = 262,
    INC = 263,
    DEC = 264,
    MT = 265,
    LT = 266,
    MTE = 267,
    LTE = 268,
    EQ = 269,
    NE = 270,
    ASGN = 271,
    ADDASGN = 272,
    SUBASGN = 273,
    MULASGN = 274,
    DIVASGN = 275,
    MODASGN = 276,
    AND = 277,
    OR = 278,
    NOT = 279,
    LB = 280,
    RB = 281,
    LCB = 282,
    RCB = 283,
    LSB = 284,
    RSB = 285,
    COMMA = 286,
    PRINT = 287,
    IF = 288,
    ELSE = 289,
    FOR = 290,
    WHILE = 291,
    VOID = 292,
    INT = 293,
    FLOAT = 294,
    STRING = 295,
    BOOL = 296,
    RETURN = 297,
    SEMICOLON = 298,
    I_CONST = 299,
    F_CONST = 300,
    TRUE = 301,
    FALSE = 302,
    STRING_LITERAL = 303,
    ID = 304
  };
#endif
/* Tokens.  */
#define ADD 258
#define SUB 259
#define MUL 260
#define DIV 261
#define MOD 262
#define INC 263
#define DEC 264
#define MT 265
#define LT 266
#define MTE 267
#define LTE 268
#define EQ 269
#define NE 270
#define ASGN 271
#define ADDASGN 272
#define SUBASGN 273
#define MULASGN 274
#define DIVASGN 275
#define MODASGN 276
#define AND 277
#define OR 278
#define NOT 279
#define LB 280
#define RB 281
#define LCB 282
#define RCB 283
#define LSB 284
#define RSB 285
#define COMMA 286
#define PRINT 287
#define IF 288
#define ELSE 289
#define FOR 290
#define WHILE 291
#define VOID 292
#define INT 293
#define FLOAT 294
#define STRING 295
#define BOOL 296
#define RETURN 297
#define SEMICOLON 298
#define I_CONST 299
#define F_CONST 300
#define TRUE 301
#define FALSE 302
#define STRING_LITERAL 303
#define ID 304

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 65 "compiler_hw3.y" /* yacc.c:1909  */

    char* string;
    variable var;

#line 219 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
