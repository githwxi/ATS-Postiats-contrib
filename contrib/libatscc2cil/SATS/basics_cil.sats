#define
ATS_EXTERN_PREFIX "ats2cilpre_"

%{#
#include "libatscc2cil/CATS/basics_cil.cats"
%} // end of [%{#]

fun print_newline ((*void*)): void = "ext#%"

overload print with print_newline of 100

// from boolean.dats
fun print_bool : (bool) -> void = "ext#%"

overload print with print_bool of 100

// from integer.sats
fun add_int0_int0 : (int, int) -> int = "ext#%"
fun sub_int0_int0 : (int, int) -> int = "ext#%"
fun mul_int0_int0 : (int, int) -> int = "ext#%"
fun div_int0_int0 : (int, int) -> int = "ext#%"
//
fun add_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i+j) = "ext#%"
fun sub_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i-j) = "ext#%"
fun mul_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i*j) = "ext#%"
fun div_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i/j) = "ext#%"
//

overload + with add_int0_int0 of 100
overload - with sub_int0_int0 of 100
overload * with mul_int0_int0 of 100
overload / with div_int0_int0 of 100
//
overload + with add_int1_int1 of 120
overload - with sub_int1_int1 of 120
overload * with mul_int1_int1 of 120
overload / with div_int1_int1 of 120
//

fun lt_int0_int0 : (int, int) -> bool = "ext#%"
fun lte_int0_int0 : (int, int) -> bool = "ext#%"
fun gt_int0_int0 : (int, int) -> bool = "ext#%"
fun gte_int0_int0 : (int, int) -> bool = "ext#%"
//
fun eq_int0_int0 : (int, int) -> bool = "ext#%"
fun neq_int0_int0 : (int, int) -> bool = "ext#%"
//
fun lt_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i < j) = "ext#%"
fun lte_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i <= j) = "ext#%"
fun gt_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i > j) = "ext#%"
fun gte_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i >= j) = "ext#%"
//
fun eq_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i == j) = "ext#%"
fun neq_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i != j) = "ext#%"
//
overload < with lt_int0_int0 of 100
overload <= with lte_int0_int0 of 100
overload > with gt_int0_int0 of 100
overload >= with gte_int0_int0 of 100
overload = with eq_int0_int0 of 100
overload != with neq_int0_int0 of 100
overload <> with neq_int0_int0 of 100
//
overload < with lt_int1_int1 of 120
overload <= with lte_int1_int1 of 120
overload > with gt_int1_int1 of 120
overload >= with gte_int1_int1 of 120
overload = with eq_int1_int1 of 120
overload != with neq_int1_int1 of 120
overload <> with neq_int1_int1 of 120
//

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

// from string.sats

fun print_string : (string) -> void = "ext#%"

overload print with print_string of 100
