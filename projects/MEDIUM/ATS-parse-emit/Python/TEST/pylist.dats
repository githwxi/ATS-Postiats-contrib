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
extern
fun pylist2list
  : {a:t0p} pylist(a) -> List0(a)
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

(* end of [pylist.dats] *)
