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
staload
"{$LIBATSCC2SCM}/SATS/reference.sats"
//
(* ****** ****** *)
//
extern
fun
fact : int -> int = "mac#fact"
//
implement
fact (n) = let
//
fun
loop
(
  n: int, res: ref_vt(int)
) : int =
if n > 0
then let
//
val (pf | r) = ref_vt_takeout(res)
val ((*void*)) = ref_vt_addback(pf | res, n * r)
//
in
  loop(n-1, res)
end // end of [then]
else ref_vt_getfree_elt(res) // end of [else]
//
val res = ref_vt{int}(1)
//
in
  loop (n, res)
end // end of [fact]

(* ****** ****** *)

%{^
;;
(load "./libatscc2scm/CATS/basics_cats.scm")
(load "./libatscc2scm/CATS/integer_cats.scm")
;;
%} // end of [%{]

(* ****** ****** *)

(* end of [fact5.dats] *)
