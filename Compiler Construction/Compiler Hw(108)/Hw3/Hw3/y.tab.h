/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

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

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PRINT = 258,
    PRINTLN = 259,
    IF = 260,
    ELSE = 261,
    FOR = 262,
    VAR = 263,
    NEWLINE = 264,
    INT = 265,
    FLOAT = 266,
    VOID = 267,
    FUNC = 268,
    MAIN = 269,
    RETURN = 270,
    ADD = 271,
    SUB = 272,
    MUL = 273,
    DIV = 274,
    REMAIN = 275,
    INCR = 276,
    DECR = 277,
    GREATER = 278,
    LESS = 279,
    GREATER_EQUAL = 280,
    LESS_EQUAL = 281,
    EQUAL = 282,
    NEQUAL = 283,
    ASSIGN = 284,
    ADD_ASSIGN = 285,
    SUB_ASSIGN = 286,
    MUL_ASSIGN = 287,
    DIV_ASSIGN = 288,
    REMAIN_ASSIGN = 289,
    AND = 290,
    OR = 291,
    NOT = 292,
    LB = 293,
    RB = 294,
    LCB = 295,
    RCB = 296,
    SEM = 297,
    COMMA = 298,
    I_CONST = 299,
    F_CONST = 300,
    STRING = 301,
    ID = 302,
    COMMENTLINE = 303
  };
#endif
/* Tokens.  */
#define PRINT 258
#define PRINTLN 259
#define IF 260
#define ELSE 261
#define FOR 262
#define VAR 263
#define NEWLINE 264
#define INT 265
#define FLOAT 266
#define VOID 267
#define FUNC 268
#define MAIN 269
#define RETURN 270
#define ADD 271
#define SUB 272
#define MUL 273
#define DIV 274
#define REMAIN 275
#define INCR 276
#define DECR 277
#define GREATER 278
#define LESS 279
#define GREATER_EQUAL 280
#define LESS_EQUAL 281
#define EQUAL 282
#define NEQUAL 283
#define ASSIGN 284
#define ADD_ASSIGN 285
#define SUB_ASSIGN 286
#define MUL_ASSIGN 287
#define DIV_ASSIGN 288
#define REMAIN_ASSIGN 289
#define AND 290
#define OR 291
#define NOT 292
#define LB 293
#define RB 294
#define LCB 295
#define RCB 296
#define SEM 297
#define COMMA 298
#define I_CONST 299
#define F_CONST 300
#define STRING 301
#define ID 302
#define COMMENTLINE 303

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 93 "compiler_hw3.y" /* yacc.c:1909  */

    int i_val;
    double f_val;
    char string[150];
    char *s_val;

#line 157 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
