(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_"
//
(* ****** ****** *)
//
typedef
cfun1 (a:t0p, b:t0p) = (a) -<cloref1> b
typedef
cfun2 (a1:t0p, a2:t0p, b:t0p) = (a1, a2) -<cloref1> b
//
stadef cfun = cfun1
stadef cfun = cfun2
//
(* ****** ****** *)
//
symintr .length
//
(* ****** ****** *)
//
abstype JSstring // obj
//
abstype JSarray(a:t@ype)
//
(* ****** ****** *)
//
fun typeof{a:t@ype}(a): string = "mac#%"
//
(* ****** ****** *)

fun alert{a:t@ype}(obj: a): void = "mac#%"

(* ****** ****** *)

(* end of [basics_js.sats] *)
