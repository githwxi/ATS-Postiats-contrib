(*
** The M-N-K-game
*)

(* ****** ****** *)
//
// Game config-info
//
fun game_conf_get_m (): int // the M of M-N-K
fun game_conf_get_n (): int // the N of M-N-K
fun game_conf_get_k (): int // the K of M-N-K
//
fun game_conf_set_m (int): void // the M of M-N-K
fun game_conf_set_n (int): void // the N of M-N-K
fun game_conf_set_k (int): void // the K of M-N-K
//
(* ****** ****** *)

fun fprint_conf (FILEref): void

(* ****** ****** *)

abstype board_type = ptr
typedef board = board_type

(* ****** ****** *)

fun board_nrow (board): intGte(0)
fun board_ncol (board): intGte(0)
fun board_get_at (board, int, int): int(*pid*)
fun board_set_at (board, int, int, int(*pid*)): void

(* ****** ****** *)

fun board_make
  (m: intGte(3), n: intGte(3)): board

(* ****** ****** *)

fun board_reset (board): void

(* ****** ****** *)

fun print_board (board): void
fun prerr_board (board): void
fun fprint_board (FILEref, board): void

(* ****** ****** *)
//
fun board_mark_at
  (board, pid: int, i: int, j: int): bool
//
(* ****** ****** *)
//
// HX-2014-05:
// checking if there is a K-piece sequence of
// the same kind that contains the position (i, j)
//
fun board_check_at (board, i: int, j: int): bool
//
(* ****** ****** *)

fun game_conf_get_board (): board
fun game_conf_set_board (board): void

(* ****** ****** *)

fun game_initize ((*void*)): void

(* ****** ****** *)
//
fun the_X_get (): int
fun the_Y_get (): int
fun the_X_set (i: int): void
fun the_Y_set (i: int): void
//
fun the_pid_get (): int
fun the_pid_set (pid: int): void
//
fun game_mainloop ((*void*)): void
//
(* ****** ****** *)

fun game_finalize ((*void*)): void

(* ****** ****** *)
//
// game_mylib
//
(* ****** ****** *)

(*
** HX-2014-05:
** Given a string, this function skips
** non-digit letters, reads out an integer,
** and then puts the rest of the string back
** into the call-by-reference argument
*)
fun string_get_int (inp: &string >> _): int

(* ****** ****** *)

(* end of [game.sats] *)
