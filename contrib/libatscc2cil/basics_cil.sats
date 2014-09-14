#define
ATS_EXTERN_PREFIX "ats2cilpre_"

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
