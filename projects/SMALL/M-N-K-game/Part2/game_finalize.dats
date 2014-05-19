(*
** The M-N-K-game
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./game.sats"
staload "./game_gtkgui.sats"

(* ****** ****** *)
//
fun the_board_reset (): void =
  board_reset (game_conf_get_board ())
//
(* ****** ****** *)

implement
game_finalize () = let
//
val inp = stdin_ref
val out = stdout_ref
//
val () =
fprint (out, "Playing another game? (Y/N): ")
val () = fileref_flush (out)
//
val line = fileref_get_line_string (inp)
val c0 = $UN.ptr0_get<char> (strptr2ptr (line))
val c0 = toupper (c0)
val () = strptr_free (line)
//
in
//
case+ c0 of
| 'Y' => {
    val () = the_board_reset ()
    val () = the_buttonlst_reset ()
    val () = game_mainloop ((*void*))
  }
| _(*quit*) =>
  {
    val () = fprintln! (out, "Good-bye!")
  }
//
end (* end of [game_finalize] *)

(* ****** ****** *)

(* end of [game_finalize.dats] *)
