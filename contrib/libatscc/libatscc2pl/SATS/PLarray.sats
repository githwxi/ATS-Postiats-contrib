(*
** For writing ATS code
** that translates into Perl
*)

(* ****** ****** *)
//
// HX-2014-11-17:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2plpre_"
//
(* ****** ****** *)

staload "./../basics_pl.sats"

(* ****** ****** *)
//
fun
PLarray_nil{a:t0p}(): PLarray(a) = "mac#%"
fun
PLarray_sing{a:t0p}(a): PLarray(a) = "mac#%"
fun
PLarray_pair{a:t0p}(a, a): PLarray(a) = "mac#%"
//
(* ****** ****** *)
//
fun
PLarray_get_at
  {a:t@ype}(PLarray(a), int): a = "mac#%"
fun
PLarray_set_at
  {a:t@ype}(PLarray(a), int, a): void = "mac#%"
//
(* ****** ****** *)
//
fun
PLarray_length{a:t@ype}(PLarray(a)): int = "mac#%"
//
(* ****** ****** *)
//
fun
PLarray_pop{a:t@ype}(A: PLarray(a)): a = "mac#%"
fun
PLarray_push{a:t@ype}(A: PLarray(a), x: a): void = "mac#%"
//
(* ****** ****** *)
//
// Some function overloading
//
(* ****** ****** *)
//
overload [] with PLarray_get_at
overload [] with PLarray_set_at
//
overload length with PLarray_length
//
(* ****** ****** *)

(* end of [PLarray.sats] *)
