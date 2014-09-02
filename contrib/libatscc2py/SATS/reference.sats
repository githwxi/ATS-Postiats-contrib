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
ATS_EXTERN_PREFIX "ats2pypre_"
//
(* ****** ****** *)

staload "./../basics_py.sats"

(* ****** ****** *)
//
fun ref{a:t0p}(x: a): ref(a) = "mac#%"
//
fun
ref_make_elt{a:t0p} (x: a): ref(a) = "mac#%"
//
(* ****** ****** *)
//
fun
ref_get_elt{a:t0p} (r: ref a): a = "mac#%"
fun
ref_set_elt{a:t0p} (r: ref a, x: a): void = "mac#%"
//
(* ****** ****** *)

overload [] with ref_get_elt of 100
overload [] with ref_set_elt of 100

(* ****** ****** *)

(* end of [reference.sats] *)
