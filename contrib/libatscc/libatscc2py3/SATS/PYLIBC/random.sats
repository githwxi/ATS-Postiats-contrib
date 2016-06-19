(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX
"ats2pylibc_random_"
//
(* ****** ****** *)
//
staload "./../../basics_py.sats"
//
(* ****** ****** *)
//
fun random(): double = "mac#%"
//
fun randint(int, int): double = "mac#%"
//
fun uniform(double, double): double = "mac#%"
//
(* ****** ****** *)

(* end of [random.sats] *)
