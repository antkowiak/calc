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
%token  SINE COSINE TANGENT
%token  ARCSINE ARCCOSINE ARCTANGENT
%token  LOGARITHM NATLOGARITHM EXPFUNC
%token  SQUAREROOT ABSOLUTEVALUE
%token  MORTGAGE
%token  PMT_FUNC
%token  END

%left   PLUS MINUS
%left   TIMES DIVIDE
%left   PI_VAL
%left   SINE COSINE TANGENT
%left   ARCSINE ARCCOSINE ARCTANGENT
%left   LOGARITHM NATLOGARITHM EXPFUNC
%left   SQUAREROOT ABSOLUTEVALUE
%left   MORTGAGE
%left   PMT_FUNC
%left   NEG
%right  POWER

%start Input
%%

Input:
        | Input Line
        ;

Line:
          END
        | Expression END    { printf("%f\n", $1); }
        ;

Expression:
          NUMBER                          { $$=$1; }
        | PI_VAL                          { $$=3.141592654; }
        | NUMBER PI_VAL                   { $$=3.141592654*$1; }
        | Expression PLUS   Expression    { $$=$1+$3; }
        | Expression MINUS  Expression    { $$=$1-$3; }
        | Expression TIMES  Expression    { $$=$1*$3; }
        | Expression DIVIDE Expression    { $$=$1/$3; }
        | SINE LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sin($3); }
        | COSINE LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=cos($3); }
        | TANGENT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tan($3); }
        | ARCSINE LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=asin($3); }
        | ARCCOSINE LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=acos($3); }
        | ARCTANGENT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=atan($3); }
        | LOGARITHM LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log10($3); }
        | NATLOGARITHM LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log($3); }
        | EXPFUNC LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=exp($3); }
        | SQUAREROOT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sqrt($3); }
        | ABSOLUTEVALUE LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=fabs($3); }
        | MORTGAGE LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_mortgage($3, $5, $7); }
        | PMT_FUNC LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_pmt($3, $5, $7, 0.0, 0.0); }
        | PMT_FUNC LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_pmt($3, $5, $7, $9, 0.0); }
        | PMT_FUNC LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=calculate_pmt($3, $5, $7, $9, $11); }
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

        strcpy(exp, argv[1]);

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

TNumber calculate_mortgage(TNumber principal, TNumber interest_rate, TNumber num_years)
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


