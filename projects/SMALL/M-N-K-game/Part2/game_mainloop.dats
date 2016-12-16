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

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./game.sats"
staload "./game_gtkgui.sats"

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
#include "{$LIBATSHWXI}/globals/HATS/globvar.hats"
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
#include "{$LIBATSHWXI}/globals/HATS/globvar.hats"
//
} (* end of [staload] *)

implement the_Y_get () = $Y.get ()
implement the_Y_set (i) = $Y.set (i)

(* ****** ****** *)

staload PID = {
//
typedef T = int
//
fun
initize (x: &T? >> T): void = x := 0
//
#include "share/atspre_define.hats"
#include "{$LIBATSHWXI}/globals/HATS/globvar.hats"
//
} (* end of [staload] *)

implement the_pid_get () = $PID.get ()
implement the_pid_set (pid) = $PID.set (pid)

(* ****** ****** *)
//
extern
fun
fprint_the_board (FILEref): void
//
implement
fprint_the_board (out) =
fprint_board (out, game_conf_get_board())
//
(* ****** ****** *)
//
extern
fun
the_board_mark_at
  (pid: int, i: int, j: int): bool
//
extern
fun
the_board_check_at
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
val () = game_gtkgui_enter ()
val () = game_gtkgui_return ()
//
in
  (the_X_get(), the_Y_get())
end // end of [player_move]

in (* in of [local] *)

implement
player1_move () =
  let val () = the_pid_set(PLAYER1) in player_move() end
implement
player2_move () =
  let val () = the_pid_set(PLAYER2) in player_move() end

end // end of [local]

(* ****** ****** *)

exception WinnerExn of (int(*pid*))

(* ****** ****** *)

extern
fun
game_mainloop2 ((*void*)): void

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
      val () =
        fprint_the_board(out)
      // end of [val]
      val () = fprint_newline(out)
      val () = fprintln! (out, "Game Over: Player", pid, " is the winner!")
    in
      game_finalize((*void*))
    end // end of [WinnerExn]
// end of [try-with]
//
end (* end of [game_mainloop] *)

(* ****** ****** *)

implement
game_mainloop2() =
{
//
val inp = stdin_ref
val out = stdout_ref
//
val () =
fprint(out, "Player1's turn (x-y): ")
//
val () = fileref_flush (out)
val ij = player1_move ()
val () = fprintln! (out, ij.0, "-", ij.1)
//
val
done = the_board_mark_at(PLAYER1, ij.0, ij.1)
//
val () =
if not(done)
  then fprintln! (out, "Player1: illegal move!")
// end of [if]
//
val
result =
the_board_check_at(PLAYER1, ij.0, ij.1)
val () =
if result then $raise WinnerExn(PLAYER1)
//
val () =
fprint(out, "Player2's turn (x-y): ")
//
val () = fileref_flush(out)
val ij = player2_move()
val () = fprintln!(out, ij.0, "-", ij.1)
//
val
done = the_board_mark_at(PLAYER2, ij.0, ij.1)
//
val () =
if not(done)
  then fprintln! (out, "Player2: illegal move!")
// end of [if]
//
val
result =
the_board_check_at (PLAYER2, ij.0, ij.1)
val () =
if result then $raise WinnerExn(PLAYER2)
//
val () = game_mainloop2 ()
//
} (* end of [game_mainloop2] *)

(* ****** ****** *)

(* end of [game_mainloop.dats] *)
