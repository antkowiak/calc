#pragma once

#include <cmath>
#include <cstdlib>
#include <iostream>
#include <string>

#include "arbnumber.h"
#include "global.h"

namespace rda
{
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
        long long l = std::atoll(n.to_string().c_str());
        // TODO error check against too big. Trip a loss of precision flag
        return l;
    }

    static double to_double(const TNumber &n)
    {
        GlobalData::Instance().SetDegraded();
        double d = std::atof(n.to_string().c_str());
        // TODO error check against too big. Trip a loss of precision flag
        return d;
    }

    static std::string to_string(const TNumber &n)
    {
        return n.to_string();
    }

    static void print_expression(const TNumber &n)
    {
        GlobalData::Instance().StoreHistory(n);
        std::cout << n << std::endl;
    }

    static void print_list(const std::vector<TNumber> &data)
    {
        std::cout << "{";

        for (size_t i = 0; i < data.size(); ++i)
        {
            if (i != 0)
                std::cout << ", ";
            std::cout << data[i].to_string();
        }

        std::cout << "}" << std::endl;
    }

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
                      std::pow(rda::to_double(proposedRate + TNumber(1)), (i * -1)));

        price += parValue * std::pow(rda::to_double(proposedRate + TNumber(1)),
                                     rda::to_double(yearsToMaturity * TNumber(-1)));
        return price;
    }

    static void remove_chars_helper(std::string &str, const char c)
    {
        auto pos = str.find(c);
        while (pos != std::string::npos)
        {
            str.erase(pos);
            pos = str.find(c);
        }
    }

    static TNumber pi_helper()
    {
        return TNumber("3.1415926535897932384626433832795");
    }

    static TNumber calculate_power_helper(const TNumber &base, const TNumber &expon)
    {
        if (expon.is_whole_number() && expon > TNumber(0))
        {
            TNumber total = 1;
            for (TNumber i(0); i < expon; ++i)
                total = total * base;
            return total;
        }

        double dbase = rda::to_double(base);
        double dexpon = rda::to_double(expon);
        double dresult = powl(dbase, dexpon);
        return TNumber(dresult);
    }

} // namespace rda
