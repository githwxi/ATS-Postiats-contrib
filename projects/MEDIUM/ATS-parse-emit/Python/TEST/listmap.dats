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
//
implement
list_map (xs, f) =
(
case+ xs of
| list_nil () => list_nil ()
| list_cons (x, xs) => list_cons (f(x), list_map (xs, f))
) (* end of [list_map] *)
//
(* ****** ****** *)
//
extern
fun
fromto
  : (int, int) -> List0 (int) = "mac#fromto"
//
implement
fromto (m, n) =
if m < n
  then list_cons (m, fromto (m+1, n)) else list_nil ()
// end of [if]
//
(* ****** ****** *)
//
extern
fun
test : (int, int) -> List0(int) = "mac#test"
//
implement
test (m, n) = let
  val xs = fromto (m, n)
in
  list_map{int}{int} (xs, lam x => m * n * x)
end // end of [test]
//
(* ****** ****** *)

%{^
import sys
######
from basics_cats import *
from integer_cats import *
######
sys.setrecursionlimit(1000000)
%}

(* ****** ****** *)

%{$
//
xs2 = test(5, 10)
print("xs2 = ", xs2)
%} // end of [%{$]

(* ****** ****** *)

(* end of [listmap.dats] *)
