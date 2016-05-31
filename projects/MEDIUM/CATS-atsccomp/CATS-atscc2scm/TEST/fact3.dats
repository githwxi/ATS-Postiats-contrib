(* ****** ****** *)
//
// HX-2016-05:
// A running example
// from ATS2 to Scheme
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2SCM}/SATS/integer.sats"
//
(* ****** ****** *)
//
extern
fun
fact : int -> int = "mac#fact"
//
implement
fact (n) =
case+ n of
| 0 when n = 0 => 1 | _ => n * fact(n-1)
//
(* ****** ****** *)

%{^
;;
(load "./libatscc2scm/CATS/basics_cats.scm")
(load "./libatscc2scm/CATS/integer_cats.scm")
;;
%} // end of [%{]

(* ****** ****** *)

(* end of [fact3.dats] *)
