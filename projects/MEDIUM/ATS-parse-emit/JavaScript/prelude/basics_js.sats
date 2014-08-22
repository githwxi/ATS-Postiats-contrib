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
fun
print_obj{a:t@ype}(obj: a): void = "mac#%"
fun
println_obj{a:t@ype}(obj: a): void = "mac#%"
//
(* ****** ****** *)

fun print_newline ((*void*)): void = "mac#%"

(* ****** ****** *)

(* end of [basics_js.sats] *)
