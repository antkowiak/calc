#define YYSTYPE double

typedef long double TNumber;

void print_error(const char *msg);

TNumber calculate_help();
TNumber calculate_quit();

TNumber calculate_factorial(TNumber n);
TNumber calculate_mort(TNumber principal, TNumber interest_rate, TNumber num_years);
TNumber calculate_pmt(TNumber r, TNumber nper, TNumber pv, TNumber fv, TNumber type);
TNumber calculate_ytm(TNumber couponRate, TNumber yearsToMaturity, TNumber parValue, TNumber price);
TNumber calculate_ytm_helper(TNumber annualCouponPayment, TNumber yearsToMaturity, TNumber parValue, TNumber proposedRate);
TNumber calculate_rand(TNumber a);
TNumber calculate_srand(TNumber a);
TNumber calculate_time();
TNumber calculate_npr(TNumber n, TNumber r);
TNumber calculate_ncr(TNumber n, TNumber r);
TNumber calculate_deg2rad(TNumber deg);
TNumber calculate_rad2deg(TNumber rad);
TNumber calculate_gcd(TNumber a, TNumber b);
TNumber calculate_lcm(TNumber a, TNumber b);
TNumber calculate_even(TNumber n);
TNumber calculate_odd(TNumber n);

TNumber calculate_eq(TNumber a, TNumber b);
TNumber calculate_ne(TNumber a, TNumber b);
TNumber calculate_lt(TNumber a, TNumber b);
TNumber calculate_le(TNumber a, TNumber b);
TNumber calculate_gt(TNumber a, TNumber b);
TNumber calculate_ge(TNumber a, TNumber b);

TNumber calculate_f2c(TNumber f);
TNumber calculate_c2f(TNumber c);
