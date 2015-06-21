(*
** Tetris
*)

(* ****** ****** *)
//
// License: BSD/MIT
//
(* ****** ****** *)
//
// HX-2014-05:
//
// This implementation of Tetris
// is based on a version in Java
// by Mary Ann Sundermeyer (sundma).
// I did it to primarily illustrate
// a way to translate classes in OOP
// into abstract types in ATS. This
// is also somewhat a test for atscc2js
//
(* ****** ****** *)
//
abstype Block_type
typedef Block = Block_type
//
(* ****** ****** *)
//
abstype Piece_type
typedef Piece = Piece_type
//
(* ****** ****** *)
//
#define PDIM 4
#define GROWS 24
#define GCOLS 15
//
abstype GameBoard_type
typedef GameBoard = GameBoard_type
//
(* ****** ****** *)
//
fun theGame_play(): void = "mac#"
fun theGame_auto(): void = "mac#"
fun theGame_stop(): void = "mac#"
//
(* ****** ****** *)

fun theGameStatus_get(): int = "mac#"
fun theGameStatus_set(int): void = "mac#"

(* ****** ****** *)
//
fun theGameTQuota_get(): double = "mac#"
fun theGameTQuota_reset(): void = "mac#"
fun theGameTQuota_update(): void = "mac#"
//
fun theGameTQuota_delta_space(): void = "mac#"
fun theGameTQuota_delta_reset(): void = "mac#"
//
(* ****** ****** *)
//
fun thePiece_get (): Piece = "mac#"
fun thePiece_set (Piece): void = "mac#"
//
fun theNextPiece_get (): Piece = "mac#"
fun theNextPiece_set (Piece): void = "mac#"
//
(* ****** ****** *)
//
fun thePiece_xmove_l(): void
fun thePiece_xmove_r(): void
//
fun thePiece_lrotate(): void
fun thePiece_rrotate(): void
//
(* ****** ****** *)

fun thePiece_start_out(): void = "mac#"

(* ****** ****** *)

fun thePiece_dump_blocks(): void = "mac#"

(* ****** ****** *)

fun thePiece_theNextPiece_update(): void = "mac#"

(* ****** ****** *)
//
fun
theGameBoard_get(): GameBoard = "mac#"
//
fun
theGameBoard_set_at
  (x: int, y: int, Block): void = "mac#"
//
(* ****** ****** *)
//
(*
fun Block_new (): Block = "mac#"
*)
//
// HX: c1: stroke; c2: fill
//
fun
Block_new_c1c2
  (c1: string, c2: string): Block = "mac#"
//
fun Block_null (): Block = "mac#" // JS null obj
fun Block_is_null (Block): bool = "mac#" // is null?
fun Block_isnot_null (Block): bool = "mac#" // is not null?
//
overload iseqz with Block_is_null
overload isneqz with Block_isnot_null
//
(* ****** ****** *)
//
fun
Block_get_x (Block): double = "mac#"
fun
Block_set_x (Block, x: double): void = "mac#"
//
fun
Block_get_y (Block): double = "mac#"
fun
Block_set_y (Block, y: double): void = "mac#"
//
overload .x with Block_get_x
overload .x with Block_set_x
overload .y with Block_get_y
overload .y with Block_set_y
//
(* ****** ****** *)

fun
Block_drop1 (Block): void = "mac#"
fun
Block_unstage (Block): void = "mac#"
  
(* ****** ****** *)
//
fun Piece_update_rand (Piece): void = "mac#"
//
(* ****** ****** *)
//
fun
Piece_get_x (Piece): int = "mac#"
fun
Piece_set_x (Piece, x: int): void = "mac#"
//
fun
Piece_get_y (Piece): int = "mac#"
fun
Piece_set_y (Piece, y: int): void = "mac#"
//
overload .x with Piece_get_x
overload .x with Piece_set_x
overload .y with Piece_get_y
overload .y with Piece_set_y
//
(* ****** ****** *)

fun Piece_xmove_l (Piece): bool = "mac#"
fun Piece_xmove_r (Piece): bool = "mac#"

(* ****** ****** *)

fun Piece_ymove_dn (Piece): bool = "mac#"

(* ****** ****** *)

fun Piece_lrotate (Piece): bool = "mac#"
fun Piece_rrotate (Piece): bool = "mac#"

(* ****** ****** *)
//
fun theGameBoard_clear(): void = "mac#"
fun theGameBoard_rowdel_one(): bool = "mac#"
//
(* ****** ****** *)
//
fun
GameBoard_isset_at
  (GameBoard, x:int, y:int): bool = "mac#"
//
(* ****** ****** *)
//
fun Piece_dump_blocks(Piece): void = "mac#"
//
(* ****** ****** *)
//
fun
theKeyDowns_handle
  (fwork: int -<cloref1> void): void = "mac#"
//
(* ****** ****** *)
//
fun
theAutoplay_fact(): void = "mac#"
//
fun
theGame_autoplay_piece(Piece): void = "mac#"
//
(* ****** ****** *)
//
fun
theGameBoard_iforeach
  (fwork: (int(*i*), int(*j*), bool) -<cloref1> void): void = "mac#"
//
(* ****** ****** *)
//
fun
Piece_iforeach
  (Piece, fwork: (int(*i*), int(*j*), bool) -<cloref1> void): void = "mac#"
//
(* ****** ****** *)

fun tetris_block_initize(): void = "mac#"
fun tetris_piece_initize(): void = "mac#"
fun tetris_keyboard_initize(): void = "mac#"
fun tetris_autoplay_initize(): void = "mac#"
fun tetris_gameboard_initize(): void = "mac#"

(* ****** ****** *)

(* end of [tetris.sats] *)
