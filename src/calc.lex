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

func_sin        [Ss][Ii][Nn]
func_cos        [Cc][Oo][Ss]
func_tan        [Tt][Aa][Nn]
func_asin       [Aa][Ss][Ii][Nn]
func_acos       [Aa][Cc][Oo][Ss]
func_atan       [Aa][Tt][Aa][Nn]
func_log        [Ll][Oo][Gg]
func_ln         [Ll][Nn]
func_exp        [Ee][Xx][Pp]
func_sqrt       [Ss][Qq][Rr][Tt]
func_abs        [Aa][Bb][Ss]
func_floor      [Ff][Ll][Oo][Oo][Rr]
func_ceil       [Cc][Ee][Ii][Ll]
func_round      [Rr][Oo][Uu][Nn][Dd]

func_mort       [Mm][Oo][Rr][Tt]
func_pmt        [Pp][Mm][Tt]

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

{func_sin}      return(FUNC_SIN);
{func_cos}      return(FUNC_COS);
{func_tan}      return(FUNC_TAN);
{func_asin}     return(FUNC_ASIN);
{func_acos}     return(FUNC_ACOS);
{func_atan}     return(FUNC_ATAN);
{func_log}      return(FUNC_LOG);
{func_ln}       return(FUNC_LN);
{func_exp}      return(FUNC_EXP);
{func_sqrt}     return(FUNC_SQRT);
{func_abs}      return(FUNC_ABS);
{func_floor}    return(FUNC_FLOOR);
{func_ceil}     return(FUNC_CEIL);
{func_round}    return(FUNC_ROUND);
{func_mort}     return(FUNC_MORT);
{func_pmt}      return(FUNC_PMT);

"+"             return(PLUS);
"-"             return(MINUS);

"*"             return(TIMES);
"/"             return(DIVIDE);

"^"             return(POWER);

"("             return(LEFT_PARENTHESIS);
")"             return(RIGHT_PARENTHESIS);

"{"             return(LEFT_BRACE);
"}"             return(RIGHT_BRACE);

","             return(COMMA);

"\n"            return(END);

