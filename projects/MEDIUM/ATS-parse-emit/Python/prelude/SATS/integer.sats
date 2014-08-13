(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX: prefix for external names
//
#define ATS_EXTERN_PREFIX "atspre2py_"
//
(* ****** ****** *)
//
fun succ_int0 : int -> int = "mac#%"
fun pred_int0 : int -> int = "mac#%"
//
fun succ_int1
  : {i:int} int(i) -> int(i+1) = "mac#%"
fun pred_int1
  : {i:int} int(i) -> int(i-1) = "mac#%"
//
(* ****** ****** *)
//
fun add_int0_int0: (int, int) -> int = "mac#%"
fun sub_int0_int0 : (int, int) -> int = "mac#%"
fun mul_int0_int0 : (int, int) -> int = "mac#%"
fun div_int0_int0 : (int, int) -> int = "mac#%"
//
fun add_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i+j) = "mac#%"
fun sub_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i-j) = "mac#%"
fun mul_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i*j) = "mac#%"
fun div_int1_int1
  : {i,j:int} (int(i), int(j)) -> int(i/j) = "mac#%"
//
(* ****** ****** *)
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
(* ****** ****** *)
//
fun lt_int0_int0: (int, int) -> bool = "mac#%"
fun lte_int0_int0: (int, int) -> bool = "mac#%"
fun gt_int0_int0: (int, int) -> bool = "mac#%"
fun gte_int0_int0: (int, int) -> bool = "mac#%"
//
fun eq_int0_int0: (int, int) -> bool = "mac#%"
fun neq_int0_int0: (int, int) -> bool = "mac#%"
//
fun lt_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i < j) = "mac#%"
fun lte_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i <= j) = "mac#%"
fun gt_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i > j) = "mac#%"
fun gte_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i >= j) = "mac#%"
//
fun eq_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i == j) = "mac#%"
fun neq_int1_int1
  : {i,j:int} (int(i), int(j)) -> bool(i != j) = "mac#%"
//
(* ****** ****** *)
//
overload < with lt_int0_int0 of 100
overload <= with lte_int0_int0 of 100
overload > with gt_int0_int0 of 100
overload >= with gte_int0_int0 of 100
overload = with eq_int0_int0 of 100
overload != with neq_int0_int0 of 100
//
overload < with lt_int1_int1 of 120
overload <= with lte_int1_int1 of 120
overload > with gt_int1_int1 of 120
overload >= with gte_int1_int1 of 120
overload = with eq_int1_int1 of 120
overload != with neq_int1_int1 of 120
//
(* ****** ****** *)

(* end of [integer.sats] *)
