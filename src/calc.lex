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

func_sin        [Ss][Ii][Nn][lf]?
func_cos        [Cc][Oo][Ss][lf]?
func_tan        [Tt][Aa][Nn][lf]?
func_asin       [Aa][Ss][Ii][Nn][lf]?
func_acos       [Aa][Cc][Oo][Ss][lf]?
func_atan       [Aa][Tt][Aa][Nn][lf]?
func_atan2      [Aa][Tt][Aa][Nn]2[lf]?
func_sinh       [Ss][Ii][Nn][Hh][lf]?
func_cosh       [Cc][Oo][Ss][Hh][lf]?
func_tanh       [Tt][Aa][Nn][Hh][lf]?
func_asinh      [Aa][Ss][Ii][Nn][Hh][lf]?
func_acosh      [As][Cc][Oo][Ss][Hh][lf]?
func_atanh      [Aa][Tt][Aa][Nn][Hh][lf]?
func_log10      [Ll][Oo][Gg]10[lf]?
func_log2       [Ll][Oo][Gg]2[lf]?
func_log1p      [Ll][Oo][Gg]1[Pp][lf]?
func_log        [Ll][Oo][Gg][lf]?
func_ln         [Ll][Nn]
func_exp        [Ee][Xx][Pp][lf]?
func_exp2       [Ee][Xx][Pp]2[lf]?
func_sqrt       [Ss][Qq][Rr][Tt][lf]?
func_cbrt       [Cc][Bb][Rr][Tt][lf]?
func_abs        [f]?[Aa][Bb][Ss][lf]?
func_floor      [Ff][Ll][Oo][Oo][Rr][lf]?
func_ceil       [Cc][Ee][Ii][Ll][lf]?
func_round      [Rr][Oo][Uu][Nn][Dd][lf]?
func_hypot      [Hh][Yy][Pp][Oo][Tt][lf]?
func_pow        [Pp][Oo][Ww][lf]?
func_tgamma     [Tt]?[Gg][Aa][Mm][Mm][Aa][lf]?
func_lgamma     [Ll][Gg][Aa][Mm][Mm][Aa][lf]?
func_trunc      [Tt][Rr][Uu][Nn][Cc][lf]?
func_nearbyint  [Nn][Ee][Aa][Rr][Bb][Yy][Ii][Nn][Tt][lf]?
func_fmod       [Ff][Mm][Oo][Dd][lf]?
func_remainder  [Rr][Ee][Mm][Aa][Ii][Nn][Dd][Ee][Rr][lf]?
func_nextafter  [Nn][Ee][Xx][Tt][Aa][Ff][Tt][Ee][Rr][lf]?
func_nexttoward [Nn][Ee][Xx][Tt][Tt][Oo][Ww][Aa][Rr][Dd][lf]?
func_fdim       [Ff][Dd][Ii][Mm][lf]?
func_fmax       [Ff]?[Mm][Aa][Xx][lf]?
func_fmin       [Ff]?[Mm][Ii][Nn][lf]?
func_fma        [Ff][Mm][Aa][lf]?

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


{pi}                return(PI_VAL);

{func_sin}          return(FUNC_SIN);
{func_cos}          return(FUNC_COS);
{func_tan}          return(FUNC_TAN);
{func_asin}         return(FUNC_ASIN);
{func_acos}         return(FUNC_ACOS);
{func_atan}         return(FUNC_ATAN);
{func_atan2}        return(FUNC_ATAN2);
{func_sinh}         return(FUNC_SINH);
{func_cosh}         return(FUNC_COSH);
{func_tanh}         return(FUNC_TANH);
{func_asinh}        return(FUNC_ASINH);
{func_acosh}        return(FUNC_ACOSH);
{func_atanh}        return(FUNC_ATANH);
{func_log10}        return(FUNC_LOG10);
{func_log2}         return(FUNC_LOG2);
{func_log1p}        return(FUNC_LOG1P);
{func_log}          return(FUNC_LOG);
{func_ln}           return(FUNC_LN);
{func_exp}          return(FUNC_EXP);
{func_exp2}         return(FUNC_EXP2);
{func_sqrt}         return(FUNC_SQRT);
{func_cbrt}         return(FUNC_CBRT);
{func_abs}          return(FUNC_ABS);
{func_floor}        return(FUNC_FLOOR);
{func_ceil}         return(FUNC_CEIL);
{func_round}        return(FUNC_ROUND);
{func_hypot}        return(FUNC_HYPOT);
{func_pow}          return(FUNC_POW);
{func_tgamma}       return(FUNC_TGAMMA);
{func_lgamma}       return(FUNC_LGAMMA);
{func_trunc}        return(FUNC_TRUNC);
{func_nearbyint}    return(FUNC_NEARBYINT);
{func_fmod}         return(FUNC_FMOD);
{func_remainder}    return(FUNC_REMAINDER);
{func_nextafter}    return(FUNC_NEXTAFTER);
{func_nexttoward}   return(FUNC_NEXTTOWARD);
{func_fdim}         return(FUNC_FDIM);
{func_fmax}         return(FUNC_FMAX);
{func_fmin}         return(FUNC_FMIN);
{func_fma}          return(FUNC_FMA);

{func_mort}         return(FUNC_MORT);
{func_pmt}          return(FUNC_PMT);

"+"                 return(PLUS);
"-"                 return(MINUS);

"*"                 return(TIMES);
"/"                 return(DIVIDE);

"^"                 return(POWER);

"("                 return(LEFT_PARENTHESIS);
")"                 return(RIGHT_PARENTHESIS);

","                 return(COMMA);

"\n"                return(END);

