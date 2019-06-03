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
    ADD = 268,
    SUB = 269,
    MUL = 270,
    DIV = 271,
    REMAIN = 272,
    INCR = 273,
    DECR = 274,
    GREATER = 275,
    LESS = 276,
    GREATER_EQUAL = 277,
    LESS_EQUAL = 278,
    EQUAL = 279,
    NEQUAL = 280,
    ASSIGN = 281,
    ADD_ASSIGN = 282,
    SUB_ASSIGN = 283,
    MUL_ASSIGN = 284,
    DIV_ASSIGN = 285,
    REMAIN_ASSIGN = 286,
    AND = 287,
    OR = 288,
    NOT = 289,
    LB = 290,
    RB = 291,
    LCB = 292,
    RCB = 293,
    I_CONST = 294,
    F_CONST = 295,
    STRING = 296,
    ID = 297,
    COMMENTLINE = 298
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
#define ADD 268
#define SUB 269
#define MUL 270
#define DIV 271
#define REMAIN 272
#define INCR 273
#define DECR 274
#define GREATER 275
#define LESS 276
#define GREATER_EQUAL 277
#define LESS_EQUAL 278
#define EQUAL 279
#define NEQUAL 280
#define ASSIGN 281
#define ADD_ASSIGN 282
#define SUB_ASSIGN 283
#define MUL_ASSIGN 284
#define DIV_ASSIGN 285
#define REMAIN_ASSIGN 286
#define AND 287
#define OR 288
#define NOT 289
#define LB 290
#define RB 291
#define LCB 292
#define RCB 293
#define I_CONST 294
#define F_CONST 295
#define STRING 296
#define ID 297
#define COMMENTLINE 298

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 56 "compiler_hw2.y" /* yacc.c:1909  */

    int i_val;
    double f_val;
    char string[150];
    char *s_val;

#line 147 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
