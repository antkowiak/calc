%{

#include "global.h"
#include "calc.tab.h"

%}

white           [ \t]+
digit           [0-9]
integer         {digit}+
exponant        [eE][+-]?{integer}
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

func_help       [Hh][Ee][Ll][Pp]
func_quit       ([Ee][Xx][Ii][Tt])|([Qq][Uu][Ii][Tt])|([Qq])
func_mort       ([Mm][Oo][Rr][Tt][Gg][Aa][Gg][Ee])|([Mm][Oo][Rr][Tt])
func_pmt        [Pp][Mm][Tt]
func_ytm        [Yy][Tt][Mm]
func_rand       ([Rr][Aa][Nn][Dd][Oo][Mm])|([Rr][Aa][Nn][Dd])
func_srand      [Ss][Rr][Aa][Nn][Dd]
func_time       [Tt][Ii][Mm][Ee]
func_npr        [Nn][Pp][Rr]
func_ncr        [Nn][Cc][Rr]
func_deg2rad    [Dd][Ee][Gg]2[Rr][Aa][Dd]
func_rad2deg    [Rr][Aa][Dd]2[Dd][Ee][Gg]
func_gcd        [Gg][Cc][Dd]
func_lcm        [Ll][Cc][Mm]
func_even       [Ee][Vv][Ee][Nn]
func_odd        [Oo][Dd][Dd]

func_eq         ([Ee][Qq][Uu][Aa][Ll][Ss])|([Ee][Qq][Uu][Aa][Ll])|([Ee][Qq])
func_ne         ([Nn][Oo][Tt][Ee][Qq][Uu][Aa][Ll][Ss])|([Nn][Oo][Tt][Ee][Qq][Uu][Aa][Ll])|([Nn][Ee])
func_lt         ([Ll][Ee][Ss][Ss][Tt][Hh][Aa][Nn])|([Ll][Tt])
func_le         ([Ll][Ee][Ss][Ss][Tt][Hh][Aa][Nn][Oo][Rr][Ee][Qq][Uu][Aa][Ll])|([Ll][Ee])
func_gt         ([Gg][Rr][Ee][Aa][Tt][Ee][Rr][Tt][Hh][Aa][Nn])|([Gg][Tt])
func_ge         ([Gg][Rr][Ee][Aa][Tt][Ee][Rr][Tt][Hh][Aa][Nn][Oo][Rr][Ee][Qq][Uu][Aa][Ll])|([Gg][Ee])
func_true       [Tt][Rr][Uu][Ee]
func_false      [Ff][Aa][Ll][Ss][Ee]
func_zero       [Zz][Ee][Rr][Oo]
func_one        [Oo][Nn][Ee]

func_f2c        [Ff]2[Cc]
func_c2f        [Cc]2[Ff]

factorial       {integer}!
percentage      ({pointreal}|{real})\%

p_metric        ({pointreal}|{real})[Pp]
n_metric        ({pointreal}|{real})[Nn]
u_metric        ({pointreal}|{real})[Uu]
m_metric        ({pointreal}|{real})m
k_metric        ({pointreal}|{real})[Kk]
M_metric        ({pointreal}|{real})M
g_metric        ({pointreal}|{real})[Gg]
t_metric        ({pointreal}|{real})[Tt]

%%

{white}         {}

{real}          {
                    yylval=TNumber(yytext);
                    return(NUMBER);
                }

{pointreal}     {
                    yylval=TNumber(yytext);
                    return(NUMBER);
                }

{factorial}     {
                    std::string text(yytext);
                    auto pos = text.find("!");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval=TNumber(1);
                    TNumber end(text);
                    for (TNumber i(1) ; i <= end ; ++i)
                        yylval = yylval * i;
                    return(NUMBER);
                }



{percentage}    {
                    std::string text(yytext);
                    auto pos = text.find("%");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval = TNumber(text) / TNumber(100);
                    return(NUMBER);
                }

{p_metric}      {
                    std::string text(yytext);
                    auto pos = text.find("P");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    pos = text.find("p");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval = TNumber(text) / TNumber(1000) / TNumber(1000) / TNumber(1000) / TNumber(1000);
                    return(NUMBER);
                }

{n_metric}      {
                    std::string text(yytext);
                    auto pos = text.find("N");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    pos = text.find("n");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval = TNumber(text) / TNumber(1000) / TNumber(1000) / TNumber(1000);
                    return(NUMBER);
                }

{u_metric}      {
                    std::string text(yytext);
                    auto pos = text.find("U");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    pos = text.find("u");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval = TNumber(text) / TNumber(1000) / TNumber(1000);
                    return(NUMBER);
                }

{m_metric}      {
                    std::string text(yytext);
                    auto pos = text.find("m");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval = TNumber(text) / TNumber(1000);
                    return(NUMBER);
                }

{k_metric}      {
                    std::string text(yytext);
                    auto pos = text.find("K");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    pos = text.find("k");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval = TNumber(text) * TNumber(1000);
                    return(NUMBER);
                }

{M_metric}      {
                    std::string text(yytext);
                    auto pos = text.find("M");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval = TNumber(text) * TNumber(1000) * TNumber(1000);
                    return(NUMBER);
                }

{g_metric}      {
                    std::string text(yytext);
                    auto pos = text.find("G");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    pos = text.find("g");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval = TNumber(text) * TNumber(1000) * TNumber(1000) * TNumber(1000);
                    return(NUMBER);
                }

{t_metric}      {
                    std::string text(yytext);
                    auto pos = text.find("T");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    pos = text.find("t");
                    if (pos != std::string::npos)
                        text.erase(pos, 1);

                    yylval = TNumber(text) * TNumber(1000) * TNumber(1000) * TNumber(1000) * TNumber(1000);
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

{func_help}         return(FUNC_HELP);
{func_quit}         return(FUNC_QUIT);
{func_mort}         return(FUNC_MORT);
{func_pmt}          return(FUNC_PMT);
{func_ytm}          return(FUNC_YTM);
{func_rand}         return(FUNC_RAND);
{func_srand}        return(FUNC_SRAND);
{func_time}         return(FUNC_TIME);
{func_npr}          return(FUNC_NPR);
{func_ncr}          return(FUNC_NCR);
{func_deg2rad}      return(FUNC_DEG2RAD);
{func_rad2deg}      return(FUNC_RAD2DEG);
{func_gcd}          return(FUNC_GCD);
{func_lcm}          return(FUNC_LCM);
{func_even}         return(FUNC_EVEN);
{func_odd}          return(FUNC_ODD);

{func_eq}           return(FUNC_EQ);
{func_ne}           return(FUNC_NE);
{func_lt}           return(FUNC_LT);
{func_le}           return(FUNC_LE);
{func_gt}           return(FUNC_GT);
{func_ge}           return(FUNC_GE);
{func_true}         return(FUNC_TRUE);
{func_false}        return(FUNC_FALSE);
{func_zero}         return(FUNC_ZERO);
{func_one}          return(FUNC_ONE);

{func_f2c}          return(FUNC_F2C);
{func_c2f}          return(FUNC_C2F);

"+"                 return(PLUS);
"-"                 return(MINUS);

"*"                 return(TIMES);
"/"                 return(DIVIDE);

"^"                 return(POWER);

"("                 return(LEFT_PARENTHESIS);
")"                 return(RIGHT_PARENTHESIS);

","                 return(COMMA);

"\n"                return(END);

