(* ****** ****** *)
//
// HX-2015-06:
// list insertion sort
// for testing patsolve-z3
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "{$EXTSOLVE}/SATS/ilist.sats"
staload "{$EXTSOLVE}/SATS/gfarray.sats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
prval () = $solver_assert(lemma_length_0)
(*
prval () = $solver_assert(lemma_length_1)
*)
prval () = $solver_assert(lemma_length_isnat)
//
(* ****** ****** *)

(* end of [gfarray_insort.dats] *)
