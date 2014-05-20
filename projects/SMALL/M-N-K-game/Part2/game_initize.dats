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
val () = fprint
(out, "Please choose the parameters M-N-K: ")
val () = fileref_flush (out)
//
val line = fileref_get_line_string (inp)
//
val () = game_initize2 ($UN.strptr2string(line))
//
val () = strptr_free (line)
//
} (* end of [game_initize] *)

(* ****** ****** *)

implement
game_initize2 (line) =
{
var line: string = line
//
val M = string_get_int (line)
val N = string_get_int (line)
val K = string_get_int (line)
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
} (* end of [game_initize2.dats] *)

(* ****** ****** *)

(* end of [game_initize.dats] *)
