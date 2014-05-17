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

fun
pid2char (id: int): char =
(
case+ id of
| 0 => ' ' | 1 => 'X' | 2 => 'O' | _ => '#'
) (* end of [pid2char] *)

(* ****** ****** *)
//
implement
fprint_board
  (out, board) = let
//
implement
fprint_val<int>
  (out, id) = fprint (out, pid2char(id))
//
val () = fprint (out, "|")
val () = fprint_mtrxszref_sep (out, board, "|", "|\n|")
val () = fprint (out, "|")
//
in
  // nothing
end // end of [fprint_board]
//
(* ****** ****** *)

// (*
val () = // testing code
{
//
val () =
println! ("TESTING(game_board):")
//
val () =
println! ("TESTING(fprint_board): beg")
val board = board_make (3, 3)
val ((*void*)) = fprint_board (stdout_ref, board)
val ((*void*)) = fprint_newline (stdout_ref)
val () =
println! ("TESTING(fprint_board): end")
} (* end of [val] *)
// *)

(* ****** ****** *)

(* end of [game_board.dats] *)
