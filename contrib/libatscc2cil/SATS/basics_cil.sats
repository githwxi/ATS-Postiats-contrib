#define
ATS_EXTERN_PREFIX "ats2cilpre_"

%{#
#include "/home/artyom/proj/ATS-Postiats-contrib/contrib/libatscc2cil/CATS/basics_cil.cats"
%} // end of [%{#]

fun print_newline ((*void*)): void = "ext#%"

// from integer.sats
fun add_int0_int0 : (int, int) -> int = "ext#%"
fun sub_int0_int0 : (int, int) -> int = "ext#%"
fun mul_int0_int0 : (int, int) -> int = "ext#%"

overload + with add_int0_int0 of 100
overload - with sub_int0_int0 of 100
overload * with mul_int0_int0 of 100

fun lt_int0_int0 : (int, int) -> bool = "ext#%"
fun lte_int0_int0 : (int, int) -> bool = "ext#%"
fun gt_int0_int0 : (int, int) -> bool = "ext#%"
fun gte_int0_int0 : (int, int) -> bool = "ext#%"

fun eq_int0_int0 : (int, int) -> bool = "ext#%"
fun neq_int0_int0 : (int, int) -> bool = "ext#%"

overload < with lt_int0_int0 of 100
overload <= with lte_int0_int0 of 100
overload > with gt_int0_int0 of 100
overload >= with gte_int0_int0 of 100
overload = with eq_int0_int0 of 100
overload != with neq_int0_int0 of 100
overload <> with neq_int0_int0 of 100

fun print_int : (int) -> void = "ext#%"

overload print with print_int of 100

// from float.sats
fun add_double0_double0 : (double, double) -> double = "ext#%"
fun sub_double0_double0 : (double, double) -> double = "ext#%"
fun mul_double0_double0 : (double, double) -> double = "ext#%"

overload + with add_double0_double0 of 100
overload - with sub_double0_double0 of 100
overload * with mul_double0_double0 of 100

fun lt_double0_double0 : (double, double) -> bool = "ext#%"
fun lte_double0_double0 : (double, double) -> bool = "ext#%"
fun gt_double0_double0 : (double, double) -> bool = "ext#%"
fun gte_double0_double0 : (double, double) -> bool = "ext#%"

fun eq_double0_double0 : (double, double) -> bool = "ext#%"
fun neq_double0_double0 : (double, double) -> bool = "ext#%"

overload < with lt_double0_double0 of 100
overload <= with lte_double0_double0 of 100
overload > with gt_double0_double0 of 100
overload >= with gte_double0_double0 of 100
overload = with eq_double0_double0 of 100
overload != with neq_double0_double0 of 100
overload <> with neq_double0_double0 of 100

fun print_double : (double) -> void = "ext#%"

overload print with print_double of 100
