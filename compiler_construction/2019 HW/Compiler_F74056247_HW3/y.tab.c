/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

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
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */

#line 67 "y.tab.c" /* yacc.c:339  */

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
/* "%code requires" blocks.  */
#line 2 "compiler_hw3.y" /* yacc.c:355  */

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


#line 157 "y.tab.c" /* yacc.c:355  */

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
#line 65 "compiler_hw3.y" /* yacc.c:355  */

    char* string;
    variable var;

#line 272 "y.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 289 "y.tab.c" /* yacc.c:358  */

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
#define YYFINAL  51
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   285

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  50
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  23
/* YYNRULES -- Number of rules.  */
#define YYNRULES  78
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  137

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   304

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
      45,    46,    47,    48,    49
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   105,   105,   106,   109,   110,   113,   114,   115,   116,
     119,   137,   157,   168,   178,   181,   182,   194,   206,   218,
     229,   238,   239,   240,   241,   242,   243,   246,   247,   248,
     249,   258,   264,   271,   281,   291,   301,   312,   321,   324,
     330,   334,   343,   346,   351,   357,   363,   367,   371,   375,
     387,   390,   392,   395,   405,   409,   422,   429,   432,   435,
     436,   437,   440,   441,   444,   445,   448,   449,   452,   453,
     454,   455,   456,   457,   461,   462,   463,   464,   465
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ADD", "SUB", "MUL", "DIV", "MOD", "INC",
  "DEC", "MT", "LT", "MTE", "LTE", "EQ", "NE", "ASGN", "ADDASGN",
  "SUBASGN", "MULASGN", "DIVASGN", "MODASGN", "AND", "OR", "NOT", "LB",
  "RB", "LCB", "RCB", "LSB", "RSB", "COMMA", "PRINT", "IF", "ELSE", "FOR",
  "WHILE", "VOID", "INT", "FLOAT", "STRING", "BOOL", "RETURN", "SEMICOLON",
  "I_CONST", "F_CONST", "TRUE", "FALSE", "STRING_LITERAL", "ID", "$accept",
  "program", "statements", "statement", "declaration_statement",
  "arithmetic_statement", "expression_statement", "assignment_statement",
  "execution_statement", "argument_list", "value", "function_declaration",
  "func", "function_head", "function_parameter", "parameter_list",
  "function_scope", "if_statement", "else_statement", "while_statement",
  "condition", "comparaters", "type", YY_NULLPTR
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
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304
};
# endif

#define YYPACT_NINF -104

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-104)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     183,    45,    45,    45,   -15,   -11,    -9,  -104,  -104,  -104,
    -104,  -104,    19,  -104,  -104,  -104,  -104,  -104,   240,    97,
    -104,  -104,     9,    28,  -104,    57,   -25,  -104,  -104,   200,
      12,  -104,  -104,    23,    13,   263,  -104,   263,    17,   229,
      45,    45,  -104,    76,    45,    45,    45,    45,    45,    45,
     106,  -104,  -104,   119,  -104,    45,    45,    45,    45,    45,
    -104,  -104,  -104,    24,  -104,  -104,  -104,    72,    25,   183,
    -104,    -8,  -104,  -104,    49,   239,    70,    73,  -104,   263,
     263,   263,   263,   263,   263,  -104,    81,    77,    93,    79,
      63,   263,   263,   263,   263,   263,   264,    83,  -104,    87,
    -104,   139,  -104,    45,  -104,  -104,  -104,  -104,  -104,  -104,
    -104,  -104,    45,    59,    68,  -104,   229,    45,    99,    67,
    -104,   263,   263,   183,  -104,    86,  -104,  -104,  -104,   263,
    -104,   165,   -18,  -104,  -104,  -104,  -104
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     0,     0,     0,    74,    77,    76,
      78,    75,     0,    44,    45,    46,    47,    48,    49,     0,
       3,     4,     0,     0,     7,     0,    25,    26,     5,     0,
       0,     8,     9,     0,    49,    21,    25,    22,     0,     0,
       0,     0,    31,     0,     0,     0,     0,     0,     0,     0,
       0,     1,     2,     0,     6,     0,     0,     0,     0,     0,
      23,    24,    29,     0,    27,    28,    55,     0,     0,     0,
      51,    11,    15,    49,     0,    67,     0,     0,    30,    32,
      33,    34,    35,    36,    37,    41,     0,    42,    12,    14,
       0,    16,    17,    18,    19,    20,     0,    38,    54,     0,
      56,     0,    50,     0,    53,    39,    71,    69,    72,    70,
      68,    73,     0,     0,     0,    40,     0,     0,    11,     0,
      52,    10,    66,     0,    61,    59,    65,    64,    43,    13,
      57,     0,     0,    60,    58,    63,    62
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
    -104,   -62,   -14,  -104,    96,     1,  -104,    58,     0,    46,
     -38,  -104,  -104,  -104,  -104,  -104,  -103,     8,  -104,  -104,
     120,  -104,   -23
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    19,    20,    21,    22,    23,    24,    25,    36,    86,
      27,    28,   102,    29,    30,    67,   125,    31,   133,    32,
      76,   112,    33
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      26,    74,    35,    37,    38,    52,    68,   101,   103,   123,
      39,   127,    87,    43,    40,     5,    41,   104,    65,    26,
      55,    56,    57,    58,    59,    60,    61,     1,     2,   135,
      90,    55,    56,    57,    58,    59,    60,    61,    50,    69,
      53,    75,    75,    72,     3,    79,    80,    81,    82,    83,
      84,     4,    54,     1,     2,    70,    91,    92,    93,    94,
      95,   131,    42,    13,    14,    15,    16,    17,    34,    26,
       3,    62,    71,    96,   100,   105,   119,     4,    87,    55,
      56,    57,    58,    59,    60,    61,   123,    52,    63,    13,
      14,    15,    16,    17,    34,   123,   113,    51,    98,   114,
      64,    26,   124,    99,   121,     1,     2,   115,   116,   117,
      53,   126,   118,   122,    63,   103,   130,    52,   129,    78,
     132,    97,     3,    26,     7,     8,     9,    10,    11,     4,
       5,    26,    85,     6,     7,     8,     9,    10,    11,    12,
     136,    13,    14,    15,    16,    17,    18,     1,     2,    89,
      13,    14,    15,    16,    17,    73,     7,     8,     9,    10,
      11,    77,   128,     0,     3,     0,     0,   120,    88,     0,
       0,     4,     5,     1,     2,     6,     7,     8,     9,    10,
      11,    12,     0,    13,    14,    15,    16,    17,    18,     0,
       3,     1,     2,   134,     0,     0,     0,     4,     5,     0,
       0,     6,     7,     8,     9,    10,    11,    12,     3,    13,
      14,    15,    16,    17,    18,     4,     5,     0,     0,     6,
       7,     8,     9,    10,    11,    12,    66,    13,    14,    15,
      16,    17,    18,     0,     0,     0,     0,     7,     8,     9,
      10,    11,    55,    56,    57,    58,    59,    60,    61,   106,
     107,   108,   109,   110,   111,     0,    44,    45,    46,    47,
      48,    49,     0,     0,     0,    50,    55,    56,    57,    58,
      59,    60,    61,    13,    14,    15,    16,    17,    73,     0,
      44,    45,    46,    47,    48,    49
};

static const yytype_int16 yycheck[] =
{
       0,    39,     1,     2,     3,    19,    29,    69,    16,    27,
      25,   114,    50,    12,    25,    33,    25,    25,    43,    19,
       3,     4,     5,     6,     7,     8,     9,     8,     9,   132,
      53,     3,     4,     5,     6,     7,     8,     9,    25,    27,
      31,    40,    41,    26,    25,    44,    45,    46,    47,    48,
      49,    32,    43,     8,     9,    43,    55,    56,    57,    58,
      59,   123,    43,    44,    45,    46,    47,    48,    49,    69,
      25,    43,    49,    49,    49,    26,    99,    32,   116,     3,
       4,     5,     6,     7,     8,     9,    27,   101,    31,    44,
      45,    46,    47,    48,    49,    27,    26,     0,    26,    26,
      43,   101,    43,    31,   103,     8,     9,    26,    31,    16,
      31,    43,    49,   112,    31,    16,    49,   131,   117,    43,
      34,    63,    25,   123,    37,    38,    39,    40,    41,    32,
      33,   131,    26,    36,    37,    38,    39,    40,    41,    42,
     132,    44,    45,    46,    47,    48,    49,     8,     9,    53,
      44,    45,    46,    47,    48,    49,    37,    38,    39,    40,
      41,    41,   116,    -1,    25,    -1,    -1,    28,    49,    -1,
      -1,    32,    33,     8,     9,    36,    37,    38,    39,    40,
      41,    42,    -1,    44,    45,    46,    47,    48,    49,    -1,
      25,     8,     9,    28,    -1,    -1,    -1,    32,    33,    -1,
      -1,    36,    37,    38,    39,    40,    41,    42,    25,    44,
      45,    46,    47,    48,    49,    32,    33,    -1,    -1,    36,
      37,    38,    39,    40,    41,    42,    26,    44,    45,    46,
      47,    48,    49,    -1,    -1,    -1,    -1,    37,    38,    39,
      40,    41,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    -1,    16,    17,    18,    19,
      20,    21,    -1,    -1,    -1,    25,     3,     4,     5,     6,
       7,     8,     9,    44,    45,    46,    47,    48,    49,    -1,
      16,    17,    18,    19,    20,    21
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     8,     9,    25,    32,    33,    36,    37,    38,    39,
      40,    41,    42,    44,    45,    46,    47,    48,    49,    51,
      52,    53,    54,    55,    56,    57,    58,    60,    61,    63,
      64,    67,    69,    72,    49,    55,    58,    55,    55,    25,
      25,    25,    43,    55,    16,    17,    18,    19,    20,    21,
      25,     0,    52,    31,    43,     3,     4,     5,     6,     7,
       8,     9,    43,    31,    43,    43,    26,    65,    72,    27,
      43,    49,    26,    49,    60,    55,    70,    70,    43,    55,
      55,    55,    55,    55,    55,    26,    59,    60,    49,    54,
      72,    55,    55,    55,    55,    55,    49,    57,    26,    31,
      49,    51,    62,    16,    25,    26,    10,    11,    12,    13,
      14,    15,    71,    26,    26,    26,    31,    16,    49,    72,
      28,    55,    55,    27,    43,    66,    43,    66,    59,    55,
      49,    51,    34,    68,    28,    66,    67
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    50,    51,    51,    52,    52,    53,    53,    53,    53,
      54,    54,    54,    54,    54,    55,    55,    55,    55,    55,
      55,    55,    55,    55,    55,    55,    55,    56,    56,    56,
      56,    56,    57,    57,    57,    57,    57,    57,    57,    58,
      58,    58,    59,    59,    60,    60,    60,    60,    60,    60,
      61,    61,    62,    63,    64,    64,    65,    65,    66,    67,
      67,    67,    68,    68,    69,    69,    70,    70,    71,    71,
      71,    71,    71,    71,    72,    72,    72,    72,    72
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     1,     1,     1,     2,     1,     1,     1,
       4,     2,     3,     5,     3,     3,     3,     3,     3,     3,
       3,     2,     2,     2,     2,     1,     1,     2,     2,     2,
       3,     2,     3,     3,     3,     3,     3,     3,     3,     4,
       4,     3,     1,     3,     1,     1,     1,     1,     1,     1,
       3,     2,     2,     3,     3,     2,     2,     4,     3,     5,
       6,     5,     2,     2,     5,     5,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1
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
        case 10:
#line 119 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        variable tmp=initVariable((yyvsp[-2].string),(yyvsp[-3].string),(yyvsp[0].var).value);

        //Normal declaration
        if(find_variable((yyvsp[-2].string),i)==-1 && i!=0){
            outputConst((yyvsp[0].var));
            add_variable(tmp.name,tmp.type,tmp.value,i);
            outputStore(tmp);
        }

        //Global declaration
        if(strcmp(currentScope.name,"global")==0){
            add_variable(tmp.name,tmp.type,tmp.value,0);
            fprintf(fp,".field public static %s %s = %s\n",(yyvsp[-2].string),(yyvsp[-3].string),(yyvsp[0].var).value);
        }
        (yyval.string)=(yyvsp[-3].string);
     }
#line 1510 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 137 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        variable tmp=initVariable((yyvsp[0].string),(yyvsp[-1].string),"");

        //Normal declaration
        if(find_variable((yyvsp[0].string),i)==-1 && i!=0){
            // no assign value means use default value
            variable val=initVariable("",(yyvsp[-1].string),"");
            outputConst(val);
            add_variable(tmp.name,tmp.type,tmp.value,i);
            outputStore(tmp);
        }

        //Global declaration
        if(strcmp(currentScope.name,"global")==0){
            add_variable(tmp.name,tmp.type,tmp.value,0);
            fprintf(fp,".field public static %s %s\n",(yyvsp[0].string),(yyvsp[-1].string));
        }
        (yyval.string)=(yyvsp[-1].string);
     }
#line 1535 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 157 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        if(find_variable((yyvsp[0].string),i)==-1){

            add_variable((yyvsp[0].string),(yyvsp[-2].string),"",i);

        }else sematic_error("Redeclared variable",(yyvsp[0].string));
        if(strcmp(currentScope.name,"global")==0){
            fprintf(fp,".field public static %s %s\n",(yyvsp[0].string),(yyvsp[-2].string));
        }
    }
#line 1551 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 168 "compiler_hw3.y" /* yacc.c:1646  */
    {

        int i=find_scope(currentScope.name);
        if(find_variable((yyvsp[-2].string),i)==-1){
            add_variable((yyvsp[-2].string),(yyvsp[-4].string),(yyvsp[0].var).value,i);
        }else sematic_error("Redeclared variable",(yyvsp[-2].string));
        if(strcmp(currentScope.name,"global")==0){
            fprintf(fp,".field public static %s %s = %s\n",(yyvsp[-2].string),(yyvsp[-4].string),(yyvsp[0].var).value);
        }
    }
#line 1566 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 178 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 1572 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 181 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.var)=(yyvsp[-1].var); }
#line 1578 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 182 "compiler_hw3.y" /* yacc.c:1646  */
    {
        
        if(strcmp((yyvsp[-2].var).name,"")==0) outputConst((yyvsp[-2].var));
        else outputLoad((yyvsp[-2].var));
        if(strcmp((yyvsp[0].var).name,"")==0) outputConst((yyvsp[0].var));
        else outputLoad((yyvsp[0].var));
        
        if(strcmp((yyvsp[-2].var).type,"I")==0&&strcmp((yyvsp[0].var).type,"I")==0)
            fprintf(fp,"iadd\n");
        if(strcmp((yyvsp[-2].var).type,"F")==0&&strcmp((yyvsp[0].var).type,"F")==0)
            fprintf(fp,"fadd\n");
    }
#line 1595 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 194 "compiler_hw3.y" /* yacc.c:1646  */
    {

        if(strcmp((yyvsp[-2].var).name,"")==0) outputConst((yyvsp[-2].var));
        else outputLoad((yyvsp[-2].var));
        if(strcmp((yyvsp[0].var).name,"")==0) outputConst((yyvsp[0].var));
        else outputLoad((yyvsp[0].var));
        
        if(strcmp((yyvsp[-2].var).type,"I")==0&&strcmp((yyvsp[0].var).type,"I")==0)
            fprintf(fp,"isub\n");
        if(strcmp((yyvsp[-2].var).type,"F")==0&&strcmp((yyvsp[0].var).type,"F")==0)
            fprintf(fp,"fsub\n");
    }
#line 1612 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 206 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(strcmp((yyvsp[-2].var).name,"")==0) outputConst((yyvsp[-2].var));
        else outputLoad((yyvsp[-2].var));
        if(strcmp((yyvsp[0].var).name,"")==0) outputConst((yyvsp[0].var));
        else outputLoad((yyvsp[0].var));
        
        if(strcmp((yyvsp[-2].var).type,"I")==0&&strcmp((yyvsp[0].var).type,"I")==0)
            fprintf(fp,"imul\n");
        if(strcmp((yyvsp[-2].var).type,"F")==0&&strcmp((yyvsp[0].var).type,"F")==0)
            fprintf(fp,"fmul\n");
    }
#line 1628 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 218 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(strcmp((yyvsp[-2].var).name,"")==0) outputConst((yyvsp[-2].var));
        else outputLoad((yyvsp[-2].var));
        if(strcmp((yyvsp[0].var).name,"")==0) outputConst((yyvsp[0].var));
        else outputLoad((yyvsp[0].var));
        
        if(strcmp((yyvsp[-2].var).type,"I")==0&&strcmp((yyvsp[0].var).type,"I")==0)
            fprintf(fp,"idiv\n");
        if(strcmp((yyvsp[-2].var).type,"F")==0&&strcmp((yyvsp[0].var).type,"F")==0)
            fprintf(fp,"fdiv\n");
    }
#line 1644 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 229 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(strcmp((yyvsp[-2].var).name,"")==0) outputConst((yyvsp[-2].var));
        else outputLoad((yyvsp[-2].var));
        if(strcmp((yyvsp[0].var).name,"")==0) outputConst((yyvsp[0].var));
        else outputLoad((yyvsp[0].var));
        
        if(strcmp((yyvsp[-2].var).type,"I")==0&&strcmp((yyvsp[0].var).type,"I")==0)
            fprintf(fp,"irem\n");
    }
#line 1658 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 238 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.var)=(yyvsp[0].var);}
#line 1664 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 239 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.var)=(yyvsp[0].var);}
#line 1670 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 240 "compiler_hw3.y" /* yacc.c:1646  */
    {(yyval.var)=(yyvsp[-1].var);}
#line 1676 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 241 "compiler_hw3.y" /* yacc.c:1646  */
    {(yyval.var)=(yyvsp[-1].var);}
#line 1682 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 242 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.var)=(yyvsp[0].var);}
#line 1688 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 243 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.var)=(yyvsp[0].var);}
#line 1694 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 249 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        if(strcmp((yyvsp[-1].var).name,"")==0) outputConst((yyvsp[-1].var));
        else outputLoad((yyvsp[-1].var));
        
        if(strcmp(scopes[i].type,"I")==0) fprintf(fp,"ireturn\n");
        if(strcmp(scopes[i].type,"F")==0) fprintf(fp,"freturn\n");
        fprintf(fp,".end method\n");
    }
#line 1708 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 258 "compiler_hw3.y" /* yacc.c:1646  */
    {
        fprintf(fp,"return\n");
        fprintf(fp,".end method\n");
    }
#line 1717 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 264 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        int index=find_variable((yyvsp[-2].string),i);
        variable tmp=variables[i][index];
        
        outputStore(tmp);
    }
#line 1729 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 271 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        int index=find_variable((yyvsp[-2].string),i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"iadd\n");
        if(strcmp(tmp.type,"F")==0) fprintf(fp,"fadd\n");
        outputStore(tmp);
    }
#line 1744 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 281 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        int index=find_variable((yyvsp[-2].string),i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"isub\n");
        if(strcmp(tmp.type,"F")==0) fprintf(fp,"fsub\n");
        outputStore(tmp);
    }
#line 1759 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 291 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        int index=find_variable((yyvsp[-2].string),i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"imul\n");
        if(strcmp(tmp.type,"F")==0) fprintf(fp,"fmul\n");
        outputStore(tmp);
    }
#line 1774 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 301 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        int index=find_variable((yyvsp[-2].string),i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"idiv\n");
        if(strcmp(tmp.type,"F")==0) fprintf(fp,"fdiv\n");
        outputStore(tmp);

    }
#line 1790 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 312 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        int index=find_variable((yyvsp[-2].string),i);
        variable tmp=variables[i][index];

        outputLoad(tmp);
        if(strcmp(tmp.type,"I")==0) fprintf(fp,"irem\n");
        outputStore(tmp);
    }
#line 1804 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 321 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 1810 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 324 "compiler_hw3.y" /* yacc.c:1646  */
    {
        if(strcmp((yyvsp[-1].var).name,"")==0) outputConst((yyvsp[-1].var));
        outputPrint((yyvsp[-1].var));
        variable tmp=initVariable("","I","10");
        (yyval.var)=tmp;
    }
#line 1821 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 330 "compiler_hw3.y" /* yacc.c:1646  */
    {
        variable tmp=initVariable("","I","10");
        (yyval.var)=tmp;
    }
#line 1830 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 334 "compiler_hw3.y" /* yacc.c:1646  */
    {
        printf("%s",(yyvsp[-2].string));
        int i=find_scope((yyvsp[-2].string));
        fprintf(fp,"invokestatic compiler_hw3/%s()%s\n",scopes[i].name,scopes[i].type);
        variable tmp=initVariable("","I","10");
        (yyval.var)=tmp;
    }
#line 1842 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 343 "compiler_hw3.y" /* yacc.c:1646  */
    {

    }
#line 1850 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 346 "compiler_hw3.y" /* yacc.c:1646  */
    {
        
    }
#line 1858 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 351 "compiler_hw3.y" /* yacc.c:1646  */
    { 
        char *temp=(char*)malloc(sizeof(char)*strlen(yytext)+1);
        strncpy(temp,yytext,strlen(yytext));
        variable tmp=initVariable("","I",temp);
        (yyval.var)=tmp;
        }
#line 1869 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 357 "compiler_hw3.y" /* yacc.c:1646  */
    {
        char *temp=(char*)malloc(sizeof(char)*strlen(yytext)+1);
        strncpy(temp,yytext,strlen(yytext));
        variable tmp=initVariable("","F",temp);
        (yyval.var)=tmp;
        }
#line 1880 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 363 "compiler_hw3.y" /* yacc.c:1646  */
    {
        variable tmp=initVariable("","Z","1");
        (yyval.var)=tmp;
        }
#line 1889 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 367 "compiler_hw3.y" /* yacc.c:1646  */
    {
        variable tmp=initVariable("","Z","0");
        (yyval.var)=tmp;
        }
#line 1898 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 371 "compiler_hw3.y" /* yacc.c:1646  */
    {
        variable tmp=initVariable("","S",(yyvsp[0].string));
        (yyval.var)=tmp;
        }
#line 1907 "y.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 375 "compiler_hw3.y" /* yacc.c:1646  */
    {
        int i=find_scope(currentScope.name);
        int index=find_variable((yyvsp[0].string),i);
        if(index==-1){
            index=find_variable((yyvsp[0].string),0);
            i=0;
        }
        variable tmp=variables[i][index];
        (yyval.var)=tmp;
        }
#line 1922 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 387 "compiler_hw3.y" /* yacc.c:1646  */
    {
        
    }
#line 1930 "y.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 390 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 1936 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 392 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 1942 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 395 "compiler_hw3.y" /* yacc.c:1646  */
    {

        add_scope((yyvsp[-1].string),(yyvsp[-2].string));
        currentScope.name=(yyvsp[-1].string);
        currentScope.type=(yyvsp[-2].string);
        variable tmp=initVariable((yyvsp[-1].string),(yyvsp[-2].string),"");
        (yyval.var)=tmp;
    }
#line 1955 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 405 "compiler_hw3.y" /* yacc.c:1646  */
    {

        (yyval.string)="";
        }
#line 1964 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 409 "compiler_hw3.y" /* yacc.c:1646  */
    {
        //speical case for main
        if(strcmp(currentScope.name,"main")==0){
            fprintf(fp,".method public static main([Ljava/lang/String;)V\n");
        }else{
            fprintf(fp,".method public static %s()%s\n",currentScope.name,currentScope.type);
        }
        fprintf(fp,".limit stack 50\n.limit locals 50\n");

        (yyval.string)="";
        }
#line 1980 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 422 "compiler_hw3.y" /* yacc.c:1646  */
    {
        //add item in parameter scope inside
        // printf("%s",currentScope.name);
        int index=find_scope(currentScope.name);
        variable tmp=initVariable((yyvsp[0].string),(yyvsp[-1].string),"");
        addParameter(tmp,index);
    }
#line 1992 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 429 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 1998 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 432 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 2004 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 435 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 2010 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 436 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 2016 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 437 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 2022 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 440 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 2028 "y.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 441 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 2034 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 444 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 2040 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 445 "compiler_hw3.y" /* yacc.c:1646  */
    { }
#line 2046 "y.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 448 "compiler_hw3.y" /* yacc.c:1646  */
    {}
#line 2052 "y.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 449 "compiler_hw3.y" /* yacc.c:1646  */
    {}
#line 2058 "y.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 461 "compiler_hw3.y" /* yacc.c:1646  */
    {(yyval.string) = "V"; }
#line 2064 "y.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 462 "compiler_hw3.y" /* yacc.c:1646  */
    {  (yyval.string) = "Z"; }
#line 2070 "y.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 463 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.string) = "F"; }
#line 2076 "y.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 464 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.string) = "I"; }
#line 2082 "y.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 465 "compiler_hw3.y" /* yacc.c:1646  */
    { (yyval.string) = "S"; }
#line 2088 "y.tab.c" /* yacc.c:1646  */
    break;


#line 2092 "y.tab.c" /* yacc.c:1646  */
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
#line 467 "compiler_hw3.y" /* yacc.c:1906  */




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
