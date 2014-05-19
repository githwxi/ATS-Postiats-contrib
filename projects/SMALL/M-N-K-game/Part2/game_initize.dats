(*
** The M-N-K-game
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)

implement
game_initize () =
{
//
val inp = stdin_ref
val out = stdout_ref
//
val () =
fprint (out, "Please choose the parameters M-N-K: ")
val () = fileref_flush (out)
//
val line = fileref_get_line_string (inp)
//
local
//
var line2: string = $UN.strptr2string (line)
//
in (*in-of-local*)
//
val M = string_get_int (line2)
val N = string_get_int (line2)
val K = string_get_int (line2)
//
end // end of [local]
//
val () = strptr_free (line)
//
val () = game_conf_set_m (M)
val () = game_conf_set_n (N)
val () = game_conf_set_k (K)
//
val M = g1ofg0 (M)
val () = assertloc (M >= 3)
val N = g1ofg0 (N)
val () = assertloc (N >= 3)
//
val () = game_conf_set_board (board_make (M, N))
//
} (* end of [game_initize] *)

(* ****** ****** *)

(* end of [game_initize.dats] *)
