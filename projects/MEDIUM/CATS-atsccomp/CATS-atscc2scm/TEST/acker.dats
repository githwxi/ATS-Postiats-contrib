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
#include
"{$LIBATSCC2SCM}/staloadall.hats"
//
(* ****** ****** *)
//
extern
fun acker 
  : (int, int) -> int = "mac#acker"
//
implement
acker (m, n) =
(
case+
  (m, n) of 
| (0, _) => n + 1
| (_, 0) => acker(m-1, 1)
| (_, _) => acker(m-1, acker(m, n-1)) 
)
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
val () = println! ("acker(3, 3) = ", acker(3, 3))
//
} (* end of [main0_scm] *)
//
(* ****** ****** *)

(* end of [acker.dats] *)
