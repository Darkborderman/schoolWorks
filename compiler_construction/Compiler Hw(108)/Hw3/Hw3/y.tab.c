/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 2 "compiler_hw3.y" /* yacc.c:339  */


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


#line 156 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
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
#line 93 "compiler_hw3.y" /* yacc.c:355  */

    int i_val;
    double f_val;
    char string[150];
    char *s_val;

#line 299 "y.tab.c" /* yacc.c:355  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 314 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  2
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   190

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  49
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  38
/* YYNRULES -- Number of rules.  */
#define YYNRULES  85
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  179

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   303

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   145,   145,   146,   150,   151,   152,   153,   154,   155,
     156,   157,   161,   187,   223,   224,   225,   229,   246,   288,
     287,   346,   388,   388,   455,   455,   513,   548,   585,   586,
     598,   612,   613,   625,   644,   664,   678,   693,   694,   770,
     774,   797,   807,   830,   842,   843,   844,   845,   914,   914,
     922,   922,   935,   935,  1004,  1017,  1017,  1053,  1053,  1088,
    1088,  1124,  1124,  1159,  1159,  1195,  1195,  1233,  1233,  1243,
    1243,  1266,  1280,  1299,  1320,  1320,  1336,  1342,  1344,  1344,
    1386,  1386,  1405,  1427,  1427,  1450
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "PRINT", "PRINTLN", "IF", "ELSE", "FOR",
  "VAR", "NEWLINE", "INT", "FLOAT", "VOID", "FUNC", "MAIN", "RETURN",
  "ADD", "SUB", "MUL", "DIV", "REMAIN", "INCR", "DECR", "GREATER", "LESS",
  "GREATER_EQUAL", "LESS_EQUAL", "EQUAL", "NEQUAL", "ASSIGN", "ADD_ASSIGN",
  "SUB_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "REMAIN_ASSIGN", "AND", "OR",
  "NOT", "LB", "RB", "LCB", "RCB", "SEM", "COMMA", "I_CONST", "F_CONST",
  "STRING", "ID", "COMMENTLINE", "$accept", "program", "stat",
  "declaration", "type", "expression_stat", "$@1", "$@2", "$@3", "val",
  "term", "initializer", "group", "print_func", "compound_stat",
  "if_else_stat", "$@4", "$@5", "$@6", "compare_stat", "compare", "$@7",
  "$@8", "$@9", "$@10", "$@11", "$@12", "for_stat", "$@13", "$@14",
  "for_compute", "func_stat", "$@15", "$@16", "func_declare", "$@17",
  "func_var", "$@18", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303
};
# endif

#define YYPACT_NINF -139

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-139)))

#define YYTABLE_NINF -79

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    -139,     8,  -139,   -28,   -24,     2,    -2,    19,  -139,   -12,
      27,    27,    38,    25,  -139,  -139,    47,    61,  -139,  -139,
    -139,    73,   111,  -139,  -139,  -139,  -139,  -139,  -139,    94,
    -139,  -139,    -8,    95,    13,    97,  -139,     4,    77,    78,
     127,    90,  -139,  -139,    45,    11,  -139,   129,  -139,   126,
     134,    64,    27,    27,   113,   112,   114,  -139,    27,    27,
     123,   125,   122,   124,   128,   130,    27,    27,    27,  -139,
     115,  -139,   117,  -139,    27,  -139,  -139,    27,    27,  -139,
    -139,  -139,  -139,     0,   118,   121,  -139,  -139,  -139,   120,
    -139,  -139,   131,    66,    96,   101,    27,    27,    27,   111,
     111,    27,    27,    27,    27,    27,    27,  -139,  -139,  -139,
     142,   143,   132,     3,   133,    27,  -139,    27,   135,   106,
     136,   152,   138,  -139,  -139,  -139,   105,   107,   110,     3,
       3,     3,     3,     3,     3,  -139,  -139,   137,   139,   140,
     116,   154,   127,   141,    27,  -139,    27,  -139,  -139,  -139,
     155,   156,    -2,  -139,  -139,   144,   127,   145,   -11,   146,
    -139,  -139,   148,  -139,   149,   150,  -139,   157,   158,   106,
     159,   161,    27,  -139,  -139,  -139,  -139,  -139,  -139
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     0,     1,     0,     0,     0,    67,     0,    45,     0,
       0,     0,     0,     0,    35,    36,    38,     0,     2,     4,
       6,    55,    28,    31,    37,     7,     5,     9,     8,     0,
      10,    11,     0,     0,     0,     0,    48,     0,     0,     0,
       0,     0,    74,    38,     0,     0,    46,    52,    47,     0,
       0,     0,     0,     0,     0,     0,     0,    44,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    54,
       0,    40,     0,    42,     0,    72,    73,     0,     0,    69,
      14,    15,    16,     0,     0,     0,    77,    39,    50,     0,
      26,    27,    38,     0,     0,     0,     0,     0,     0,    29,
      30,     0,     0,     0,     0,     0,     0,    32,    33,    34,
       0,     0,     0,    71,     0,     0,    13,     0,     0,     0,
       0,     0,     0,    17,    18,    21,     0,     0,     0,    56,
      58,    60,    62,    64,    66,    41,    43,     0,     0,     0,
       0,     0,     0,     0,     0,    53,     0,    20,    23,    25,
       0,     0,     0,    12,    76,    82,     0,     0,    85,     0,
      49,    68,     0,    80,     0,     0,    83,     0,     0,     0,
       0,     0,     0,    79,    70,    81,    75,    51,    84
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -139,  -139,  -139,  -139,  -138,  -139,  -139,  -139,  -139,   -10,
       5,    74,    81,  -139,  -139,  -139,  -139,  -139,  -139,  -139,
     -71,  -139,  -139,  -139,  -139,  -139,  -139,  -139,  -139,  -139,
      21,  -139,  -139,  -139,     9,  -139,    14,  -139
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,    18,    19,    83,    20,    54,    55,    56,    21,
      22,    23,    24,    25,    26,    27,    74,   120,    89,    28,
      29,    60,    61,    62,    63,    64,    65,    30,    38,   115,
      39,    31,    85,   122,   143,   169,   159,   172
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      44,    45,    41,   112,   155,    58,    59,   114,     2,   116,
      32,     3,     4,     5,    34,     6,     7,     8,   164,    58,
      59,     9,    45,    10,    45,    75,    76,    58,    59,   117,
      11,    47,   166,    77,    48,    42,    14,    15,    70,    43,
      36,    93,    94,    95,   139,    37,    11,    46,    12,    13,
      87,    11,    14,    15,    86,    16,    17,    14,    15,    72,
      43,    58,    59,    99,   100,    11,    40,   113,    49,    50,
      57,    14,    15,   157,    43,   123,    51,    52,   -19,    53,
     -22,   -24,    58,    59,    33,    35,   126,   127,   128,    58,
      59,   129,   130,   131,   132,   133,   134,   -57,   -59,   -61,
     -63,   -65,    11,    69,    71,   124,    73,   140,    14,    15,
     125,    92,    58,    59,   147,    78,   148,    58,    59,   149,
      79,    58,    59,    58,    59,   153,    58,    59,    84,    66,
      67,    68,    58,    59,    88,    90,   158,    80,    81,    82,
     107,   108,   109,    91,    96,    97,   101,   103,    98,   102,
     104,   135,   136,   142,   110,   105,   111,   118,   106,   119,
     121,   145,   158,   154,   160,   161,   173,   174,   176,   -78,
     177,   137,   138,   162,   144,   141,   146,   150,   175,   151,
     156,     0,   152,     0,   165,   167,   178,   163,   168,   170,
     171
};

static const yytype_int16 yycheck[] =
{
      10,    11,    14,    74,   142,    16,    17,    78,     0,     9,
      38,     3,     4,     5,    38,     7,     8,     9,   156,    16,
      17,    13,    32,    15,    34,    21,    22,    16,    17,    29,
      38,     6,    43,    29,     9,    47,    44,    45,    46,    47,
      38,    51,    52,    53,   115,    47,    38,     9,    40,    41,
      39,    38,    44,    45,     9,    47,    48,    44,    45,    46,
      47,    16,    17,    58,    59,    38,    47,    77,    21,    22,
       9,    44,    45,   144,    47,     9,    29,    30,    31,    32,
      33,    34,    16,    17,     3,     4,    96,    97,    98,    16,
      17,   101,   102,   103,   104,   105,   106,    24,    25,    26,
      27,    28,    38,     9,     9,     9,     9,   117,    44,    45,
       9,    47,    16,    17,     9,    38,     9,    16,    17,     9,
      42,    16,    17,    16,    17,     9,    16,    17,    38,    18,
      19,    20,    16,    17,     5,     9,   146,    10,    11,    12,
      66,    67,    68,     9,    31,    33,    23,    25,    34,    24,
      26,     9,     9,    47,    39,    27,    39,    39,    28,    38,
      40,     9,   172,     9,     9,     9,     9,     9,     9,    38,
       9,    39,    39,   152,    38,    40,    38,    40,   169,    40,
      39,    -1,    42,    -1,    39,    39,   172,    43,    40,    40,
      40
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    50,     0,     3,     4,     5,     7,     8,     9,    13,
      15,    38,    40,    41,    44,    45,    47,    48,    51,    52,
      54,    58,    59,    60,    61,    62,    63,    64,    68,    69,
      76,    80,    38,    61,    38,    61,    38,    47,    77,    79,
      47,    14,    47,    47,    58,    58,     9,     6,     9,    21,
      22,    29,    30,    32,    55,    56,    57,     9,    16,    17,
      70,    71,    72,    73,    74,    75,    18,    19,    20,     9,
      46,     9,    46,     9,    65,    21,    22,    29,    38,    42,
      10,    11,    12,    53,    38,    81,     9,    39,     5,    67,
       9,     9,    47,    58,    58,    58,    31,    33,    34,    59,
      59,    23,    24,    25,    26,    27,    28,    60,    60,    60,
      39,    39,    69,    58,    69,    78,     9,    29,    39,    38,
      66,    40,    82,     9,     9,     9,    58,    58,    58,    58,
      58,    58,    58,    58,    58,     9,     9,    39,    39,    69,
      58,    40,    47,    83,    38,     9,    38,     9,     9,     9,
      40,    40,    42,     9,     9,    53,    39,    69,    58,    85,
       9,     9,    79,    43,    53,    39,    43,    39,    40,    84,
      40,    40,    86,     9,     9,    83,     9,     9,    85
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    49,    50,    50,    51,    51,    51,    51,    51,    51,
      51,    51,    52,    52,    53,    53,    53,    54,    54,    55,
      54,    54,    56,    54,    57,    54,    54,    54,    58,    58,
      58,    59,    59,    59,    59,    60,    60,    60,    60,    61,
      62,    62,    62,    62,    63,    63,    63,    63,    65,    64,
      66,    64,    67,    64,    68,    70,    69,    71,    69,    72,
      69,    73,    69,    74,    69,    75,    69,    77,    76,    78,
      76,    79,    79,    79,    81,    80,    80,    80,    82,    80,
      84,    83,    83,    86,    85,    85
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     0,     1,     1,     1,     1,     1,     1,
       1,     1,     6,     4,     1,     1,     1,     4,     4,     0,
       5,     4,     0,     5,     0,     5,     3,     3,     1,     3,
       3,     1,     3,     3,     3,     1,     1,     1,     1,     3,
       3,     5,     3,     5,     2,     1,     2,     2,     0,     7,
       0,     9,     0,     5,     2,     0,     4,     0,     4,     0,
       4,     0,     4,     0,     4,     0,     4,     0,     7,     0,
       9,     3,     2,     2,     0,     9,     6,     3,     0,     8,
       0,     5,     2,     0,     4,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 145 "compiler_hw3.y" /* yacc.c:1646  */
    { assign_flag = 0; error_flag = 0; type_flag = 0; id_flag = 0; print_flag = 0; id_num = 0; prev_type = 0; }
#line 1518 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 162 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(lookup_symbol((yyvsp[-4].string), scope_flag, 1) == -1){
            if((yyvsp[-3].i_val) == 1){
                if(error_flag == 0){
                        insert_symbol((yyvsp[-4].string),"int", (yyvsp[-3].i_val), scope_flag);
                        assign_symbol(lookup_symbol((yyvsp[-4].string), scope_flag, 1), (yyvsp[-1].f_val));
                        printf("declare %s in block of depth %d \n", (yyvsp[-4].string), scope_flag);
                }
            }

            else if((yyvsp[-3].i_val) == 2){
                if(error_flag == 0){
                    insert_symbol((yyvsp[-4].string),"float", (yyvsp[-3].i_val), scope_flag);
                    assign_symbol(lookup_symbol((yyvsp[-4].string), scope_flag, 1), (yyvsp[-1].f_val));
                    printf("declare %s in block of depth %d \n", (yyvsp[-4].string), scope_flag);
                }
            }
        }

        else if(lookup_symbol((yyvsp[-4].string), scope_flag, 1) > -1){
            print_error("Redeclare the variable",(yyvsp[-4].string));
        }
        yylineno++;
    }
#line 1547 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 188 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(lookup_symbol((yyvsp[-2].string), scope_flag, 1) == -1){
            if((yyvsp[-1].i_val) == 1){
                if(error_flag == 0){
                    if(type_flag == 2){
                        print_error("Assiging the float type to variable of int type", (yyvsp[-2].string));
                    }

                    else{
                        insert_symbol((yyvsp[-2].string),"int", (yyvsp[-1].i_val), scope_flag);
                        fprintf(file, "\tldc 0\n");
                        assign_symbol(lookup_symbol((yyvsp[-2].string), scope_flag, 1), 0);
                        printf("declare %s in block of depth %d \n", (yyvsp[-2].string), scope_flag);
                    }
                }
            }

            else if((yyvsp[-1].i_val) == 2){
                if(error_flag == 0){
                    insert_symbol((yyvsp[-2].string),"float", (yyvsp[-1].i_val), scope_flag);
                    fprintf(file, "\tldc 0.000000\n");
                    assign_symbol(lookup_symbol((yyvsp[-2].string), scope_flag, 1), 0);
                    printf("declare %s in block of depth %d \n", (yyvsp[-2].string), scope_flag);
                }
            }
        }

        else{
            print_error("Redeclare the variable",(yyvsp[-2].string));
        }
        yylineno++;
    }
#line 1584 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 223 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.i_val) = 1; }
#line 1590 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 224 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.i_val) = 2; }
#line 1596 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 225 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.i_val) = 3; }
#line 1602 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 230 "compiler_hw3.y" /* yacc.c:1646  */
    {

        printf("ASSIGN \n");
        int temp = lookup_symbol((yyvsp[-3].string), scope_flag, 2);
        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-3].string));
        }
        else{
            if(error_flag == 0){
                assign_symbol(temp, (yyvsp[-1].f_val));
            }
        }

        yylineno++;
    }
#line 1622 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 247 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("ADD_ASSIGN \n");
        int temp = lookup_symbol((yyvsp[-3].string), scope_flag, 2);
        double temp_value = 0;
        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-3].string));
        }
        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value += (yyvsp[-1].f_val);

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
                    temp_value += (yyvsp[-1].f_val);
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
#line 1666 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 288 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int temp = lookup_symbol((yyvsp[0].string), scope_flag, 2);
        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[0].string));
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
    }
#line 1689 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 306 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("SUB_ASSIGN \n");
        int temp = id_num;
        double temp_value = 0;
        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-4].string));
        }
        else{
            if(error_flag == 0 ){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value -= (yyvsp[-1].f_val);
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
                    temp_value -= (yyvsp[-1].f_val);
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
#line 1733 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 347 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("MUL_ASSIGN \n");
        int temp = lookup_symbol((yyvsp[-3].string), scope_flag, 2);
        double temp_value = 0;
        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-3].string));
        }
        else{
            if(error_flag == 0 && exe_flag){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value *= (yyvsp[-1].f_val);
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
                    temp_value *= (yyvsp[-1].f_val);
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
#line 1778 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 388 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int temp = lookup_symbol((yyvsp[0].string), scope_flag, 2);
        double temp_value = 0;

        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[0].string));
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
    }
#line 1803 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 408 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("DIV_ASSIGN \n");
        int temp = lookup_symbol((yyvsp[-4].string), scope_flag, 2);
        double temp_value = 0;

        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-4].string));
        }

        if((yyvsp[-1].f_val) == 0){
            print_error("The devisor can't be 0", NULL);
            error_flag = 1;
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    temp_value /= (yyvsp[-1].f_val);
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
                    temp_value /= (yyvsp[-1].f_val);
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
#line 1854 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 455 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int temp = lookup_symbol((yyvsp[0].string), scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[0].string));
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    fprintf(file, "\tiload %d\n", temp);
                }
            }
        }
    }
#line 1876 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 472 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("REMAIN_ASSIGN \n");
        int temp = lookup_symbol((yyvsp[-4].string), scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-4].string));
        }

        if((yyvsp[-1].f_val) == 0){
            print_error("The remainder can't be 0", NULL);
            error_flag = 1;
        }

        else{
            if(error_flag == 0){
                if(symbol_table[temp].type == 1){
                    temp_value = symbol_table[temp].int_value;
                    test = (int)temp_value % (int)(yyvsp[-1].f_val);

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
#line 1921 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 514 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("Increment \n");
        int temp = lookup_symbol((yyvsp[-2].string), scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-2].string));
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
#line 1959 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 549 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("Decrement \n");
        int temp = lookup_symbol((yyvsp[-2].string), scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-2].string));
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
#line 1997 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 585 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.f_val) = (yyvsp[0].f_val); }
#line 2003 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 587 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("Add \n");
        (yyval.f_val) = (yyvsp[-2].f_val) + (yyvsp[0].f_val);
        if(type_flag == 1){
            fprintf(file,"\tiadd\n");
        }
        else if(type_flag == 2){
            fprintf(file,"\tfadd\n");
        }
    }
#line 2018 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 599 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("Sub \n");
        (yyval.f_val) = (yyvsp[-2].f_val) - (yyvsp[0].f_val);
        if(type_flag == 1){
            fprintf(file,"\tisub\n");
        }
        else if(type_flag == 2){
            fprintf(file,"\tfsub\n");
        }
    }
#line 2033 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 612 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.f_val) = (yyvsp[0].f_val); }
#line 2039 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 614 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("Mul \n");
        (yyval.f_val) = (yyvsp[-2].f_val) * (yyvsp[0].f_val);
        if(type_flag == 1){
            fprintf(file,"\timul\n");
        }
        else if(type_flag == 2){
            fprintf(file,"\tfmul\n");
        }
    }
#line 2054 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 626 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if((yyvsp[0].f_val) == 0){
            print_error("The devisor can't be 0", NULL);
            error_flag = 1;
            (yyval.f_val) = (yyvsp[-2].f_val);
        }
        else{
            printf("Div \n");
            (yyval.f_val) = (yyvsp[-2].f_val) / (yyvsp[0].f_val);
            if(type_flag == 1){
                fprintf(file,"\tidiv\n");
            }
            else if(type_flag == 2){
                fprintf(file,"\tfdiv\n");
            }
        }
    }
#line 2076 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 645 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if((yyvsp[0].f_val) == 0){
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
            (yyval.f_val) = (int)(yyvsp[-2].f_val) % (int)(yyvsp[0].f_val);
            fprintf(file,"\tirem\n");
        }
    }
#line 2097 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 665 "compiler_hw3.y" /* yacc.c:1646  */
    {
        (yyval.f_val) = (yyvsp[0].i_val);
        fprintf(file, "\tldc %d\n", (int)(yyvsp[0].i_val));
        if(type_flag != 2){
            type_flag = 1;
        }
        if(type_flag == 2){
            //prev_type = 1;
            fprintf(file, "\ti2f\n");
        }

    }
#line 2114 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 679 "compiler_hw3.y" /* yacc.c:1646  */
    {
        (yyval.f_val) = (yyvsp[0].f_val);
        if(type_flag == 1){
            if(prev_type < 2){
                fprintf(file, "\ti2f\n");
            }
        }
        if(type_flag != 2){
            type_flag = 2;
        }

        fprintf(file, "\tldc %lf\n", (yyvsp[0].f_val));
    }
#line 2132 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 693 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.f_val) = (yyvsp[0].f_val); }
#line 2138 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 695 "compiler_hw3.y" /* yacc.c:1646  */
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
                test = strcmp((yyvsp[0].string), pch);
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
            int temp = lookup_symbol((yyvsp[0].string), scope_flag, 2);
            if(temp == -1){
                print_error("No declare before using the variable", (yyvsp[0].string));
                error_flag = 1;
                (yyval.f_val) = 0;
            }
            else{
                if(symbol_table[temp].assign_bit == 0){
                    error_flag = 1;
                    print_error("No assignment before using", (yyvsp[0].string));
                }
                else{
                    if(symbol_table[temp].type == 1){
                        (yyval.f_val) = symbol_table[temp].int_value;
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
                        (yyval.f_val) = symbol_table[temp].dou_value;
                        fprintf(file, "\tfload %d\n", temp);
                    }
                    strcpy(print_buf, (yyvsp[0].string));
                    print_i = temp;
                    id_flag = 1;
                }
            }
        }

    }
#line 2215 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 770 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.f_val) = (yyvsp[-1].f_val); }
#line 2221 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 775 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(error_flag == 0){
            print_value((yyvsp[-1].f_val), type_flag, 1);

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
#line 2247 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 798 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("Print : \" %s \" \n", (yyvsp[-2].string));
        fprintf(file, "\tldc \"%s\"\n", (yyvsp[-2].string));
        fprintf(file,   "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n"
	                    "\tswap\n"
	                    "\tinvokevirtual java/io/PrintStream/print(Ljava/lang/String;)V\n" );
        yylineno++;
    }
#line 2260 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 808 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(error_flag == 0){
            print_value((yyvsp[-1].f_val), type_flag, 2);

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
#line 2286 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 831 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("Println : \" %s \" \n", (yyvsp[-2].string));
        fprintf(file, "\tldc \"%s\"\n", (yyvsp[-2].string));
        fprintf(file,   "\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n"
	                    "\tswap\n"
	                    "\tinvokevirtual java/io/PrintStream/println(Ljava/lang/String;)V\n" );
        yylineno++;
    }
#line 2299 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 842 "compiler_hw3.y" /* yacc.c:1646  */
    { yylineno++; }
#line 2305 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 843 "compiler_hw3.y" /* yacc.c:1646  */
    { yylineno++; }
#line 2311 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 844 "compiler_hw3.y" /* yacc.c:1646  */
    { scope_flag++; yylineno++; }
#line 2317 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 845 "compiler_hw3.y" /* yacc.c:1646  */
    {
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
#line 2388 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 914 "compiler_hw3.y" /* yacc.c:1646  */
    {

        if_flag[scope_flag] = 1;
    }
#line 2397 "y.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 918 "compiler_hw3.y" /* yacc.c:1646  */
    {
        scope_flag++;
        yylineno++;
    }
#line 2406 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 922 "compiler_hw3.y" /* yacc.c:1646  */
    {
        remove_symbol(scope_flag);
        scope_flag--;
        fprintf(file, "\tgoto EXIT_%d%d\n", scope_flag, exit_num[scope_flag]);
        fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
        label_num[scope_flag]++;

    }
#line 2419 "y.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 930 "compiler_hw3.y" /* yacc.c:1646  */
    {

        scope_flag++; yylineno++;
    }
#line 2428 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 935 "compiler_hw3.y" /* yacc.c:1646  */
    {
        remove_symbol(scope_flag);
        scope_flag--;
        fprintf(file, "\tgoto EXIT_%d%d\n", scope_flag, exit_num[scope_flag]);
        fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
        label_num[scope_flag]++;
        else_flag = 1;

    }
#line 2442 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 944 "compiler_hw3.y" /* yacc.c:1646  */
    {
        scope_flag++; yylineno++;
        }
#line 2450 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 1005 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if((yyvsp[-1].i_val)){
            printf("true \n");
        }
        else{
            printf("false \n");
        }
        yylineno++;
    }
#line 2464 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 1017 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    }
#line 2478 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 1026 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if((yyvsp[-3].f_val) > (yyvsp[0].f_val)){
            (yyval.i_val) = 1;
        }
        else{
            (yyval.i_val) = 0;
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
#line 2509 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 1053 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    }
#line 2523 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 1062 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if((yyvsp[-3].f_val) < (yyvsp[0].f_val)){
            (yyval.i_val) = 1;
        }
        else{
            (yyval.i_val) = 0;
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
#line 2553 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 1088 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    }
#line 2567 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 1097 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if((yyvsp[-3].f_val) >= (yyvsp[0].f_val)){
            (yyval.i_val) = 1;
        }
        else{
            (yyval.i_val) = 0;
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
#line 2598 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 1124 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    }
#line 2612 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 1133 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if((yyvsp[-3].f_val) <= (yyvsp[0].f_val)){
            (yyval.i_val) = 1;
        }
        else{
            (yyval.i_val) = 0;
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
#line 2642 "y.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 1159 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    }
#line 2656 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 1168 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if((yyvsp[-3].f_val) == (yyvsp[0].f_val)){
            (yyval.i_val) = 1;
        }
        else{
            (yyval.i_val) = 0;
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
#line 2687 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 1195 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(type_flag == 1){
            prev_type = 1;
        }
        else if(type_flag == 2){
            prev_type = 2;
            type_flag = 1;
        }
    }
#line 2701 "y.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 1204 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if((yyvsp[-3].f_val) != (yyvsp[0].f_val)){
            (yyval.i_val) = 1;
        }
        else{
            (yyval.i_val) = 0;
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
#line 2731 "y.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 1233 "compiler_hw3.y" /* yacc.c:1646  */
    {
        for_flag[scope_flag] = 1;
        fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
        label_num[scope_flag]++;
    }
#line 2741 "y.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 1238 "compiler_hw3.y" /* yacc.c:1646  */
    {
        scope_flag++;
        yylineno++;
    }
#line 2750 "y.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 1243 "compiler_hw3.y" /* yacc.c:1646  */
    {
        for_flag[scope_flag] = 1;
        fprintf(file, "Label_%d%d : \n", scope_flag, label_num[scope_flag]);
        label_num[scope_flag]++;
    }
#line 2760 "y.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 1248 "compiler_hw3.y" /* yacc.c:1646  */
    {
        scope_flag++;
        yylineno++;
    }
#line 2769 "y.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 1267 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("ASSIGN \n");
        int temp = lookup_symbol((yyvsp[-2].string), scope_flag, 2);
        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-2].string));
        }
        else{
            if(error_flag == 0){
                assign_symbol(temp, (yyvsp[0].f_val));
            }
        }
    }
#line 2786 "y.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 1281 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("Increment \n");
        int temp = lookup_symbol((yyvsp[-1].string), scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-1].string));
        }

        else{
            if(error_flag == 0){
                for_mode[scope_flag] = 1;
                for_id[scope_flag] = temp;
            }
        }
    }
#line 2808 "y.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 1300 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("Decrement \n");
        int temp = lookup_symbol((yyvsp[-1].string), scope_flag, 2);
        double temp_value = 0;
        int test = 0;

        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-1].string));
        }

        else{
            if(error_flag == 0){
                for_mode[scope_flag] = 2;
                for_id[scope_flag] = temp;
            }
        }
    }
#line 2830 "y.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 1320 "compiler_hw3.y" /* yacc.c:1646  */
    {
        strcpy(func_table[func_num].id, (yyvsp[0].string));
        if(func_num == 0) fprintf(file, "\tgoto Main\n");
        fprintf(file, "%s : \n", (yyvsp[0].string));
        fprintf(file, "\tastore 19\n");
    }
#line 2841 "y.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 1326 "compiler_hw3.y" /* yacc.c:1646  */
    {
        func_table[func_num].para_count = func_para;
        func_temp = func_num;
        func_para = 0;
        func_flag = 1;
        func_num++;
        yylineno++;
        scope_flag++;
    }
#line 2855 "y.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 1337 "compiler_hw3.y" /* yacc.c:1646  */
    {
        fprintf(file,"Main : \n");
        yylineno++;
    }
#line 2864 "y.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 1342 "compiler_hw3.y" /* yacc.c:1646  */
    { fprintf(file,"\tret 19\n"); yylineno++; func_flag = 0; }
#line 2870 "y.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 1344 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i = 0;
        for(i = 0;i < func_num; i++){
            if(strcmp((yyvsp[0].string), func_table[i].id) == 0){
                func_temp = i;
            }
        }
    }
#line 2883 "y.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 1352 "compiler_hw3.y" /* yacc.c:1646  */
    {
        fprintf(file, "\tjsr %s\n", func_table[func_temp].id);
        int temp = lookup_symbol((yyvsp[-7].string), scope_flag, 2);
        if(temp == -1){
            print_error("No declare before using the variable", (yyvsp[-7].string));
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
#line 2919 "y.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 1386 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(func_para == 0){
            strcpy(func_table[func_num].para, (yyvsp[-2].string));
            strcat(func_table[func_num].para, " ");
        }
        else{
            strcat(func_table[func_num].para, (yyvsp[-2].string));
            strcat(func_table[func_num].para, " ");
        }
        if((yyvsp[-1].i_val) == 1){
            func_table[func_num].para_type[func_para] = 1;
        }
        if((yyvsp[-1].i_val) == 2){
            func_table[func_num].para_type[func_para] = 2;
        }
        func_table[func_num].para_st[func_para] = func_para + 10;
        func_para++;
    }
#line 2942 "y.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 1403 "compiler_hw3.y" /* yacc.c:1646  */
    {}
#line 2948 "y.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 1406 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(func_para == 0){
            strcpy(func_table[func_num].para, (yyvsp[-1].string));
            strcat(func_table[func_num].para, " ");
        }
        else{
            strcat(func_table[func_num].para, (yyvsp[-1].string));
            strcat(func_table[func_num].para, " ");
        }
        if((yyvsp[0].i_val) == 1){
            func_table[func_num].para_type[func_para] = 1;
        }
        if((yyvsp[0].i_val) == 2){
            func_table[func_num].para_type[func_para] = 2;
        }
        func_table[func_num].para_st[func_para] = func_para + 10;
        func_para++;
    }
#line 2971 "y.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 1427 "compiler_hw3.y" /* yacc.c:1646  */
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
#line 2998 "y.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 1448 "compiler_hw3.y" /* yacc.c:1646  */
    {}
#line 3004 "y.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 1451 "compiler_hw3.y" /* yacc.c:1646  */
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
#line 3031 "y.tab.c" /* yacc.c:1646  */
    break;


#line 3035 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 1475 "compiler_hw3.y" /* yacc.c:1906  */


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
