(*
** Tetris
*)

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
fun Piece_get_x (Piece): int
fun Piece_set_x (Piece, x: int): void
//
fun Piece_get_y (Piece): int
fun Piece_set_y (Piece, y: int): void
//
overload .x with Piece_get_x
overload .x with Piece_set_x
overload .y with Piece_get_y
overload .y with Piece_set_y
//
(* ****** ****** *)
//
#define GROWS 36
#define GCOLS 20
//
abstype GameBoard_type
typedef GameBoard = GameBoard_type
//
(* ****** ****** *)

fun isGameOver(): bool = "mac#"

(* ****** ****** *)
//
fun thePiece_get (): Piece = "mac#"
fun thePiece_set (Piece): void = "mac#"
//
fun theNextPiece_get (): Piece = "mac#"
fun theNextPiece_set (Piece): void = "mac#"
//
(* ****** ****** *)

fun theGameBoard_get(): GameBoard = "mac#"

(* ****** ****** *)
//
fun Block_new (): Block = "mac#"
//
fun Block_null (): Block = "mac#" // JS null obj
fun Block_is_null (Block): bool = "mac#" // is null?
fun Block_isnot_null (Block): bool = "mac#" // is not null?
//
(* ****** ****** *)
//
fun Piece_new_0 (): Piece = "mac#"
fun Piece_new_1 (): Piece = "mac#"
fun Piece_new_2 (): Piece = "mac#"
fun Piece_new_3 (): Piece = "mac#"
fun Piece_new_4 (): Piece = "mac#"
fun Piece_new_5 (): Piece = "mac#"
//
fun Piece_new_rand (): Piece = "mac#"
//
(* ****** ****** *)

fun Piece_lrotate (Piece): void = "mac#"
fun Piece_rrotate (Piece): void = "mac#"

(* ****** ****** *)
//
fun
GameBoard_isset_at
  (GameBoard, x: int, y: int): bool = "mac#"
//
fun GameBoard_bottom_drop (GameBoard): void = "mac#"
//
fun GameBoard_bottom_isful (GameBoard): bool = "mac#"
//
(* ****** ****** *)
//
fun
Piece_collide_at(Piece, x: int, y: int): bool = "mac#"
//
(* ****** ****** *)

(* end of [tetris.sats] *)
