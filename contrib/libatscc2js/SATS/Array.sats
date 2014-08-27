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

staload "./../basics_js.sats"

(* ****** ****** *)
//
fun
Array_get_at
  {a:t@ype}(Array(a), int): a = "mac#%"
fun
Array_set_at
  {a:t@ype}(Array(a), int, a): void = "mac#%"
//
(* ****** ****** *)
//
fun
Array_get_length
  {a:t@ype} (A: Array(a)): int = "mac#%"
fun
Array_set_length
  {a:t@ype} (A: Array(a), n: intGte(0)): void = "mac#%"
//
(* ****** ****** *)
//
overload [] with Array_get_at
overload [] with Array_set_at
//
overload .length with Array_get_length
overload .length with Array_set_length
//
(* ****** ****** *)

(* end of [Array.sats] *)
