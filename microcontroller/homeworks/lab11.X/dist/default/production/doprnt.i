# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c" 2


# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\ctype.h" 1 3







# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\features.h" 1 3
# 8 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\ctype.h" 2 3


int isalnum(int);
int isalpha(int);
int isblank(int);
int iscntrl(int);
int isdigit(int);
int isgraph(int);
int islower(int);
int isprint(int);
int ispunct(int);
int isspace(int);
int isupper(int);
int isxdigit(int);
int tolower(int);
int toupper(int);
# 3 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c" 2

# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\math.h" 1 3



# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\musl_xc8.h" 1 3
# 4 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\math.h" 2 3






# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdint.h" 1 3
# 22 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 135 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uintptr_t;
# 150 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long intptr_t;
# 166 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;




typedef long int32_t;





typedef long long int64_t;
# 191 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 227 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 22 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdint.h" 2 3


typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;
typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;
typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 131 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/stdint.h" 1 3
typedef int32_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint32_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 131 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdint.h" 2 3
# 10 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\math.h" 2 3





# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 37 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef float float_t;




typedef double double_t;
# 15 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\math.h" 2 3
# 46 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\math.h" 3
int __fpclassifyf(float);
# 97 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\math.h" 3
int __signbitf(float);
# 149 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\math.h" 3
double acos(double);
float acosf(float);
long double acosl(long double);





double acosh(double);
float acoshf(float);
long double acoshl(long double);





double asin(double);
float asinf(float);
long double asinl(long double);





double asinh(double);
float asinhf(float);
long double asinhl(long double);





double atan(double);
float atanf(float);
long double atanl(long double);





double atan2(double, double);
float atan2f(float, float);
long double atan2l(long double, long double);





double atanh(double);
float atanhf(float);
long double atanhl(long double);





double cbrt(double);
float cbrtf(float);
long double cbrtl(long double);





double ceil(double);
float ceilf(float);
long double ceill(long double);





double copysign(double, double);
float copysignf(float, float);
long double copysignl(long double, long double);





double cos(double);
float cosf(float);
long double cosl(long double);





double cosh(double);
float coshf(float);
long double coshl(long double);





double erf(double);
float erff(float);
long double erfl(long double);





double erfc(double);
float erfcf(float);
long double erfcl(long double);





double exp(double);
float expf(float);
long double expl(long double);





double exp2(double);
float exp2f(float);
long double exp2l(long double);





double expm1(double);
float expm1f(float);
long double expm1l(long double);





double fabs(double);
float fabsf(float);
long double fabsl(long double);





double fdim(double, double);
float fdimf(float, float);
long double fdiml(long double, long double);





double floor(double);
float floorf(float);
long double floorl(long double);





double fma(double, double, double);
float fmaf(float, float, float);
long double fmal(long double, long double, long double);





double fmax(double, double);
float fmaxf(float, float);
long double fmaxl(long double, long double);





double fmin(double, double);
float fminf(float, float);
long double fminl(long double, long double);





double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);





double frexp(double, int *);
float frexpf(float, int *);
long double frexpl(long double, int *);





double hypot(double, double);
float hypotf(float, float);
long double hypotl(long double, long double);





int ilogb(double);
int ilogbf(float);
int ilogbl(long double);





double ldexp(double, int);
float ldexpf(float, int);
long double ldexpl(long double, int);





double lgamma(double);
float lgammaf(float);
long double lgammal(long double);





long long llrint(double);
long long llrintf(float);
long long llrintl(long double);





long long llround(double);
long long llroundf(float);
long long llroundl(long double);





double log(double);
float logf(float);
long double logl(long double);





double log10(double);
float log10f(float);
long double log10l(long double);





double log1p(double);
float log1pf(float);
long double log1pl(long double);





double log2(double);
float log2f(float);
long double log2l(long double);





double logb(double);
float logbf(float);
long double logbl(long double);





long lrint(double);
long lrintf(float);
long lrintl(long double);





long lround(double);
long lroundf(float);
long lroundl(long double);





double modf(double, double *);
float modff(float, float *);
long double modfl(long double, long double *);





double nan(const char *);
float nanf(const char *);
long double nanl(const char *);





double nearbyint(double);
float nearbyintf(float);
long double nearbyintl(long double);





double nextafter(double, double);
float nextafterf(float, float);
long double nextafterl(long double, long double);





double nexttoward(double, long double);
float nexttowardf(float, long double);
long double nexttowardl(long double, long double);
# 498 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\math.h" 3
double pow(double, double);
__attribute__((nonreentrant)) float powf(float, float);
long double powl(long double, long double);





double remainder(double, double);
float remainderf(float, float);
long double remainderl(long double, long double);





double remquo(double, double, int *);
float remquof(float, float, int *);
long double remquol(long double, long double, int *);





double rint(double);
float rintf(float);
long double rintl(long double);





double round(double);
float roundf(float);
long double roundl(long double);





double scalbln(double, long);
float scalblnf(float, long);
long double scalblnl(long double, long);





double scalbn(double, int);
float scalbnf(float, int);
long double scalbnl(long double, int);





double sin(double);
float sinf(float);
long double sinl(long double);





double sinh(double);
float sinhf(float);
long double sinhl(long double);





double sqrt(double);
float sqrtf(float);
long double sqrtl(long double);





double tan(double);
float tanf(float);
long double tanl(long double);





double tanh(double);
float tanhf(float);
long double tanhl(long double);





double tgamma(double);
float tgammaf(float);
long double tgammal(long double);





double trunc(double);
float truncf(float);
long double truncl(long double);
# 631 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\math.h" 3
extern int signgam;

double j0(double);
double j1(double);
double jn(int, double);

double y0(double);
double y1(double);
double yn(int, double);
# 4 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c" 2

# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdarg.h" 1 3







# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 10 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef void * va_list[1];
# 8 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdarg.h" 2 3


#pragma intrinsic(__va_start)
#pragma intrinsic(__va_arg)

extern void * __va_start(void);
extern void * __va_arg(void *, ...);
# 5 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c" 2

# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stddef.h" 1 3
# 19 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stddef.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 22 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long int wchar_t;
# 127 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned size_t;
# 140 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long ptrdiff_t;
# 19 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stddef.h" 2 3
# 6 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c" 2


# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdio.h" 1 3
# 24 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdio.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 15 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef void * __isoc_va_list[1];
# 145 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long ssize_t;
# 244 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long off_t;
# 397 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef struct _IO_FILE FILE;
# 24 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdio.h" 2 3
# 52 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdio.h" 3
typedef union _G_fpos64_t {
 char __opaque[16];
 double __align;
} fpos_t;

extern FILE *const stdin;
extern FILE *const stdout;
extern FILE *const stderr;





FILE *fopen(const char *restrict, const char *restrict);
FILE *freopen(const char *restrict, const char *restrict, FILE *restrict);
int fclose(FILE *);

int remove(const char *);
int rename(const char *, const char *);

int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
void clearerr(FILE *);

int fseek(FILE *, long, int);
long ftell(FILE *);
void rewind(FILE *);

int fgetpos(FILE *restrict, fpos_t *restrict);
int fsetpos(FILE *, const fpos_t *);

size_t fread(void *restrict, size_t, size_t, FILE *restrict);
size_t fwrite(const void *restrict, size_t, size_t, FILE *restrict);

int fgetc(FILE *);
int getc(FILE *);
int getchar(void);
int ungetc(int, FILE *);

int fputc(int, FILE *);
int putc(int, FILE *);
int putchar(int);

char *fgets(char *restrict, int, FILE *restrict);

char *gets(char *);


int fputs(const char *restrict, FILE *restrict);
int puts(const char *);


#pragma printf_check(printf) const
#pragma printf_check(vprintf) const
#pragma printf_check(sprintf) const
#pragma printf_check(snprintf) const
#pragma printf_check(vsprintf) const
#pragma printf_check(vsnprintf) const


int printf(const char *restrict, ...);
int fprintf(FILE *restrict, const char *restrict, ...);
int sprintf(char *restrict, const char *restrict, ...);
int snprintf(char *restrict, size_t, const char *restrict, ...);

int vprintf(const char *restrict, __isoc_va_list);
int vfprintf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsprintf(char *restrict, const char *restrict, __isoc_va_list);
int vsnprintf(char *restrict, size_t, const char *restrict, __isoc_va_list);

int scanf(const char *restrict, ...);
int fscanf(FILE *restrict, const char *restrict, ...);
int sscanf(const char *restrict, const char *restrict, ...);
int vscanf(const char *restrict, __isoc_va_list);
int vfscanf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsscanf(const char *restrict, const char *restrict, __isoc_va_list);

void perror(const char *);

int setvbuf(FILE *restrict, char *restrict, int, size_t);
void setbuf(FILE *restrict, char *restrict);

char *tmpnam(char *);
FILE *tmpfile(void);




FILE *fmemopen(void *restrict, size_t, const char *restrict);
FILE *open_memstream(char **, size_t *);
FILE *fdopen(int, const char *);
FILE *popen(const char *, const char *);
int pclose(FILE *);
int fileno(FILE *);
int fseeko(FILE *, off_t, int);
off_t ftello(FILE *);
int dprintf(int, const char *restrict, ...);
int vdprintf(int, const char *restrict, __isoc_va_list);
void flockfile(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);
ssize_t getdelim(char **restrict, size_t *restrict, int, FILE *restrict);
ssize_t getline(char **restrict, size_t *restrict, FILE *restrict);
int renameat(int, const char *, int, const char *);
char *ctermid(char *);







char *tempnam(const char *, const char *);
# 8 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c" 2

# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdlib.h" 1 3
# 21 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdlib.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 21 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdlib.h" 2 3


int atoi (const char *);
long atol (const char *);
long long atoll (const char *);
double atof (const char *);

float strtof (const char *restrict, char **restrict);
double strtod (const char *restrict, char **restrict);
long double strtold (const char *restrict, char **restrict);





long strtol (const char *restrict, char **restrict, int);
unsigned long strtoul (const char *restrict, char **restrict, int);
long long strtoll (const char *restrict, char **restrict, int);
unsigned long long strtoull (const char *restrict, char **restrict, int);

int rand (void);
void srand (unsigned);
# 52 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdlib.h" 3
          void abort (void);
int atexit (void (*) (void));
          void exit (int);
          void _Exit (int);
# 65 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdlib.h" 3
void *bsearch (const void *, const void *, size_t, size_t, int (*)(const void *, const void *));





__attribute__((nonreentrant)) void qsort (void *, size_t, size_t, int (*)(const void *, const void *));

int abs (int);
long labs (long);
long long llabs (long long);

typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;
typedef struct { long long quot, rem; } lldiv_t;

div_t div (int, int);
ldiv_t ldiv (long, long);
lldiv_t lldiv (long long, long long);


typedef struct { unsigned int quot, rem; } udiv_t;
typedef struct { unsigned long quot, rem; } uldiv_t;
udiv_t udiv (unsigned int, unsigned int);
uldiv_t uldiv (unsigned long, unsigned long);
# 104 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\stdlib.h" 3
size_t __ctype_get_mb_cur_max(void);
# 9 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c" 2

# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\string.h" 1 3
# 25 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\string.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 409 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\bits/alltypes.h" 3
typedef struct __locale_struct * locale_t;
# 25 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\string.h" 2 3


void *memcpy (void *restrict, const void *restrict, size_t);
void *memmove (void *, const void *, size_t);
void *memset (void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void *memchr (const void *, int, size_t);

char *strcpy (char *restrict, const char *restrict);
char *strncpy (char *restrict, const char *restrict, size_t);

char *strcat (char *restrict, const char *restrict);
char *strncat (char *restrict, const char *restrict, size_t);

int strcmp (const char *, const char *);
int strncmp (const char *, const char *, size_t);

int strcoll (const char *, const char *);
size_t strxfrm (char *restrict, const char *restrict, size_t);

char *strchr (const char *, int);
char *strrchr (const char *, int);

size_t strcspn (const char *, const char *);
size_t strspn (const char *, const char *);
char *strpbrk (const char *, const char *);
char *strstr (const char *, const char *);
char *strtok (char *restrict, const char *restrict);

size_t strlen (const char *);

char *strerror (int);
# 65 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\c99\\string.h" 3
char *strtok_r (char *restrict, const char *restrict, char **restrict);
int strerror_r (int, char *, size_t);
char *stpcpy(char *restrict, const char *restrict);
char *stpncpy(char *restrict, const char *restrict, size_t);
size_t strnlen (const char *, size_t);
char *strdup (const char *);
char *strndup (const char *, size_t);
char *strsignal(int);
char *strerror_l (int, locale_t);
int strcoll_l (const char *, const char *, locale_t);
size_t strxfrm_l (char *restrict, const char *restrict, size_t, locale_t);




void *memccpy (void *restrict, const void *restrict, int, size_t);
# 10 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c" 2

# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\include\\inline.h" 1 3
# 11 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c" 2
# 55 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c"
static int flags, prec, width;
# 66 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c"
static char dbuf[80];


static int nout;


static int pad(FILE *fp, char *buf, int p)
{
    int i, w;


    if (flags & (1 << 0)) {
        fputs((const char *)buf, fp);
    }


    w = (p < 0) ? 0 : p;
    i = 0;
    while (i < w) {
        fputc(' ', fp);
        ++i;
    }


    if (!(flags & (1 << 0))) {
        fputs((const char *)buf, fp);
    }

    return strlen(buf) + w;
}
# 319 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c"
static int efgtoa(FILE *fp, long double f, char c)
{
    char mode, nmode;
    int d, e, i, m, n, ne, p, pp, sign, t, w;
    long double g, h, l, ou, u;


    sign = 0;
    g = f;
    if (g < 0.0) {
        sign = 1;
        g = -g;
    }


    n = 0;
    w = width;
    if (sign || (flags & (1 << 2))) {
        dbuf[n] = sign ? '-' : '+';
        ++n;
        --w;
    }


    if (( __fpclassifyf(g) == 1 )) {
        if ((0 ? isupper((int)c) : ((unsigned)((int)c)-'A') < 26)) {
            strcpy(&dbuf[n], "INF");
        } else {
            strcpy(&dbuf[n], "inf");
        }
        w -= ((sizeof("inf")/sizeof("inf"[0]))-1);
        return pad(fp, &dbuf[0], w);
    }
    if (( __fpclassifyf(g) == 0 )) {
        if ((0 ? isupper((int)c) : ((unsigned)((int)c)-'A') < 26)) {
            strcpy(&dbuf[n], "NAN");
        } else {
            strcpy(&dbuf[n], "nan");
        }
        w -= ((sizeof("inf")/sizeof("inf"[0]))-1);
        return pad(fp, &dbuf[0], w);
    }


    u = 1.0;
    e = 0;
    if (!(g == 0.0)) {
        while (!(g < (u*10.0))) {
            u = u*10.0;
            ++e;
        }
        while (g < u) {
            u = u/10.0;
            --e;
        }
    }


    mode = tolower((int)c);
    nmode = mode;
    if (mode == 'g') {
  if (prec == 0) {
   prec = 1;
  }
        p = (0 < prec) ? prec : 6;
    } else {
        p = (prec < 0) ? 6 : prec;
    }


    if (mode == 'g') {
        if (!(e < -4) && !((p - 1) < e)) {
            nmode = 'f';
        } else {
            nmode = 'e';
        }
    }


    m = p;
    if (!(mode == 'g') || ((nmode == 'f') && (e < 0))) {
        ++m;
    }


    if (nmode == 'f') {
        if (e < 0) {
            u = 1.0;
            e = 0;
        }
        if (!(mode == 'g')) {
            m += e;
        }
    }


    i = 0;
    h = g;
    ou = u;
    while (i < m) {
        l = floorf(h/u);
        d = (int)l;
        h -= l*u;
        u = u/10.0;
        ++i;
    }


    l = u*5.0;
    if (h < l) {
        l = 0.0;
    } else {

        if ((h == l) && !(d % 2)) {
            l = 0.0;
        }
    }


    h = g + l;


    u = ou;
    ne = (nmode == 'e') ? 0 : e;
    pp = 0;
    t = 0;
    i = 0;
    while ((i < m) && (n < (80 - 5))) {
        l = floorf(h/u);
        d = (int)l;
        if (!(flags & (1 << 4)) && !d && (mode == 'g') && (ne < 0)) {
            ++t;
        } else {
            if (!pp && (ne < 0)) {
                dbuf[n++] = '.';
                --w;
                pp = 1;
            }
            while (t) {
                dbuf[n++] = '0';
                --w;
                --t;
            }
            dbuf[n++] = '0' + d;
            --w;
        }
        h -= l*u;
        u = u/10.0;
        --ne;
        ++i;
    }
    if (!pp && (flags & (1 << 4))) {
        dbuf[n++] = '.';
    }
    dbuf[n] = '\0';


    if (nmode == 'e') {
        i = sizeof(dbuf) - 1;
        dbuf[i] = '\0';
        sign = 0;
        if (e < 0) {
            sign = 1;
            e = -e;
        }
        p = 2;
        while (e || (0 < p)) {
            --i;
            dbuf[i] = '0' + (e % 10);
            e = e / 10;
            --p;
            --w;
        }
        --i;
        dbuf[i] = sign ? '-' : '+';
        --w;
        --i;
        dbuf[i] = (0 ? isupper((int)c) : ((unsigned)((int)c)-'A') < 26) ? 'E' : 'e';
        --w;
        strcpy(&dbuf[n], &dbuf[i]);
    }


    return pad(fp, &dbuf[0], w);
}
# 670 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c"
static int vfpfcnvrt(FILE *fp, char *fmt[], va_list ap)
{
    char c, *cp, ct[3];
    int done, i;
    long long ll;
    unsigned long long llu;
    long double f;
    void *vp;


    if ((*fmt)[0] == '%') {
        ++*fmt;

        flags = width = 0;
        prec = -1;
# 757 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c"
        ct[0] = tolower((int)(*fmt)[0]);
        if (ct[0]) {
            ct[1] = tolower((int)(*fmt)[1]);
            if (ct[1]) {
                ct[2] = tolower((int)(*fmt)[2]);
            }
        }
# 920 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c"
        if (ct[0] == 'f') {

            c = (*fmt)[0];
            ++*fmt;
            f = (long double)(*(double *)__va_arg(*(double **)ap, (double)0));

            return efgtoa(fp, f, c);
        }
        if (!strncmp(ct, "lf", ((sizeof("lf")/sizeof("lf"[0]))-1))) {

            c = (*fmt)[1];
            if ((0 ? isupper((int)(*fmt)[0]) : ((unsigned)((int)(*fmt)[0])-'A') < 26)) {
                f = (*(long double *)__va_arg(*(long double **)ap, (long double)0));
            } else {
                f = (long double)(*(double *)__va_arg(*(double **)ap, (double)0));
            }
            *fmt += ((sizeof("lf")/sizeof("lf"[0]))-1);

            return efgtoa(fp, f, c);
        }
# 1350 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.00\\pic\\sources\\c99\\common\\doprnt.c"
        if ((*fmt)[0] == '%') {
            ++*fmt;
            fputc((int)'%', fp);
            return 1;
        }


        ++*fmt;
        return 0;
    }


    fputc((int)(*fmt)[0], fp);
    ++*fmt;
    return 1;
}


int vfprintf(FILE *fp, const char *fmt, va_list ap)
{

    char *cfmt;

    cfmt = (char *)fmt;
    nout = 0;
    while (*cfmt) {
        nout += vfpfcnvrt(fp, &cfmt, ap);
    }
    return nout;



}
