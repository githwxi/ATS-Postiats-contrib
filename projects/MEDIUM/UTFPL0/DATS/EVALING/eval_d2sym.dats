(*
** Implementing UTFPL
** with closure-based evaluation
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
"./../../SATS/utfpl.sats"
staload
"./../../SATS/utfpleval.sats"
//
(* ****** ****** *)
//
staload
"./../../SATS/EVALING/evaling.sats"
//
(* ****** ****** *)

implement
eval_d2sym
  (env, d2s) = let
  val opt = the_d2symmap_find (d2s)
in
  case+ opt of
  | ~Some_vt (def) => def | ~None_vt () => VALsym (d2s)
end // end of [eval_d2sym]

(* ****** ****** *)

(* end of [eval_d2sym.dats] *)
