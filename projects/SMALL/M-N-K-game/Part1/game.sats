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

(* ****** ****** *)

fun fprint_config (FILEref): void

(* ****** ****** *)

abstype board_type
typedef board = board_type

(* ****** ****** *)

fun board_make
  (m: intGte(2), n: intGte(2)): board

fun print_board (board): void
fun prerr_board (board): void
fun fprint_board (FILEref, board): void

(* ****** ****** *)

fun game_initize ((*void*)): void
fun game_mainloop ((*void*)): void
fun game_finalize ((*void*)): void

(* ****** ****** *)

(* end of [game.sats] *)
