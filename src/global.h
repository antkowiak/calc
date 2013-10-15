#define YYSTYPE double

typedef long double TNumber;

void print_error(const char *msg);

TNumber calculate_mort(TNumber principal, TNumber interest_rate, TNumber num_years);
TNumber calculate_pmt(TNumber r, TNumber nper, TNumber pv, TNumber fv, TNumber type);
TNumber calculate_rand(TNumber a);
TNumber calculate_srand(TNumber a);
TNumber calculate_time();

TNumber calculate_eq(TNumber a, TNumber b);
TNumber calculate_ne(TNumber a, TNumber b);
TNumber calculate_lt(TNumber a, TNumber b);
TNumber calculate_le(TNumber a, TNumber b);
TNumber calculate_gt(TNumber a, TNumber b);
TNumber calculate_ge(TNumber a, TNumber b);

