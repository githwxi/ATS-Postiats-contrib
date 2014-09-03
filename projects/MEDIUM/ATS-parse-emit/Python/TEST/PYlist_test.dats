(* ****** ****** *)
//
// HX-2014-08:
// A running example
// from ATS2 to Python3
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PY}/basics_py.sats"
staload
"{$LIBATSCC2PY}/SATS/integer.sats"
staload
"{$LIBATSCC2PY}/SATS/list.sats"
staload
"{$LIBATSCC2PY}/SATS/PYlist.sats"
//
(* ****** ****** *)

implement
list_reverse{a}(xs) =
(
  list_reverse_append{a}(xs, list_nil(*void*))
) (* end of [list_reverse] *)

(* ****** ****** *)

implement
list_reverse_append
  {a}(xs, ys) = let
//
prval () = lemma_list_param (xs)
prval () = lemma_list_param (ys)
//
fun
loop{i,j:nat}
(
  xs: list(a, i), ys: list(a, j)
) : list(a, i+j) =
(
case+ xs of
| list_nil () => ys
| list_cons (x, xs) => loop (xs, list_cons (x, ys))
) (* end of [loop] *)
//
in
  loop (xs, ys)
end // end of [list_reverse_append]

(* ****** ****** *)
//
extern
fun pylist2list
  : {a:t0p} PYlist(a) -> List0(a) = "mac#"
//
implement
PYlist2list{a}(xs) = let
//
val res =
PYlist_reduce{List0(a)}{a}
  (xs, nil(), lam (xs, x) => cons (x, xs))
//
in
  list_reverse(res)
end // end of [PYlist2list]
//
(* ****** ****** *)

%{^
import sys
sys.setrecursionlimit(1000000)
######
#
from ats2pypre_basics_cats import *
from ats2pypre_integer_cats import *
#
from ats2pypre_PYlist_cats import *
#
######
%} // end of [%{^]

(* ****** ****** *)

%{$

def fromto(m, n):
  res = []
  for i in range(m, n): res.append (i)
  res.reverse
  return res

xs = fromto(0, 10)
print("xs =", xs)
ys = PYlist2list(xs)
print("ys =", ys)
ys_rev = PYlist2list_rev(xs)
print("ys_rev =", ys_rev)

%} // end of [%{$]

(* ****** ****** *)

(* end of [PYlist_test.dats] *)
