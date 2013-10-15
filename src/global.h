#define YYSTYPE double

typedef long double TNumber;

void print_error(const char *msg);

TNumber calculate_mort(TNumber principal, TNumber interest_rate, TNumber num_years);
TNumber calculate_pmt(TNumber r, TNumber nper, TNumber pv, TNumber fv, TNumber type);

