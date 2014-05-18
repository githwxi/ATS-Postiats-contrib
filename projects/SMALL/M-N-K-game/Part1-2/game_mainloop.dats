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

#define PLAYER1 1
#define PLAYER2 2

(* ****** ****** *)
//
extern
fun fprint_the_board (FILEref): void
implement
fprint_the_board (out) =
  fprint_board (out, game_conf_get_board())
//
(* ****** ****** *)
//
extern
fun the_board_mark_at
  (pid: int, i: int, j: int): bool
extern
fun the_board_check_at
  (pid: int, i: int, j: int): bool
//
(* ****** ****** *)

implement
the_board_mark_at
  (pid, i, j) = let
//
val board = game_conf_get_board ()
//
in
  board_mark_at (board, pid, i, j)
end // end of [the_board_mark_at]

implement
the_board_check_at
  (pid, i, j) = let
//
val board = game_conf_get_board ()
//
in
  board_check_at (board, i, j)
end // end of [the_board_check_at]

(* ****** ****** *)

extern
fun player1_move (): (int, int)
extern
fun player2_move (): (int, int)

(* ****** ****** *)

implement
player1_move () = let
//
val inp = stdin_ref
val line = fileref_get_line_string (inp)
var line2: string = $UN.strptr2string (line)
val i = string_get_int (line2)
val j = string_get_int (line2)
val () = strptr_free (line)
//
in
  (i, j)
end // end of [player1_move]

(* ****** ****** *)

implement
player2_move () = let
//
val inp = stdin_ref
val line = fileref_get_line_string (inp)
var line2: string = $UN.strptr2string (line)
val i = string_get_int (line2)
val j = string_get_int (line2)
val () = strptr_free (line)
//
in
  (i, j)
end // end of [player2_move]

(* ****** ****** *)

exception WinnerExn of (int)

(* ****** ****** *)

extern
fun game_mainloop2 ((*void*)): void

(* ****** ****** *)

implement
game_mainloop () = let
//
val out = stdout_ref
val () = fprintln! (out, "M-N-K-game starts")
//
in
//
try let
  val () = game_mainloop2 ()
in
  // nothing
end with
  | ~WinnerExn
      (pid) => let
      val () = fprint_the_board (out)
      val () = fprint_newline (out)
      val () = fprintln! (out, "Player", pid, " is the winner!")
    in
      // nothing
    end // end of [WinnerExn]
//
end (* end of [game_mainloop] *)

(* ****** ****** *)

implement
game_mainloop2 () =
{
//
val inp = stdin_ref
val out = stdout_ref
//
val () = (
  fprint_the_board (out); fprint_newline (out)
) (* end of [val] *)
//
val () =
fprint (out, "Player1's turn: ")
val () = fileref_flush (out)
val (i, j) = player1_move ()
val error = the_board_mark_at (PLAYER1, i, j)
val result = the_board_check_at (PLAYER1, i, j)
val () = if result then $raise WinnerExn(PLAYER1)
//
val () = (
  fprint_the_board (out); fprint_newline (out)
) (* end of [val] *)
//
val () =
fprint (out, "Player2's turn: ")
val () = fileref_flush (out)
val (i, j) = player2_move ()
val error = the_board_mark_at (PLAYER2, i, j)
val result = the_board_check_at (PLAYER2, i, j)
val () = if result then $raise WinnerExn(PLAYER2)
//
val () = game_mainloop2 ()
//
} (* end of [game_mainloop2] *)

(* ****** ****** *)

(* end of [game_mainloop.dats] *)
