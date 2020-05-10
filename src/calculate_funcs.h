#pragma once

#include <cmath>
#include <ctime>
#include <limits>
#include <string>

#include "arbnumber.h"
#include "global.h"

namespace rda
{
    //////////////////////////////////////////////////////////////////////
    static TNumber from_double(const double d)
    {
        GlobalData::Instance().SetDegraded();
        return TNumber(d);
    }

    static TNumber from_string(const std::string &s)
    {
        return TNumber(s);
    }

    static long long to_int(const TNumber &n)
    {
        GlobalData::Instance().SetDegraded();
        long long l = atoll(n.to_string().c_str());
        // TODO error check against too big. Trip a loss of precision flag
        return l;
    }

    static double to_double(const TNumber &n)
    {
        GlobalData::Instance().SetDegraded();
        double d = atof(n.to_string().c_str());
        // TODO error check against too big. Trip a loss of precision flag
        return d;
    }

    //////////////////////////////////////////////////////////////////////
    static std::string to_string(const TNumber &n)
    {
        return n.to_string();
    }

    //////////////////////////////////////////////////////////////////////
    static void print_expression(const TNumber &n)
    {
        GlobalData::Instance().StoreHistory(n);
        std::cout << n << std::endl;
    }

    //////////////////////////////////////////////////////////////////////
    static TNumber calculate_factorial_helper(const TNumber &n)
    {
        TNumber retVal(1);

        for (TNumber i(1); i <= n; ++i)
            retVal = retVal * i;

        return retVal;
    }

    static TNumber calculate_ytm_helper(const TNumber &annualCouponPayment,
                                 const TNumber &yearsToMaturity,
                                 const TNumber &parValue,
                                 const TNumber &proposedRate)
    {
        long long ytm_i = rda::to_int(yearsToMaturity);

        TNumber price(0);
        for (long long i = 1; i <= ytm_i; ++i)
            price += (annualCouponPayment *
                      pow(rda::to_double(proposedRate + TNumber(1)), (i * -1)));

        price += parValue * pow(rda::to_double(proposedRate + TNumber(1)),
                                rda::to_double(yearsToMaturity * TNumber(-1)));
        return price;
    }

    static void remove_chars_helper(std::string & str, const char c)
    {
        auto pos = str.find(c);
        while (pos != std::string::npos)
        {
            str.erase(pos);
            pos = str.find(c);
        }
    }

    //////////////////////////////////////////////////////////////////////
    static TNumber calculate_lone_number(const TNumber &n)
    {
        return n;
    }

    static TNumber calculate_pi()
    {
        return TNumber("3.1415926535897932384626433832795");
    }

    static TNumber calculate_pi_times_str(const std::string &s)
    {
        std::string text(s);

        rda::remove_chars_helper(text, 'P');
        rda::remove_chars_helper(text, 'p');
        rda::remove_chars_helper(text, 'I');
        rda::remove_chars_helper(text, 'i');

        TNumber n(text);

        return n * calculate_pi();
    }

    static TNumber calculate_pi_times_n(const TNumber &n)
    {
        return (calculate_pi() * n);
    }

    static TNumber calculate_plus(const TNumber & n1, const TNumber n2)
    {
        return n1 + n2;
    }

    static TNumber calculate_minus(const TNumber &n1, const TNumber n2)
    {
        return n1 - n2;
    }

    static TNumber calculate_multiply(const TNumber &n1, const TNumber n2)
    {
        return n1 * n2;
    }

    static TNumber calculate_divide(const TNumber &n1, const TNumber n2)
    {
        return n1 / n2;
    }

    static TNumber calculate_sin(const TNumber &n)
    {
        return sinl(rda::to_double(n));
    }

    static TNumber calculate_cos(const TNumber &n)
    {
        return cosl(rda::to_double(n));
    }

    static TNumber calculate_tan(const TNumber &n)
    {
        return tanl(rda::to_double(n));
    }

    static TNumber calculate_asin(const TNumber &n)
    {
        return asinl(rda::to_double(n));
    }

    static TNumber calculate_acos(const TNumber &n)
    {
        return acosl(rda::to_double(n));
    }

    static TNumber calculate_atan(const TNumber &n)
    {
        return atanl(rda::to_double(n));
    }

    static TNumber calculate_atan2(const TNumber &n1, const TNumber & n2)
    {
        return atan2l(rda::to_double(n1), rda::to_double(n2));
    }

    static TNumber calculate_sinh(const TNumber &n)
    {
        return sinhl(rda::to_double(n));
    }

    static TNumber calculate_cosh(const TNumber &n)
    {
        return coshl(rda::to_double(n));
    }

    static TNumber calculate_tanh(const TNumber &n)
    {
        return tanhl(rda::to_double(n));
    }

    static TNumber calculate_asinh(const TNumber &n)
    {
        return asinhl(rda::to_double(n));
    }

    static TNumber calculate_acosh(const TNumber &n)
    {
        return acoshl(rda::to_double(n));
    }

    static TNumber calculate_atanh(const TNumber &n)
    {
        return atanhl(rda::to_double(n));
    }

    static TNumber calculate_mort(const TNumber &principal,
                           const TNumber &interest_rate,
                           const TNumber &num_years)
    {
        TNumber monthlyInterest = interest_rate / TNumber(12.0);
        double months = rda::to_double(num_years) * 12.0;
        TNumber monthlyPayment =
            principal * (monthlyInterest /
                         (TNumber(1) - powl((1.0 + rda::to_double(monthlyInterest)),
                                            (0.0 - months))));

        return monthlyPayment;
    }

    static TNumber calculate_pmt(const TNumber &r,
                          const TNumber &nper,
                          const TNumber &pv,
                          const TNumber &fv,
                          const TNumber &type)
    {
        TNumber q = rda::from_double(
            powl(rda::to_double(TNumber(1) + r), rda::to_double(nper)));
        return (r * (fv + (q * pv))) /
               ((TNumber(-1) + q) * (TNumber(1) + r * (type)));
    }

    static TNumber calculate_ytm(const TNumber &couponRate,
                          const TNumber &yearsToMaturity,
                          const TNumber &parValue,
                          const TNumber &price)
    {
        TNumber yrs = roundl(rda::to_double(yearsToMaturity));
        TNumber annualCouponPayment = couponRate * parValue;
        TNumber rateTry = couponRate;
        TNumber rateLow = couponRate - 10.0;
        TNumber rateHigh = couponRate + 10.0;
        for (int i = 0; i < 100; ++i)
        {
            TNumber p =
                calculate_ytm_helper(annualCouponPayment, yrs, parValue, rateTry);
            TNumber oldRateTry = rateTry;
            if (p < price)
            {
                rateTry = (rateTry + rateLow) / 2.0;
                rateHigh = oldRateTry;
            }
            else if (p > price)
            {
                rateTry = (rateTry + rateHigh) / 2.0;
                rateLow = oldRateTry;
            }
        }
        return rateTry;
    }

    static TNumber calculate_rand(const TNumber &a)
    {
        if (a == 0.0)
            return rand();

        return rand() % (rda::to_int(a));
    }

    static TNumber calculate_srand(const TNumber &a)
    {
        srand(static_cast<unsigned long long>(rda::to_int(a)));
        return TNumber(1);
    }

    static TNumber calculate_time()
    {
        return (TNumber)time(NULL);
    }

    static TNumber calculate_npr(const TNumber &n, const TNumber &r)
    {
        unsigned long long ni = static_cast<unsigned long long>(rda::to_int(n));
        unsigned long long ri = static_cast<unsigned long long>(rda::to_int(r));

        if (ri > ni)
            return calculate_factorial_helper(ni);

        unsigned long long total = 1;

        unsigned long long i = ni;
        for (; i > (ni - ri); --i)
        {
            total *= i;
        }

        return TNumber(total);
    }

    static TNumber calculate_ncr(const TNumber &n, const TNumber &r)
    {
        unsigned long long ni = static_cast<unsigned long long>(rda::to_int(n));
        unsigned long long ri = static_cast<unsigned long long>(rda::to_int(r));

        return ((calculate_npr(ni, ri) / calculate_factorial_helper(ri)));
    }

    static TNumber calculate_deg2rad(const TNumber &deg)
    {
        return ((deg * 3.141592654) / 180.0);
    }

    static TNumber calculate_rad2deg(const TNumber &rad)
    {
        return ((rad * 180.0) / 3.141592654);
    }

    static TNumber calculate_gcd(const TNumber &a, const TNumber &b)
    {
        long long imin =
            (long long)fminl(fabsl(rda::to_double(a)), fabsl(rda::to_double(b)));
        long long imax =
            (long long)fmaxl(fabsl(rda::to_double(a)), fabsl(rda::to_double(b)));

        if (imin == 0 || imax == 0)
            return TNumber(0);

        unsigned long long d = imin;
        for (; d >= 1; --d)
        {
            if ((imin % d == 0) && (imax % d == 0))
            {
                return TNumber(d);
            }
        }

        return TNumber(1);
    }

    static TNumber calculate_lcm(const TNumber &a, const TNumber &b)
    {
        long long ai = rda::to_int(a);
        long long bi = rda::to_int(b);

        if (ai == 0 || bi == 0)
            return TNumber(0);

        long long multiple = ai;

        while (multiple >= ai)
        {
            if (multiple % bi == 0)
                return TNumber(multiple);

            multiple += ai;
        }

        return TNumber(0);
    }

    static TNumber calculate_even(const TNumber &n)
    {
        long long val = rda::to_int(n);
        if (val % 2 == 0)
            return TNumber(1);
        return TNumber(0);
    }

    static TNumber calculate_odd(const TNumber &n)
    {
        long long val = rda::to_int(n);
        if (val % 2 == 1)
            return TNumber(1);
        return TNumber(0);
    }

    static TNumber calculate_eq(const TNumber &a, const TNumber &b)
    {
        if (a == b)
            return TNumber(1);
        return TNumber(0);
    }

    static TNumber calculate_ne(const TNumber &a, const TNumber &b)
    {
        if (a != b)
            return TNumber(1);
        return TNumber(0);
    }

    static TNumber calculate_lt(const TNumber &a, const TNumber &b)
    {
        if (a < b)
            return TNumber(1);
        return TNumber(0);
    }

    static TNumber calculate_le(const TNumber &a, const TNumber &b)
    {
        if (a <= b)
            return TNumber(1);
        return TNumber(0);
    }

    static TNumber calculate_gt(const TNumber &a, const TNumber &b)
    {
        if (a > b)
            return TNumber(1);
        return TNumber(0);
    }

    static TNumber calculate_ge(const TNumber &a, const TNumber &b)
    {
        if (a >= b)
            return TNumber(1);
        return TNumber(0);
    }

    static TNumber calculate_true()
    {
        return TNumber(1);
    }

    static TNumber calculate_false()
    {
        return TNumber(0);
    }

    static TNumber calculate_zero()
    {
        return TNumber(0);
    }

    static TNumber calculate_one()
    {
        return TNumber(1);
    }

    static TNumber calculate_f2c(const TNumber &f)
    {
        return ((((f - TNumber(32.0)) * TNumber(5)) / TNumber(9)));
    }

    static TNumber calculate_c2f(const TNumber &c)
    {
        return ((((TNumber(c) * TNumber(9)) / TNumber(5)) + TNumber(32.0)));
    }

    static TNumber calculate_last(const TNumber n = TNumber(std::numeric_limits<size_t>::max()))
    {
        return GlobalData::Instance().Last(n);
    }

    static TNumber calculate_history()
    {
        return GlobalData::Instance().History();
    }

    static TNumber calculate_help()
    {
        printf("Available functions: \n");
        printf("(x!)            - factorial\n");
        printf("(PI)            - pi (3.14159)\n");
        printf("(x^y)           - raise x to the power of y\n");
        printf("(x+y)           - addition\n");
        printf("(x-y)           - subtraction\n");
        printf("(x*y)           - multiplication\n");
        printf("(x/y)           - division\n");
        printf("sin(x)          - sine function\n");
        printf("cos(x)          - cosine function\n");
        printf("tan(x)          - tangent function\n");
        printf("asin(x)         - arc sine function\n");
        printf("acos(x)         - arc cosine function\n");
        printf("atan(x)         - arc tangent function of one variable\n");
        printf("atan2(x,y)      - arc tangent function of two variables\n");
        printf("sinh(x)         - hyperbolic sine function\n");
        printf("cosh(x)         - hyperbolic cosine function\n");
        printf("tanh(x)         - hyperbolic tangent function\n");
        printf("asinh(x)        - inverse hyperbolic sine function\n");
        printf("acosh(x)        - inverse hyperbolic cosine function\n");
        printf("atanh(x)        - inverse hyperbolic tangent function\n");
        printf("log10(x)        - logarithm of x to base 10\n");
        printf("log2(x)         - logarithm of x to base 2\n");
        printf("log1p(x)        - natural logarithm of x with increased accuracy\n");
        printf("log(x)          - natural logarithm\n");
        printf("ln(x)           - natural logarithm\n");
        printf("exp(x)          - compute the base-e exponent of x (e**x)\n");
        printf("exp2(x)         - compute the base-2 exponent of x (2**x)\n");
        printf("sqrt(x)         - square root function\n");
        printf("cbrt(x)         - cube root function\n");
        printf("abs(x)          - absolute value function\n");
        printf(
            "floor(x)        - round to largest integral value not greater than x\n");
        printf(
            "ceil(x)         - round to smallest integral value not less than x\n");
        printf("round(x)        - round to integral value, regarldess of rounding "
               "direction\n");
        printf("hypot(x,y)      - euclidean distance function\n");
        printf("pow(x,y)        - power function\n");
        printf("tgamma(x)       - calculate the gamma function of x\n");
        printf("lgamma(x)       - calculate the nat log of the abs value of the "
               "gamma function\n");
        printf("trunc(x)        - truncate to integer value\n");
        printf(
            "nearbyint(x)    - round to integral value in floating-point format\n");
        printf("fmod(x)         - floating point remainder function\n");
        printf("remainder(x,y)  - floating point remainder function\n");
        printf("fdim(x,y)       - return the difference if positive, 0 otherwise\n");
        printf("fmax(x,y)       - return maximum value\n");
        printf("fmin(x,y)       - return minimum value\n");
        printf("fma(x,y,z)      - multiple and add, then round\n");
        printf("mort(x,y,z)     - calculate mortgage\n");
        printf("pmt(x,y,z,a,b)  - loan payment function\n");
        printf("ytm(c,n,p,prc)  - bond yield to maturity\n");
        printf("rand()          - random number\n");
        printf("rand(x)         - random number bounded by x\n");
        printf("srand(x)        - seed the random number generator\n");
        printf("time()          - return the current time in ms\n");
        printf("npr(x,y)        - compute permutations\n");
        printf("ncr(x,y)        - compute combinations\n");
        printf("deg2rad(x)      - convert degrees to radians\n");
        printf("rad2deg(x)      - convert radians to degrees\n");
        printf("gcd(x,y)        - compute greatest common divisor\n");
        printf("lcm(x,y)        - compute least common multiple\n");
        printf("even(x)         - returns 1 if x is even, 0 otherwise\n");
        printf("odd(x)          - returns 1 if x is odd, 0 otherwise\n");
        printf("eq(x,y)         - returns 1 if x is equal to y, 0 otherwise\n");
        printf("ne(x,y)         - returns 1 if x is not equal to y, 0 otherwise\n");
        printf("lt(x,y)         - returns 1 if x is less than y, 0 otherwise\n");
        printf("le(x,y)         - returns 1 if x is less than or equal to y, 0 "
               "otherwise\n");
        printf("gt(x,y)         - returns 1 if x is greater than y, 0 otherwise\n");
        printf("ge(x,y)         - returns 1 if x is greater than or equal to y, 0 "
               "otherwise\n");
        printf("true()          - returns 1\n");
        printf("false()         - returns 0\n");
        printf("zero()          - returns 0\n");
        printf("one()           - returns 1\n");
        printf("f2c(f)          - convert Farenheit to Celsius\n");
        printf("c2f(c)          - convert Celsius to Farenheit\n");
        printf("history()       - prints calculation history\n");
        printf("last()          - returns prior calculation result\n");
        printf("last(n)         - returns prior calculation result n\n");
        printf("help()          - prints help message\n");
        printf("quit()          - exits the program\n");

        return TNumber(0);
    }

    static TNumber calculate_quit()
    {
        exit(EXIT_SUCCESS);
        return TNumber(0);
    }

    static TNumber calculate_factorial(const TNumber &n)
    {
        return calculate_factorial_helper(n);
    }

    static TNumber calculate_negation(const TNumber & n)
    {
        TNumber r = n * TNumber(-1);
        return r;
    }

    static TNumber calculate_power(const TNumber & base, const TNumber & expon)
    {
        if (expon.is_whole_number() && expon > TNumber(0))
        {
            TNumber total = 1;
            for (TNumber i(0) ; i < expon ; ++i)
                total = total * base;
            return total;
        }

        double dbase = rda::to_double(base);
        double dexpon = rda::to_double(expon);
        double dresult = powl(dbase, dexpon);
        return TNumber(dresult);
    }

    static TNumber calculate_unwrap_parenthesis(const TNumber &n)
    {
        return n;
    }

} // namespace rda
