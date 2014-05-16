(*
** The M-N-K-game
*)

(* ****** ****** *)
//
// Game config-info
//
fun game_conf_get_m (): int
fun game_conf_get_n (): int
fun game_conf_get_k (): int

(* ****** ****** *)

abstype board_type
typedef board = board_type

(* ****** ****** *)

fun print_board (board): void
fun prerr_board (board): void
fun fprint_board (FILEref, board): void

(* ****** ****** *)

fun game_initize ((*void*)): void
fun game_mainloop ((*void*)): void
fun game_finalize ((*void*)): void

(* ****** ****** *)

(* end of [game.sats] *)
