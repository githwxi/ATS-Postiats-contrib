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
(*
//
// HX-2014:
// no longer needed  
//
dynload "./game.sats"
//
*)
(* ****** ****** *)

dynload "./game_conf.dats"
dynload "./game_board.dats"

(* ****** ****** *)

dynload "./game_initize.dats"
dynload "./game_mainloop.dats"
dynload "./game_finalize.dats"
  
(* ****** ****** *)

dynload "./game_gtkgui.dats"

(* ****** ****** *)

(*
** Usage:
** ./M-N-K-game 3-3-3
** ./M-N-K-game 19-19-5
*)

implement
main0 (argc, argv) =
{
val () =
if argc >= 2 then
{
  val () = game_initize2 (argv[1])
} (* end of [if] *)
//
val () =
if argc < 2 then game_initize ()
//
val () = fprint_conf (stdout_ref)
//
val ((*loop*)) = game_mainloop ()
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [game.dats] *)
