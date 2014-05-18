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

fun board_make
  (m: intGte(2), n: intGte(2)): board

fun print_board (board): void
fun prerr_board (board): void
fun fprint_board (FILEref, board): void

(* ****** ****** *)
//
// HX-2014-05:
// checking if there is a K-piece sequence of
// the same kind that contains the position (i, j)
//
fun board_check_at (board, i: int, j: int): bool
//
(* ****** ****** *)

fun game_initize ((*void*)): void
fun game_mainloop ((*void*)): void
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
