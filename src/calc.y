%{

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <sstream>
#include <string>

#include "global.h"
#include "calculate_funcs.h"

extern int yylex();
extern int yyparse();
extern int yy_scan_string(const char * str);
extern int yyerror(const char *) { return 0; }
extern FILE* yyin;

%}

%token  NUMBER

%token  PI_VAL

%token  PLUS
%token  MINUS
%token  TIMES
%token  DIVIDE

%token  POWER
%token  COMMA
%token  LEFT_PARENTHESIS
%token  RIGHT_PARENTHESIS
%token  LEFT_BRACE
%token  RIGHT_BRACE

%token  FUNC_SIN
%token  FUNC_COS
%token  FUNC_TAN

%token  FUNC_ASIN
%token  FUNC_ACOS
%token  FUNC_ATAN
%token  FUNC_ATAN2

%token  FUNC_SINH
%token  FUNC_COSH
%token  FUNC_TANH

%token  FUNC_ASINH
%token  FUNC_ACOSH
%token  FUNC_ATANH

%token  FUNC_LOG10
%token  FUNC_LOG2
%token  FUNC_LOG1P
%token  FUNC_LOG
%token  FUNC_LN

%token  FUNC_EXP
%token  FUNC_EXP2

%token  FUNC_SQRT
%token  FUNC_CBRT

%token  FUNC_ABS
%token  FUNC_FLOOR
%token  FUNC_CEIL
%token  FUNC_ROUND
%token  FUNC_HYPOT

%token  FUNC_POW

%token  FUNC_TGAMMA
%token  FUNC_LGAMMA

%token  FUNC_TRUNC
%token  FUNC_NEARBYINT
%token  FUNC_FMOD
%token  FUNC_REMAINDER
%token  FUNC_NEXTAFTER
%token  FUNC_NEXTTOWARD
%token  FUNC_FDIM
%token  FUNC_FMAX
%token  FUNC_FMIN
%token  FUNC_FMA

%token  FUNC_MORT
%token  FUNC_PMT
%token  FUNC_YTM

%token  FUNC_RAND
%token  FUNC_SRAND
%token  FUNC_TIME

%token  FUNC_NPR
%token  FUNC_NCR

%token  FUNC_DEG2RAD
%token  FUNC_RAD2DEG

%token  FUNC_GCD
%token  FUNC_LCM

%token  FUNC_EVEN
%token  FUNC_ODD

%token  FUNC_EQ
%token  FUNC_NE
%token  FUNC_LT
%token  FUNC_LE
%token  FUNC_GT
%token  FUNC_GE

%token  FUNC_TRUE
%token  FUNC_FALSE
%token  FUNC_ZERO
%token  FUNC_ONE

%token  FUNC_F2C
%token  FUNC_C2F

%token  FUNC_LAST
%token  FUNC_HISTORY
%token  FUNC_HELP
%token  FUNC_QUIT

%token  END

%left   PLUS MINUS
%left   TIMES DIVIDE

%left   PI_VAL

%left   FUNC_SIN
%left   FUNC_COS
%left   FUNC_TAN

%left   FUNC_ASIN
%left   FUNC_ACOS
%left   FUNC_ATAN
%left   FUNC_ATAN2

%left   FUNC_SINH
%left   FUNC_COSH
%left   FUNC_TANH

%left   FUNC_ASINH
%left   FUNC_ACOSH
%left   FUNC_ATANH

%left   FUNC_LOG10
%left   FUNC_LOG2
%left   FUNC_LOG1P
%left   FUNC_LOG
%left   FUNC_LN

%left   FUNC_EXP
%left   FUNC_EXP2

%left   FUNC_SQRT
%left   FUNC_CBRT

%left   FUNC_ABS
%left   FUNC_FLOOR
%left   FUNC_CEIL
%left   FUNC_ROUND
%left   FUNC_HYPOT

%left   FUNC_POW

%left   FUNC_TGAMMA
%left   FUNC_LGAMMA

%left   FUNC_TRUNC
%left   FUNC_NEARBYINT
%left   FUNC_FMOD
%left   FUNC_REMAINDER
%left   FUNC_NEXTAFTER
%left   FUNC_NEXTTOWARD
%left   FUNC_FDIM
%left   FUNC_FMAX
%left   FUNC_FMIN
%left   FUNC_FMA

%left   FUNC_MORT
%left   FUNC_PMT
%left   FUNC_YTM

%left   FUNC_RAND
%left   FUNC_SRAND
%left   FUNC_TIME

%left   FUNC_NPR
%left   FUNC_NCR

%left   FUNC_DEG2RAD
%left   FUNC_RAD2DEG

%left   FUNC_GCD
%left   FUNC_LCM

%left   FUNC_EVEN
%left   FUNC_ODD

%left   FUNC_EQ
%left   FUNC_NE
%left   FUNC_LT
%left   FUNC_LE
%left   FUNC_GT
%left   FUNC_GE

%left   FUNC_TRUE
%left   FUNC_FALSE
%left   FUNC_ZERO
%left   FUNC_ONE

%left   FUNC_F2C
%left   FUNC_C2F

%left   FUNC_LAST
%left   FUNC_HISTORY
%left   FUNC_HELP
%left   FUNC_QUIT

%left   NEG

%right  POWER

%start Input

%%

Input:
        | Input Line
        ;

Line:
          END
        | Expression    END { rda::print_expression($1); }
        ;

Expression:
          NUMBER                          { $$=rda::calculate_lone_number($1); }

        | PI_VAL                          { $$=rda::calculate_pi(); }

        | NUMBER PI_VAL                   { $$=rda::calculate_pi_times_n($1); }

        | Expression PLUS   Expression    { $$=TNumber($1)+TNumber($3); }
        | Expression MINUS  Expression    { $$=TNumber($1)-TNumber($3); }
        | Expression TIMES  Expression    { $$=TNumber($1)*TNumber($3); }
        | Expression DIVIDE Expression    { $$=TNumber($1)/TNumber($3); }

        | FUNC_SIN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sinl(rda::to_double($3)); }
        | FUNC_COS LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=cosl(rda::to_double($3)); }
        | FUNC_TAN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tanl(rda::to_double($3)); }
        
        | FUNC_ASIN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=asinl(rda::to_double($3)); }
        | FUNC_ACOS LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=acosl(rda::to_double($3)); }
        | FUNC_ATAN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=atanl(rda::to_double($3)); }
        | FUNC_ATAN2 LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=atan2l(rda::to_double($3), rda::to_double($5)); }
        
        | FUNC_SINH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sinhl(rda::to_double($3)); }
        | FUNC_COSH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=coshl(rda::to_double($3)); }
        | FUNC_TANH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tanhl(rda::to_double($3)); }

        | FUNC_ASINH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=asinhl(rda::to_double($3)); }
        | FUNC_ACOSH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=acoshl(rda::to_double($3)); }
        | FUNC_ATANH LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=atanhl(rda::to_double($3)); }
        
        | FUNC_LOG10 LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log10l(rda::to_double($3)); }
        | FUNC_LOG2 LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log2l(rda::to_double($3)); }
        | FUNC_LOG1P LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=log1pl(rda::to_double($3)); }
        | FUNC_LOG LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=logl(rda::to_double($3)); }
        | FUNC_LN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=logl(rda::to_double($3)); }
        
        | FUNC_EXP LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=expl(rda::to_double($3)); }
        | FUNC_EXP2 LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=exp2l(rda::to_double($3)); }
        
        | FUNC_SQRT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=sqrtl(rda::to_double($3)); }
        | FUNC_CBRT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=cbrtl(rda::to_double($3)); }
        
        | FUNC_ABS LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=fabsl(rda::to_double($3)); }
        | FUNC_FLOOR LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=floorl(rda::to_double($3)); }
        | FUNC_CEIL LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=ceill(rda::to_double($3)); }
        | FUNC_ROUND LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=roundl(rda::to_double($3)); }
        | FUNC_HYPOT LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=hypotl(rda::to_double($3), rda::to_double($5)); }
        
        | FUNC_POW LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=powl(rda::to_double($3), rda::to_double($5)); }
        
        | FUNC_TGAMMA LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=tgammal(rda::to_double($3)); }
        | FUNC_LGAMMA LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=lgammal(rda::to_double($3)); }
        
        | FUNC_TRUNC LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=truncl(rda::to_double($3)); }
        | FUNC_NEARBYINT LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=nearbyintl(rda::to_double($3)); }
        | FUNC_FMOD LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fmodl(rda::to_double($3), rda::to_double($5)); }
        | FUNC_REMAINDER LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=remainderl(rda::to_double($3), rda::to_double($5)); }
        | FUNC_NEXTAFTER LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=nextafterl(rda::to_double($3), rda::to_double($5)); }
        | FUNC_NEXTTOWARD LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=nexttowardl(rda::to_double($3), rda::to_double($5)); }
        | FUNC_FDIM LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fdiml(rda::to_double($3), rda::to_double($5)); }
        | FUNC_FMAX LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fmaxl(rda::to_double($3), rda::to_double($5)); }
        | FUNC_FMIN LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=fminl(rda::to_double($3), rda::to_double($5)); }
        | FUNC_FMA LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=fmal(rda::to_double($3), rda::to_double($5), rda::to_double($7)); }

        | FUNC_MORT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_mort($3, $5, $7); }
        | FUNC_PMT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_pmt($3, $5, $7, 0.0, 0.0); }
        | FUNC_PMT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_pmt($3, $5, $7, $9, 0.0); }
        | FUNC_PMT LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_pmt($3, $5, $7, $9, $11); }
        | FUNC_YTM LEFT_PARENTHESIS Expression COMMA Expression COMMA Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_ytm($3, $5, $7, $9); }

        | FUNC_RAND LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=rda::calculate_rand(0); }
        | FUNC_RAND LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=rda::calculate_rand($3); }
        | FUNC_SRAND LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=rda::calculate_srand($3); }
        | FUNC_TIME LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=rda::calculate_time(); }

        | FUNC_NPR LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_npr($3, $5); }
        | FUNC_NCR LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_ncr($3, $5); }

        | FUNC_DEG2RAD LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=rda::calculate_deg2rad($3); }
        | FUNC_RAD2DEG LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=rda::calculate_rad2deg($3); }

        | FUNC_GCD LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_gcd($3, $5); }
        | FUNC_LCM LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_lcm($3, $5); }

        | FUNC_EVEN LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=rda::calculate_even($3); }
        | FUNC_ODD LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=rda::calculate_odd($3); }

        | FUNC_EQ LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_eq($3, $5); }
        | FUNC_NE LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_ne($3, $5); }
        | FUNC_LT LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_lt($3, $5); }
        | FUNC_LE LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_le($3, $5); }
        | FUNC_GT LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_gt($3, $5); }
        | FUNC_GE LEFT_PARENTHESIS Expression COMMA Expression RIGHT_PARENTHESIS { $$=rda::calculate_ge($3, $5); }

        | FUNC_TRUE LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=rda::calculate_true(); }
        | FUNC_FALSE LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=rda::calculate_false(); }
        | FUNC_ZERO LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=rda::calculate_zero(); }
        | FUNC_ONE LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$=rda::calculate_one(); }

        | FUNC_F2C LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=rda::calculate_f2c($3); }
        | FUNC_C2F LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=rda::calculate_c2f($3); }

        | FUNC_LAST LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$ = rda::calculate_last(); }
        | FUNC_LAST LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$ = rda::calculate_last($3); }
        | FUNC_HISTORY LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$ = rda::calculate_history(); }
        | FUNC_HELP LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$ = rda::calculate_help(); }
        | FUNC_QUIT LEFT_PARENTHESIS RIGHT_PARENTHESIS { $$ = rda::calculate_quit(); }

        | MINUS Expression %prec NEG      { $$=rda::calculate_negation($2); }
        | Expression POWER Expression     { $$=rda::calculate_power($1, $3); }
        | LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=rda::calculate_unwrap_parenthesis($2); }
        ;

%%

void print_error(const char *msg)
{
    std::cerr << "error: " << msg << std::endl;
}

int main(int argc, char *argv[])
{
    yyin = stdin;
    srand(time(NULL));

    if (argc > 1)
    {
        std::stringstream ss;

        for (int i = 1 ; i < argc ; ++i)
            if (argv[i] != nullptr)
                ss << argv[i];

        ss << std::endl;       
        yy_scan_string(ss.str().c_str());
        yyparse();
        return EXIT_SUCCESS;
    }

    std::string line;

    while(std::getline(std::cin, line))
    {
        rda::GlobalData::Instance().SetCurrentStr(line);
        line.append("\n");
        yy_scan_string(line.c_str());
        yyparse();
    }

    return EXIT_SUCCESS;
}
