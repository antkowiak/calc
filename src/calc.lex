%{
#include "global.h"
#include "calc.h"

#include <stdlib.h>

%}

white           [ \t]+

digit           [0-9]
integer         {digit}+
exponant        [eE][+-]{integer}

real            {integer}("."{integer})?{exponant}?
pointreal       ("."{integer}){exponant}?

pi              [Pp][Ii]
sine            [Ss][Ii][Nn]
cosine          [Cc][Oo][Ss]
tangent         [Tt][Aa][Nn]
arcsine         [Aa][Ss][Ii][Nn]
arccosine       [Aa][Cc][Oo][Ss]
arctangent      [Aa][Tt][Aa][Nn]
logarithm       [Ll][Oo][Gg]
natlogarithm    [Ll][Nn]
expfunc         [Ee][Xx][Pp]
squareroot      [Ss][Qq][Rr][Tt]
absolutevalue   [Aa][Bb][Ss]

mortgage        [Mm][Oo][Rr][Tt]
pmtfunc         [Pp][Mm][Tt]

factorial       {integer}!

%%

{white}         {}

{real}          {
                    yylval=atof(yytext);
                    return(NUMBER);
                }

{pointreal}     {
                    yylval=atof(yytext);
                    return(NUMBER);
                }

{factorial}     {
                    yylval=1;
                    unsigned int end = abs(atoi(yytext));
                    int i=1;
                    for (i=1 ; i<=end ; ++i)
                    {
                        yylval = yylval * i;
                    }
                    return(NUMBER);
                }


{pi}            return(PI_VAL);
{sine}          return(SINE);
{cosine}        return(COSINE);
{tangent}       return(TANGENT);
{arcsine}       return(ARCSINE);
{arccosine}     return(ARCCOSINE);
{arctangent}    return(ARCTANGENT);

{logarithm}     return(LOGARITHM);
{natlogarithm}  return(NATLOGARITHM);
{expfunc}       return(EXPFUNC);
{squareroot}    return(SQUAREROOT);
{absolutevalue} return(ABSOLUTEVALUE);

{mortgage}      return(MORTGAGE);
{pmtfunc}       return(PMT_FUNC);

"+"             return(PLUS);
"-"             return(MINUS);

"*"             return(TIMES);
"/"             return(DIVIDE);

"^"             return(POWER);

"("             return(LEFT_PARENTHESIS);
")"             return(RIGHT_PARENTHESIS);

","             return(COMMA);

"\n"            return(END);

