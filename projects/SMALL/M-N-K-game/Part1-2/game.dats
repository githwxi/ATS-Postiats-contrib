(*
** The M-N-K-game
*)

(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)
  
dynload "./game.sats"

(* ****** ****** *)

dynload "./game_conf.dats"
dynload "./game_board.dats"

(* ****** ****** *)

dynload "./game_initize.dats"
dynload "./game_mainloop.dats"
dynload "./game_finalize.dats"
  
(* ****** ****** *)

implement
main0 () = () where
{
//
val () = game_initize ()
//
val () = fprint_conf (stdout_ref)
//
val () = game_mainloop ()
//
(*
val () = game_finalize ()
*)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [game.dats] *)
