(*
** The M-N-K-game
*)

(* ****** ****** *)

#define
ATS_PACKNAME "M_N_K_game"

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "./game.sats"
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#define PLAYER1 1
#define PLAYER2 2

(* ****** ****** *)

staload X = {
//
typedef T = int
//
fun
initize (x: &T? >> T): void = x := ~1
//
#include "share/atspre_define.hats"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

implement the_X_get () = $X.get ()
implement the_X_set (i) = $X.set (i)

(* ****** ****** *)

staload Y = {
//
typedef T = int
//
fun
initize (x: &T? >> T): void = x := ~1
//
#include "share/atspre_define.hats"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

implement the_Y_get () = $Y.get ()
implement the_Y_set (i) = $Y.set (i)

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

local

fun
player_move
(
// argless
) : (int, int) = let
//
val () = interaction_loop ()
//
in
  (the_X_get(), the_Y_get())
end // end of [player_move]

in (* in of [local] *)

implement
player1_move () = player_move ()
implement
player2_move () = player_move ()

end // end of [local]

(* ****** ****** *)

exception WinnerExn of (int(*pid*))

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
      val () = fprintln! (out, "Game Over: Player", pid, " is the winner!")
    in
      game_finalize ()
    end // end of [WinnerExn]
// end of [try-with]
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
val () =
fprint (out, "Player1's turn (x-y): ")
val () = fileref_flush (out)
val (i, j) = player1_move ()
val () = fprintln! (out, i, "-", j)
//
val done = the_board_mark_at (PLAYER1, i, j)
val () =
if not(done)
  then fprintln! (out, "Player1: illegal move!")
// end of [if]
//
val result = the_board_check_at (PLAYER1, i, j)
val () = if result then $raise WinnerExn(PLAYER1)
//
val () =
fprint (out, "Player2's turn (x-y): ")
val () = fileref_flush (out)
val (i, j) = player2_move ()
val () = fprintln! (out, i, "-", j)
//
val done = the_board_mark_at (PLAYER2, i, j)
val () =
if not(done)
  then fprintln! (out, "Player2: illegal move!")
// end of [if]
//
val result = the_board_check_at (PLAYER2, i, j)
val () = if result then $raise WinnerExn(PLAYER2)
//
val () = game_mainloop2 ()
//
} (* end of [game_mainloop2] *)

(* ****** ****** *)

(* end of [game_mainloop.dats] *)
