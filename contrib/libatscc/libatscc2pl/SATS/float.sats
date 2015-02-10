(*
** For writing ATS code
** that translates into Perl
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2plpre_"
//
(* ****** ****** *)
//
fun double2int (x: double): int = "mac#%"
fun int_of_double (x: double): int = "mac#%"
//
fun int2double (x: int): double = "mac#%"
fun double_of_int (x: int): double = "mac#%"
//
(* ****** ****** *)

fun abs_double : (double) -> double = "mac#%"
fun neg_double : (double) -> double = "mac#%"

(* ****** ****** *)

overload abs with abs_double of 100
overload neg with neg_double of 100

(* ****** ****** *)

fun succ_double : (double) -> double = "mac#%"
fun pred_double : (double) -> double = "mac#%"

(* ****** ****** *)

overload succ with succ_double of 100
overload pred with pred_double of 100

(* ****** ****** *)

typedef
float_aop_type = (double, double) -> double

(* ****** ****** *)
//
fun add_double_double : float_aop_type = "mac#%"
fun sub_double_double : float_aop_type = "mac#%"
fun mul_double_double : float_aop_type = "mac#%"
fun div_double_double : float_aop_type = "mac#%"
//
(* ****** ****** *)
//
overload + with add_double_double of 100
overload - with sub_double_double of 100
overload * with mul_double_double of 100
overload / with div_double_double of 100
//
(* ****** ****** *)

typedef
float_cmp_type = (double, double) -> bool

(* ****** ****** *)
//
fun lt_double_double : float_cmp_type = "mac#%"
fun lte_double_double : float_cmp_type = "mac#%"
fun gt_double_double : float_cmp_type = "mac#%"
fun gte_double_double : float_cmp_type = "mac#%"
//
fun eq_double_double : float_cmp_type = "mac#%"
fun neq_double_double : float_cmp_type = "mac#%"
//
(* ****** ****** *)
//
overload < with lt_double_double of 100
overload <= with lte_double_double of 100
overload > with gt_double_double of 100
overload >= with gte_double_double of 100
overload = with eq_double_double of 100
overload != with neq_double_double of 100
overload <> with neq_double_double of 100
//
(* ****** ****** *)

(* end of [float.sats] *)
