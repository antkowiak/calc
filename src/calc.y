%{

#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


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
%token  FUNC_MORT FUNC_PMT
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
%left   FUNC_MORT FUNC_PMT
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
        | FUNC_SIN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sin($3); }
        | FUNC_COS LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=cos($3); }
        | FUNC_TAN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tan($3); }
        | FUNC_ASIN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=asin($3); }
        | FUNC_ACOS LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=acos($3); }
        | FUNC_ATAN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=atan($3); }
        | FUNC_ATAN2 LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=atan2($3, $5); }
        | FUNC_SINH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sinh($3); }
        | FUNC_COSH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=cosh($3); }
        | FUNC_TANH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tanh($3); }
        | FUNC_ASINH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=asinh($3); }
        | FUNC_ACOSH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=acosh($3); }
        | FUNC_ATANH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=atanh($3); }
        | FUNC_LOG10 LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log10($3); }
        | FUNC_LOG2 LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log2($3); }
        | FUNC_LOG1P LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log1p($3); }
        | FUNC_LOG LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log($3); }
        | FUNC_LN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log($3); }
        | FUNC_EXP LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=exp($3); }
        | FUNC_EXP2 LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=exp2($3); }
        | FUNC_SQRT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sqrt($3); }
        | FUNC_CBRT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=cbrt($3); }
        | FUNC_ABS LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=fabs($3); }
        | FUNC_FLOOR LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=floor($3); }
        | FUNC_CEIL LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=ceil($3); }
        | FUNC_ROUND LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=round($3); }
        | FUNC_HYPOT LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=hypot($3, $5); }
        | FUNC_POW LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=pow($3, $5); }
        | FUNC_TGAMMA LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tgamma($3); }
        | FUNC_LGAMMA LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=lgamma($3); }
        | FUNC_TRUNC LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=trunc($3); }
        | FUNC_NEARBYINT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=nearbyint($3); }
        | FUNC_FMOD LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fmod($3, $5); }
        | FUNC_REMAINDER LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=remainder($3, $5); }
        | FUNC_NEXTAFTER LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=nextafter($3, $5); }
        | FUNC_NEXTTOWARD LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=nexttoward($3, $5); }
        | FUNC_FDIM LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fdim($3, $5); }
        | FUNC_FMAX LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fmax($3, $5); }
        | FUNC_FMIN LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fmin($3, $5); }
        | FUNC_FMA LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=fma($3, $5, $7); }
        | FUNC_MORT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_mort($3, $5, $7); }
        | FUNC_PMT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_pmt($3, $5, $7, 0.0, 0.0); }
        | FUNC_PMT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_pmt($3, $5, $7, $9, 0.0); }
        | FUNC_PMT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_pmt($3, $5, $7, $9, $11); }
        | MINUS Expression %prec NEG      { $$=-$2; }
        | Expression POWER Expression     { $$=pow($1,$3); }
        | LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=$2; }
        ;

%%

int yyerror(char *s)
{
    printf("\nerror: '%s'\n",s);
}

int main(int argc, char *argv[])
{
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

TNumber calculate_mort(TNumber principal, TNumber interest_rate, TNumber num_years)
{
    TNumber monthlyInterest = interest_rate / 12.0;
    int months = num_years * 12.0;
    TNumber monthlyPayment = principal * ( monthlyInterest /
        ( 1.0 - pow((1.0 + monthlyInterest), (0.0 - months)) ) );

    return monthlyPayment;
}

TNumber calculate_pmt(TNumber r, TNumber nper, TNumber pv, TNumber fv, TNumber type)
{
    TNumber q = pow(1.0+r, nper);
    return(r * (fv + (q * pv))) / ((-1.0 + q) * (1.0 + r * (type)));
}


