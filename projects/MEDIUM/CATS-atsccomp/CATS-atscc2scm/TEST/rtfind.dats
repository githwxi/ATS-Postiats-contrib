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
fun rtfind (f: int -> int): int = "mac#"
//
implement
rtfind (f) = let
//
fun loop
(
  f: int -> int, i: int
) : int =
  if f (i) = 0 then i else loop (f, i+1)
//
in
  loop (f, 0(*i*))
end // end of [rtfind]

(* ****** ****** *)

%{^
;;
(load "./libatscc2scm/CATS/basics_cats.scm")
(load "./libatscc2scm/CATS/integer_cats.scm")
;;
%} // end of [%{]

(* ****** ****** *)

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
val
poly0 = lam(x:int): int => x*x + x - 6
//
val () =
println! ("rtfind(lambda x: x*x + x - 6) = ", rtfind(poly0))
//
} (* end of [main0_scm] *)

(* ****** ****** *)

(* end of [rtfind.dats] *)
