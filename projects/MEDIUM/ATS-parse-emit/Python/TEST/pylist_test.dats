(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
"./../prelude/basics_py.sats"
//
staload
"./../prelude/SATS/integer.sats"
//
staload "./../prelude/SATS/list.sats"
staload "./../prelude/SATS/pylist.sats"
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
  : {a:t0p} pylist(a) -> List0(a) = "mac#"
//
implement
pylist2list{a}(xs) = let
//
val res =
pylist_reduce{List0(a)}{a}
  (xs, nil(), lam (xs, x) => cons (x, xs))
//
in
  list_reverse(res)
end // end of [pylist2list]
//
(* ****** ****** *)

%{^
import sys
######
#
from basics_cats import *
#
from integer_cats import *
#
from pylist_cats import *
#
######
sys.setrecursionlimit(1000000)
%}

(* ****** ****** *)

%{$

def fromto(m, n):
  res = []
  for i in range(m, n): res.append (i)
  res.reverse
  return res

xs = fromto(0, 10)
print("xs =", xs)
ys = pylist2list(xs)
print("ys =", ys)
ys_rev = pylist2list_rev(xs)
print("ys_rev =", ys_rev)

%} // end of [%{$]

(* ****** ****** *)

(* end of [pylist_test.dats] *)
