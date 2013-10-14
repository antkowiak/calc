#define YYSTYPE double

typedef long double TNumber;

TNumber calculate_mortgage(TNumber principal, TNumber interest_rate, TNumber num_years);
TNumber calculate_pmt(TNumber r, TNumber nper, TNumber pv, TNumber fv, TNumber type);
void print_error(const char *msg);

