(* ****** ****** *)
//
// HX-2015-07:
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
"{$LIBATSCC2SCM}/basics_scm.sats"
staload
"{$LIBATSCC2SCM}/SATS/integer.sats"
//
(* ****** ****** *)

%{^
;;
(load "./libatscc2scm/CATS/basics_cats.scm")
(load "./libatscc2scm/CATS/integer_cats.scm")
;;
%} // end of [%{]

(* ****** ****** *)
//
fnx isevn_ (n: int): bool =
  if n > 0 then isodd_(n-1) else true
and isodd_ (n: int): bool =
  if n > 0 then isevn_(n-1) else false
//
(* ****** ****** *)
//
extern
fun isevn
  : (int) -> bool = "mac#isevn"
extern
fun isodd
  : (int) -> bool = "mac#isodd"
//
implement isevn (x) = isevn_(x)
implement isodd (x) = if x > 0 then isevn_(x-1) else false
//
(* ****** ****** *)

(* end of [isevn.dats] *)
