%{

#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>


%}

%token  NUMBER
%token  PLUS MINUS TIMES DIVIDE POWER
%token  COMMA
%token  LEFT_PARENTHESIS RIGHT_PARENTHESIS
%token  PI_VAL
%token  FUNC_SIN FUNC_COS FUNC_TAN
%token  FUNC_ASIN FUNC_ACOS FUNC_ATAN FUNC_ATAN2
%token  FUNC_SINH FUNC_COSH FUNC_TANH FUNC_ASINH FUNC_ACOSH FUNC_ATANH
%token  FUNC_LOG10 FUNC_LOG1P FUNC_LOG2 FUNC_LOG FUNC_LN FUNC_EXP FUNC_EXP2
%token  FUNC_SQRT FUNC_CBRT FUNC_ABS
%token  FUNC_CEIL FUNC_FLOOR FUNC_ROUND FUNC_HYPOT FUNC_POW
%token  FUNC_TGAMMA FUNC_LGAMMA
%token  FUNC_TRUNC FUNC_NEARBYINT FUNC_FMOD FUNC_REMAINDER FUNC_NEXTAFTER
%token  FUNC_NEXTTOWARD FUNC_FDIM FUNC_FMAX FUNC_FMIN FUNC_FMA
%token  FUNC_MORT FUNC_PMT FUNC_RAND FUNC_SRAND FUNC_TIME
%token  FUNC_EQ FUNC_NE FUNC_LT FUNC_LE FUNC_GT FUNC_GE
%token  FUNC_TRUE FUNC_FALSE FUNC_ZERO FUNC_ONE
%token  FUNC_NPR FUNC_NCR FUNC_DEG2RAD FUNC_RAD2DEG FUNC_GCD FUNC_LCM
%token  FUNC_EVEN FUNC_ODD FUNC_HELP FUNC_QUIT
%token  END

%left   PLUS MINUS
%left   TIMES DIVIDE
%left   PI_VAL
%left   FUNC_SIN FUNC_COS FUNC_TAN
%left   FUNC_ASIN FUNC_ACOS FUNC_ATAN FUNC_ATAN2
%left   FUNC_SINH FUNC_COSH FUNC_TANH FUNC_ASINH FUNC_ACOSH FUNC_ATANH
%left   FUNC_LOG10 FUNC_LOG1P FUNC_LOG2 FUNC_LOG FUNC_LN FUNC_EXP FUNC_EXP2
%left   FUNC_SQRT FUNC_CBRT FUNC_ABS
%left   FUNC_CEIL FUNC_FLOOR FUNC_ROUND FUNC_HYPOT FUNC_POW
%left   FUNC_TGAMMA FUNC_LGAMMA
%left   FUNC_TRUNC FUNC_NEARBYINT FUNC_FMOD FUNC_REMAINDER FUNC_NEXTAFTER
%left   FUNC_NEXTTOWARD FUNC_FDIM FUNC_FMAX FUNC_FMIN FUNC_FMA
%left   FUNC_MORT FUNC_PMT FUNC_RAND FUNC_SRAND FUNC_TIME
%left   FUNC_EQ FUNC_NE FUNC_LT FUNC_LE FUNC_GT FUNC_GE
%left   FUNC_TRUE FUNC_FALSE FUNC_ZERO FUNC_ONE
%left   FUNC_NPR FUNC_NCR FUNC_DEG2RAD FUNC_RAD2DEG FUNC_GCD FUNC_LCM
%left   FUNC_EVEN FUNC_ODD FUNC_HELP FUNC_QUIT
%left   NEG
%right  POWER

%start Input
%%

Input:
        | Input Line
        ;

Line:
          END
        | Expression    END { printf("%f\n", $1); }
        ;

Expression:
          NUMBER                          { $$=$1; }
        | PI_VAL                          { $$=3.141592654; }
        | NUMBER PI_VAL                   { $$=3.141592654*$1; }
        | Expression PLUS   Expression    { $$=$1+$3; }
        | Expression MINUS  Expression    { $$=$1-$3; }
        | Expression TIMES  Expression    { $$=$1*$3; }
        | Expression DIVIDE Expression    { $$=$1/$3; }
        | FUNC_SIN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sinl($3); }
        | FUNC_COS LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=cosl($3); }
        | FUNC_TAN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tanl($3); }
        | FUNC_ASIN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=asinl($3); }
        | FUNC_ACOS LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=acosl($3); }
        | FUNC_ATAN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=atanl($3); }
        | FUNC_ATAN2 LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=atan2l($3, $5); }
        | FUNC_SINH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sinhl($3); }
        | FUNC_COSH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=coshl($3); }
        | FUNC_TANH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tanhl($3); }
        | FUNC_ASINH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=asinhl($3); }
        | FUNC_ACOSH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=acoshl($3); }
        | FUNC_ATANH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=atanhl($3); }
        | FUNC_LOG10 LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log10l($3); }
        | FUNC_LOG2 LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log2l($3); }
        | FUNC_LOG1P LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log1pl($3); }
        | FUNC_LOG LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=logl($3); }
        | FUNC_LN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=logl($3); }
        | FUNC_EXP LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=expl($3); }
        | FUNC_EXP2 LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=exp2l($3); }
        | FUNC_SQRT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sqrtl($3); }
        | FUNC_CBRT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=cbrtl($3); }
        | FUNC_ABS LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=fabsl($3); }
        | FUNC_FLOOR LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=floorl($3); }
        | FUNC_CEIL LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=ceill($3); }
        | FUNC_ROUND LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=roundl($3); }
        | FUNC_HYPOT LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=hypotl($3, $5); }
        | FUNC_POW LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=powl($3, $5); }
        | FUNC_TGAMMA LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tgammal($3); }
        | FUNC_LGAMMA LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=lgammal($3); }
        | FUNC_TRUNC LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=truncl($3); }
        | FUNC_NEARBYINT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=nearbyintl($3); }
        | FUNC_FMOD LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fmodl($3, $5); }
        | FUNC_REMAINDER LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=remainderl($3, $5); }
        | FUNC_NEXTAFTER LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=nextafterl($3, $5); }
        | FUNC_NEXTTOWARD LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=nexttowardl($3, $5); }
        | FUNC_FDIM LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fdiml($3, $5); }
        | FUNC_FMAX LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fmaxl($3, $5); }
        | FUNC_FMIN LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fminl($3, $5); }
        | FUNC_FMA LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=fmal($3, $5, $7); }
        | FUNC_HELP LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$ = calculate_help(); }
        | FUNC_QUIT LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$ = calculate_quit(); }
        | FUNC_MORT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_mort($3, $5, $7); }
        | FUNC_PMT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_pmt($3, $5, $7, 0.0, 0.0); }
        | FUNC_PMT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_pmt($3, $5, $7, $9, 0.0); }
        | FUNC_PMT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_pmt($3, $5, $7, $9, $11); }
        | FUNC_RAND LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=calculate_rand(0); }
        | FUNC_RAND LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=calculate_rand($3); }
        | FUNC_SRAND LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=calculate_srand($3); }
        | FUNC_TIME LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=calculate_time(); }
        | FUNC_NPR LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_npr($3, $5); }
        | FUNC_NCR LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_ncr($3, $5); }
        | FUNC_DEG2RAD LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=calculate_deg2rad($3); }
        | FUNC_RAD2DEG LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=calculate_rad2deg($3); }
        | FUNC_GCD LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_gcd($3, $5); }
        | FUNC_LCM LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_lcm($3, $5); }
        | FUNC_EVEN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=calculate_even($3); }
        | FUNC_ODD LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=calculate_odd($3); }
        | FUNC_EQ LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_eq($3, $5); }
        | FUNC_NE LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_ne($3, $5); }
        | FUNC_LT LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_lt($3, $5); }
        | FUNC_LE LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_le($3, $5); }
        | FUNC_GT LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_gt($3, $5); }
        | FUNC_GE LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_ge($3, $5); }
        | FUNC_TRUE LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=1.0; }
        | FUNC_FALSE LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=0.0; }
        | FUNC_ZERO LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=0.0; }
        | FUNC_ONE LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=1.0; }
        | MINUS Expression %prec NEG      { $$=-$2; }
        | Expression POWER Expression     { $$=powl($1,$3); }
        | LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=$2; }
        ;

%%

int yyerror(char *s)
{
    printf("\nerror: '%s'\n",s);
}

int main(int argc, char *argv[])
{
    srand(time(NULL));

    if (argc > 1)
    {
        char exp[512];

        strncpy(exp, argv[1], 512);

        int i = 2;

        for (i = 2 ; i < argc ; ++i)
        {
            strcat(exp, argv[i]);
        }

        strcat(exp, "\n\0");
        yy_scan_string(exp);
    }

    yyparse();
}

void print_error(const char *msg)
{
    printf("\nerror: %s\n",msg);
}

TNumber calculate_help()
{
    printf("Available functions: \n");
    // TODO

    return 0.0;
}

TNumber calculate_quit()
{
    printf("Goodbye\n");
    exit(EXIT_SUCCESS);
    return 0.0;
}

TNumber calculate_factorial(TNumber n)
{
    long long returnVal = 1;
    long long end = (long long) n;
    long long i = 1;

    for (i = 1 ; i <= end ; ++i)
    {
        returnVal = returnVal * i;
    }

    return (returnVal);
}

TNumber calculate_mort(TNumber principal, TNumber interest_rate, TNumber num_years)
{
    TNumber monthlyInterest = interest_rate / 12.0;
    int months = num_years * 12.0;
    TNumber monthlyPayment = principal * ( monthlyInterest /
        ( 1.0 - powl((1.0 + monthlyInterest), (0.0 - months)) ) );

    return monthlyPayment;
}

TNumber calculate_pmt(TNumber r, TNumber nper, TNumber pv, TNumber fv, TNumber type)
{
    TNumber q = powl(1.0+r, nper);
    return(r * (fv + (q * pv))) / ((-1.0 + q) * (1.0 + r * (type)));
}


TNumber calculate_rand(TNumber a)
{
    if (a == 0.0)
        return rand();

    return rand() % ((long long)a);
}

TNumber calculate_srand(TNumber a)
{
    srand((unsigned)a);
    return 1.0;
}

TNumber calculate_time()
{
    return (TNumber) time(NULL);
}

TNumber calculate_npr(TNumber n, TNumber r)
{
    unsigned long long ni = (unsigned long long) n;
    unsigned long long ri = (unsigned long long) r;

    if (ri > ni)
        return calculate_factorial(ni);

    unsigned long long total = 1;

    unsigned long long i = ni;
    for ( ; i > (ni - ri) ; --i)
    {
        total *= i;
    }

    return ((TNumber) total);
}

TNumber calculate_ncr(TNumber n, TNumber r)
{
    unsigned long long ni = (unsigned long long) n;
    unsigned long long ri = (unsigned long long) r;

    return ( (TNumber) (calculate_npr(ni, ri) / calculate_factorial(ri) ) );
}

TNumber calculate_deg2rad(TNumber deg)
{
    return ((deg * 3.141592654) / 180.0);
}

TNumber calculate_rad2deg(TNumber rad)
{
    return ((rad * 180.0) / 3.141592654);
}

TNumber calculate_gcd(TNumber a, TNumber b)
{
    long long imin = (long long) fminl(fabsl(a),fabsl(b));
    long long imax = (long long) fmaxl(fabsl(a),fabsl(b));

    if (imin==0 || imax==0)
        return 0.0;

    unsigned long long d = imin;
    for ( ; d >= 1 ; --d)
    {
        if ( (imin % d == 0) && (imax % d == 0) )
        {
            return ( (TNumber) d);
        }
    }

    return 1.0;
}

TNumber calculate_lcm(TNumber a, TNumber b)
{
    long long ai = (long long) a;
    long long bi = (long long) b;

    if (ai==0 || bi==0)
        return 0.0;

    long long multiple = ai;

    while (multiple >= ai)
    {
        if (multiple % bi == 0)
            return ((TNumber)multiple);

        multiple += ai;
    }

    return 0.0;
}

TNumber calculate_even(TNumber n)
{
    long long val = (long long) n;
    if (val % 2 == 0)
        return 1.0;
    return 0.0;
}

TNumber calculate_odd(TNumber n)
{
    long long val = (long long) n;
    if (val % 2 == 1)
        return 1.0;
    return 0.0;
}


TNumber calculate_eq(TNumber a, TNumber b)
{
    if (a == b)
        return 1.0;
    return 0.0;
}

TNumber calculate_ne(TNumber a, TNumber b)
{
    if (a != b)
        return 1.0;
    return 0.0;
}

TNumber calculate_lt(TNumber a, TNumber b)
{
    if (a < b)
        return 1.0;
    return 0.0;
}

TNumber calculate_le(TNumber a, TNumber b)
{
    if (a <= b)
        return 1.0;
    return 0.0;
}

TNumber calculate_gt(TNumber a, TNumber b)
{
    if (a > b)
        return 1.0;
    return 0.0;
}

TNumber calculate_ge(TNumber a, TNumber b)
{
    if (a >= b)
        return 1.0;
    return 0.0;
}

