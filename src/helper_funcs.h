#pragma once

#include <cmath>
#include <cstdlib>
#include <iostream>
#include <string>

#include "arbnumber.h"
#include "global.h"

namespace rda
{
    static TNumber from_string(const std::string &s)
    {
        return TNumber(s);
    }

    static double to_double(const TNumber &n)
    {
        double d = std::atof(n.to_string().c_str());

        if (n != d)
            GlobalData::Instance().SetDegraded();

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
        // if the base is zero, return zero
        if (base == TNumber(0))
            return TNumber(0);

        // if anything raised to the zero power, return 1
        if (expon == TNumber(0))
        {
            return TNumber(1);
        }

        // if the exponent is awhole number, try to avoid degraded precision
        if (expon.is_whole_number())
        {
            // positive exponent, just multiply the base over and over again
            if (expon > TNumber(0))
            {
                TNumber total = 1;
                for (TNumber i(0); i < expon; ++i)
                    total = total * base;
                return total;
            }
            else if (expon < TNumber(0))
            {
                // negative exponent. Multiple the base the corect number of times
                TNumber total = 1;
                for (TNumber i(0); i > expon; --i)
                    total = total * base;

                // truncate to 20 decimal places to avoid bad performance
                TNumber t = TNumber::truncate_precision(total, 10);

                // if the truncation changed the value of the total, trip the degraded flag
                if (t != total)
                    rda::GlobalData::Instance().SetDegraded();

                // return 1/x for negative exponents
                return (TNumber(1) / t);
            }
        }

        // exponent was not a whole number.. Just call the standard libary function
        // and live with degredaded precision.

        double dbase = rda::to_double(base);
        double dexpon = rda::to_double(expon);
        double dresult = powl(dbase, dexpon);
        return TNumber(dresult);
    }

    static TNumber calculate_ytm_helper(const TNumber &annualCouponPayment,
                                        const TNumber &yearsToMaturity,
                                        const TNumber &parValue,
                                        const TNumber &proposedRate)
    {
        TNumber price(0);

        for (TNumber i(1); i <= yearsToMaturity; ++i)
            price += annualCouponPayment * rda::calculate_power_helper(proposedRate + 1, i * -1);

        price += parValue * rda::calculate_power_helper(proposedRate + 1, yearsToMaturity * -1);

        return price;
    }

} // namespace rda
