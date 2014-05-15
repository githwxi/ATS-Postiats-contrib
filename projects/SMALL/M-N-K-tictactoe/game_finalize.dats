(*
** The M-N-K-tictactoe game
*)

(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)

implement
game_finalize () =
{
//
val () = println! ("game_finalize: enter")
val () = println! ("game_finalize: leave")
//
} (* end of [game_finalize] *)

(* ****** ****** *)

(* end of [game_finalize.dats] *)
