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

assume
Piece_type = $rec{
  x= int
, y= int
, vy= int // y-velocity
//
, mat1= ref(matrixref(Block, PDIM, PDIM))
, mat2= ref(matrixref(Block, PDIM, PDIM))
//
} (* end of [Piece_type] *)

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
  (P) = let
//
val r1 = P.mat1
val r2 = P.mat2
val M1 = r1[]
val M2 = r2[]
val () = matrixref_lrotate_to(M1, M2, PDIM, PDIM)
val () = r1[] := M2
val () = r2[] := M1
//
in
  // nothing
end // end of [Piece_lrotate]

(* ****** ****** *)
    
(* end of [tetris_piece.dats] *)
