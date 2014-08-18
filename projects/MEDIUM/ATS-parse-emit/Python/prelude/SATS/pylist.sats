(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define ATS_EXTERN_PREFIX "ats2pypre_"
//
(* ****** ****** *)
//
staload
"./../basics_py.sats" // Python datatypes
//
(* ****** ****** *)

fun
pylist_nil{a:t0p} (): pylist(a) = "mac#"

(* ****** ****** *)

fun
pylist_is_nil{a:t0p} (xs: pylist(a)): bool = "mac#"
fun
pylist_isnot_nil{a:t0p} (xs: pylist(a)): bool = "mac#"

(* ****** ****** *)
//
fun
pylist_append{a:t0p}
  (xs1: pylist(a), x2: a): void = "mac#"
//
(* ****** ****** *)
//
fun
pylist_extend{a:t0p}
  (xs1: pylist(a), xs2: pylist(a)): void = "mac#"
//
(* ****** ****** *)
//
fun
pylist_pop_0{a:t0p} (xs: pylist(a)): (a)
fun
pylist_pop_1{a:t0p} (xs: pylist(a), i: intGte(0)): (a)
//
symintr pylist_pop
overload pylist_pop with pylist_pop_0
overload pylist_pop with pylist_pop_1
//  
(* ****** ****** *)
//
fun
pylist_insert{a:t0p}
  (xs: pylist(a), i: intGte(0), x: a): void = "mac#"
//
(* ****** ****** *)
//
fun
pylist_reverse{a:t0p} (xs: pylist(a)): void = "mac#"
//
(* ****** ****** *)
//
fun
pylist_map
  {a:t0p}{b:t0p}
  (xs: pylist(a), f: (a) -> b): pylist(b) = "mac#"
//
fun
pylist_map2
  {a1,a2:t0p}{b:t0p}
(
  xs1: pylist(a1), xs2: pylist(a2), f: (a1, a2) -> b
) : pylist(b) = "mac#" // end of [pylist_map2]
//
(* ****** ****** *)
//
fun
pylist_filter{a:t0p}
  (xs: pylist(a), p: (a) -> bool): pylist(a) = "mac#"
//
(* ****** ****** *)
//
fun
pylist_reduce{a:t0p}{b:t0p}
  (xs: pylist(b), ini: a, f: (a, b) -> a): (a) = "mac#"
//
(* ****** ****** *)

(* end of [basics.sats] *)
