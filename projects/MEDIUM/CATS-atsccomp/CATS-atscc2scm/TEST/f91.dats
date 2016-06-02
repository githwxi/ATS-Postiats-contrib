(* ****** ****** *)
//
// HX-2016-05
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
staload"{$LIBATSCC2SCM}/SATS/print.sats"
//
(* ****** ****** *)
//
extern
fun f91 : int -> int = "mac#f91"
//
implement
f91 (x) = if x >= 101 then x - 10 else f91(f91(x+11))
//
(* ****** ****** *)

%{^
;;
(load
 "./libatscc2scm/CATS/basics_cats.scm")
(load
 "./libatscc2scm/CATS/integer_cats.scm")
;;
(load "./libatscc2scm/CATS/print_cats.scm")
;;
%} // end of [%{]

(* ****** ****** *)
//
#define N 10
//
extern 
fun
main0_scm
(
// argumentless
) : void = "mac#"
//
implement
main0_scm () =
{
//
val () = println! ("f91(", N, ") = ", f91(N))
//
} (* end of [main0_scm] *)
//
(* ****** ****** *)

(* end of [f91.dats] *)
