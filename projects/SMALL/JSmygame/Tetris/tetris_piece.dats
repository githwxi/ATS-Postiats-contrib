(*
** Tetris
*)

(* ****** ****** *)
//
#define
ATS_STATIC_PREFIX "tetris_piece__"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "tetris_piece_initize"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload (*opened*) "./tetris.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

#define PDIM 4

(* ****** ****** *)

(*
assume
Piece_type = $rec{
  x= int
, y= int
, vy= int // y-velocity
//
, mat1= matrixref(Block, PDIM, PDIM)
, mat2= matrixref(Block, PDIM, PDIM)
//
} (* end of [Piece_type] *)
*)

(* ****** ****** *)

%{^
//
function
Piece_get_x(piece) { return piece.x; }
function
Piece_set_x(piece, x) { piece.x = x; return; }
//
function
Piece_get_y(piece) { return piece.y; }
function
Piece_set_y(piece, y) { piece.y = y; return; }
//
%} // end of [%{^]

(* ****** ****** *)
//
typedef
Piece_mat =
matrixref(Block, PDIM, PDIM)
//
extern
fun Piece_get_mat1 (Piece): Piece_mat
and Piece_set_mat1 (Piece, mat1: Piece_mat): void
//
overload .mat1 with Piece_get_mat1
overload .mat1 with Piece_set_mat1
//
extern
fun Piece_get_mat2 (Piece): Piece_mat
and Piece_set_mat2 (Piece, mat2: Piece_mat): void
//
overload .mat2 with Piece_get_mat2
overload .mat2 with Piece_set_mat2
//
(* ****** ****** *)
//
extern
fun
matrixref_lrotate_to
  {a:t@ype}{m,n:int}
(
  A: matrixref(a, m, n),
  B: matrixref(a, n, m), m: int(m), n: int(n)
) : void // end of [matrixref_lrotate_to]
//
implement
matrixref_lrotate_to
  {a}{m,n}(A, B, m, n) =
(
//
matrixref_foreach_cloref
(
  A, m, n
, lam(i, j) =>
  let val tmp = A[i,n,j] in
    A[i,n,j] := B[n-1-j,m,i]; B[n-1-j,m,i] := tmp
  end // end of [let] // end of [lam]
)
//
) (* end of [matrixref_lrotate_to] *)
//
(* ****** ****** *)

implement
Piece_lrotate
  (piece) =
{
//
val M1 = piece.mat1
val M2 = piece.mat2
//
val () =
  matrixref_lrotate_to(M1, M2, PDIM, PDIM)
//
val () = piece.mat1 := M2
val () = piece.mat2 := M1
//
} (* end of [Piece_lrotate] *)

(* ****** ****** *)
    
(* end of [tetris_piece.dats] *)
