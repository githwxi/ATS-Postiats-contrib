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

fun Block_new (): Block = "mac#"

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

fun GameBoard_delrows_if (GameBoard): void = "mac#"

(* ****** ****** *)

(* end of [tetris.sats] *)
