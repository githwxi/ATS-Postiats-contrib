(*
** The M-N-K-game
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)

assume
board_type = mtrxszref (int)

(* ****** ****** *)
//
implement
board_make (m, n) =
  mtrxszref_make_elt<int> (i2sz(m), i2sz(n), 0)
//
(* ****** ****** *)

(* end of [game_board.dats] *)
