#pragma once

#include <algorithm>
#include <iomanip>
#include <iostream>
#include <limits>
#include <map>
#include <vector>

#include "arbnumber.h"

// typedef long double TNumber;
typedef rda::ArbNumber TNumber;

#define YYSTYPE TNumber

namespace rda
{
    class GlobalData
    {
    private:
        struct history_element
        {
            std::string str;
            TNumber value;
            bool degraded = false;
        };

        std::string current_str;
        bool current_degraded = false;
        std::vector<history_element> history;

        std::map<TNumber, TNumber> memory;

    public:
        static GlobalData &Instance()
        {
            static GlobalData gd;
            return gd;
        }

    public:
        void SetCurrentStr(const std::string &str)
        {
            current_str = str;
        }

        void SetDegraded()
        {
            current_degraded = true;
        }

        TNumber Last(const TNumber index = 1'000'000) const
        {
            // if history is empty, return zero
            if (history.empty())
                return TNumber(0);

            // convert the index to a size_t
            size_t i = atol(index.to_string().c_str());

            // cap the index to end of vector
            i = std::min(i, history.size() - 1);

            return history[i].value;
        }

        TNumber Degraded(const TNumber index = 1'000'000) const
        {
            const size_t i = atol(index.to_string().c_str());

            if (i >= history.size())
                return TNumber(0);

            return ((history[i].degraded == true) ? TNumber(1) : TNumber(0));
        }

        void StoreHistory(const TNumber &n)
        {
            history.push_back(history_element{current_str, n, current_degraded});
            current_str = "";
            current_degraded = false;
        }

        TNumber History() const
        {
            for (size_t i = 0; i < history.size(); ++i)
                std::cout << "degraded = " << std::left
                          << ((history[i].degraded) ? "true, " : "false,")
                          << "  history[" << i << "] = "
                          << history[i].value.to_string() << "  ("
                          << history[i].str << ")" << std::endl;

            return TNumber(0);
        }

        TNumber StoreMemory(const TNumber &key, const TNumber &val)
        {
            memory[key] = val;
            return val;
        }

        TNumber RecallMemory(const TNumber &key) const
        {
            auto iter = memory.find(key);
            if (iter == memory.end())
                return TNumber(0);
            return iter->second;
        }

        TNumber ClearMemory()
        {
            memory.clear();
            return TNumber(0);
        }

        TNumber Memory() const
        {
            for (auto iter = memory.cbegin(); iter != memory.cend(); ++iter)
                std::cout << "memory[" << iter->first << "] = " << iter->second << std::endl;

            return TNumber(0);
        }
    };
} // namespace rda