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
#include
"{$LIBATSCC2SCM}/staloadall.hats"
//
(* ****** ****** *)
//
extern
fun fact : int -> int = "mac#fact"
//
implement
fact (n) = if n > 0 then n * fact(n-1) else 1
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
val () = println! ("fact(", N, ") = ", fact(N))
//
} (* end of [main0_scm] *)
//
(* ****** ****** *)

(* end of [fact.dats] *)
