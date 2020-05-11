#pragma once

#include <string>

#include "arbnumber.h"
#include "global.h"
#include "helper_funcs.h"

namespace rda
{
    static TNumber parse_helper_real(const char *input)
    {
        return TNumber(input);
    }

    static TNumber parse_helper_factorial(const char *input)
    {
        std::string text(input);
        rda::remove_chars_helper(text, '!');
        return rda::calculate_factorial_helper(TNumber(text));
    }

    static TNumber parse_helper_percent(const char *input)
    {
        std::string text(input);
        rda::remove_chars_helper(text, '%');
        return TNumber(text) / TNumber(100);
    }

    static TNumber parse_helper_pi_times(const char *input)
    {
        std::string text(input);

        rda::remove_chars_helper(text, 'P');
        rda::remove_chars_helper(text, 'p');
        rda::remove_chars_helper(text, 'I');
        rda::remove_chars_helper(text, 'i');

        TNumber n(text);

        return n * rda::pi_helper();
    }

    static TNumber parse_helper_metric(const char *input)
    {
        std::string text(input);

        // empty text, return zero
        if (text.empty())
            return TNumber(0);

        // cache the last character (metric size designation)
        const char c = text[text.size() - 1];

        // remove the last character
        text = text.substr(0, text.size() - 1);

        // convert string to base
        const TNumber base(text);

        // multiply by appropriate metric magnitude
        switch (c)
        {
            case 'P':
            case 'p':
            {
                // pico
                return base / TNumber(1000) / TNumber(1000) / TNumber(1000) / TNumber(1000);
            }
            case 'N':
            case 'n':
            {
                // nano
                return base / TNumber(1000) / TNumber(1000) / TNumber(1000);
            }
            case 'U':
            case 'u':
            {
                // micro
                return base / TNumber(1000) / TNumber(1000);
            }
            case 'm':
            {
                // milli
                return base / TNumber(1000);
            }
            case 'K':
            case 'k':
            {
                // kilo
                return base * TNumber(1000);
            }
            case 'M':
            {
                // mega
                return base * TNumber(1000) * TNumber(1000);
            }
            case 'G':
            case 'g':
            {
                // giga
                return base * TNumber(1000) * TNumber(1000) * TNumber(1000);
            }
            case 'T':
            case 't':
            {
                // tera
                return base * TNumber(1000) * TNumber(1000) * TNumber(1000) * TNumber(1000);
            }
            default:
            {
                return base;
            }
        }
    }

} // namespace rda
