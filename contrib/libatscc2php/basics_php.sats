(*
** For writing ATS code
** that translates into PHP
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2phppre_"
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

abstype PHPfile

(* ****** ****** *)
//
abstype PHParray(a:t@ype) // risk on your own!!!
abstype PHParref(a:t@ype) // reference to PHParray
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
fun fprint_newline (out: PHPfile): void = "mac#%"

(* ****** ****** *)
//
fun assert_errmsg_bool0
  (x: bool, msg: string): void = "mac#%"
fun assert_errmsg_bool1
  {b:bool} (x: bool b, msg: string): [b] void = "mac#%"
//
overload assert_errmsg with assert_errmsg_bool0 of 100
overload assert_errmsg with assert_errmsg_bool1 of 110
//
(* ****** ****** *)
//
macdef assertloc (x) = assert_errmsg (,(x), $mylocation)
//
(* ****** ****** *)

(* end of [basics_php.sats] *)
