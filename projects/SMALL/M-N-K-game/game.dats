(*
** The M-N-K-tictactoe game
*)

(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)
  
dynload "./game.sats"

(* ****** ****** *)

dynload "./game_initize.dats"
dynload "./game_finalize.dats"
  
(* ****** ****** *)

implement
main0 () = () where
{
//
val () = game_initize ()
//
val () = game_finalize ()
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [game.dats] *)
