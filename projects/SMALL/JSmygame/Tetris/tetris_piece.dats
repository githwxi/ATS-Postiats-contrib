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
staload
UN = "prelude/SATS/unsafe.sats"
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

(*
assume
Piece_type = $rec{
  x= int
, y= int
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
Piece_new_()
{
  return { x: 0, y: 0, mat1: null, mat2: null };
}
//
%} // end of [%{^]

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
function
Piece_get_mat1(piece) { return piece.mat1; }
function
Piece_set_mat1(piece, M1) { piece.mat1 = M1; return; }
//
function
Piece_get_mat2(piece) { return piece.mat2; }
function
Piece_set_mat2(piece, M2) { piece.mat2 = M2; return; }
//
%} // end of [%{^]

(* ****** ****** *)
//
typedef
Piece_mat =
matrixref(Block, PDIM, PDIM)
//
extern
fun
Piece_get_mat1 (Piece): Piece_mat = "mac#"
and
Piece_set_mat1 (Piece, mat1: Piece_mat): void = "mac#"
//
overload .mat1 with Piece_get_mat1
overload .mat1 with Piece_set_mat1
//
extern
fun
Piece_get_mat2 (Piece): Piece_mat = "mac#"
and
Piece_set_mat2 (Piece, mat2: Piece_mat): void = "mac#"
//
overload .mat2 with Piece_get_mat2
overload .mat2 with Piece_set_mat2
//
(* ****** ****** *)
//
extern
fun Piece_new(): Piece = "mac#"
and Piece_new_(): Piece = "mac#"
//
implement
Piece_new() = let
  val P_ = Piece_new_()
  val M1 = matrixref_make_elt(PDIM, PDIM, Block_null())
  val M2 = matrixref_make_elt(PDIM, PDIM, Block_null())
in
  P_.mat1 := M1; P_.mat2 := M2; P_
end // end of [Piece_new]
//
(* ****** ****** *)

fun
Piece_update_mat
(
  P: Piece
, c1: string, c2: string
, mymat: matrixref(int, PDIM, PDIM)
) : void = let
//
val M1 = P.mat1()
//
in
//
matrixref_foreach_cloref
(
  M1, PDIM, PDIM
, lam(i, j) =>
    if mymat[i,PDIM,j] > 0
      then M1[i,PDIM,j] := Block_new_c1c2(c1, c2)
  // end of [lam]
) (* end of [matrixref_foreach_cloref] *)
//
end (* end of [Piece_update_mat] *)

local
//
val
mymat =
matrixref_make_elt{int}(PDIM, PDIM, 0)
//
val () = mymat[1,PDIM,1] := 1
val () = mymat[1,PDIM,2] := 1
val () = mymat[2,PDIM,1] := 1
val () = mymat[2,PDIM,2] := 1
//
in (* in-of-local *)
//
fun
Piece_update_0
  (P: Piece): void =
  Piece_update_mat(P, "#0e0e0e", "#428bca", mymat)
//
end // end of [local]

(* ****** ****** *)

local
//
val
mymat =
matrixref_make_elt{int}(PDIM, PDIM, 0)
//
val () = mymat[1,PDIM,0] := 1
val () = mymat[1,PDIM,1] := 1
val () = mymat[1,PDIM,2] := 1
val () = mymat[1,PDIM,3] := 1
//
in (* in-of-local *)
//
fun
Piece_update_10
  (P: Piece): void =
  Piece_update_mat(P, "#0e0e0e", "#5bc0de", mymat)
//
end // end of [local]

(* ****** ****** *)

local
//
val
mymat =
matrixref_make_elt{int}(PDIM, PDIM, 0)
//
val () = mymat[2,PDIM,0] := 1
val () = mymat[2,PDIM,1] := 1
val () = mymat[2,PDIM,2] := 1
val () = mymat[2,PDIM,3] := 1
//
in (* in-of-local *)
//
fun
Piece_update_11
  (P: Piece): void =
  Piece_update_mat(P, "#0e0e0e", "#5bc0de", mymat)
//
end // end of [local]

(* ****** ****** *)

local
//
val
mymat =
matrixref_make_elt{int}(PDIM, PDIM, 0)
//
val () = mymat[1,PDIM,0] := 1
val () = mymat[1,PDIM,1] := 1
val () = mymat[1,PDIM,2] := 1
val () = mymat[2,PDIM,1] := 1
//
in (* in-of-local *)
//
fun
Piece_update_20
  (P: Piece): void =
  Piece_update_mat(P, "#0e0e0e", "#f0ad4e", mymat)
//
end // end of [local]

(* ****** ****** *)

local
//
val
mymat =
matrixref_make_elt{int}(PDIM, PDIM, 0)
//
val () = mymat[2,PDIM,0] := 1
val () = mymat[2,PDIM,1] := 1
val () = mymat[2,PDIM,2] := 1
val () = mymat[1,PDIM,1] := 1
//
in (* in-of-local *)
//
fun
Piece_update_21
  (P: Piece): void =
  Piece_update_mat(P, "#0e0e0e", "#f0ad4e", mymat)
//
end // end of [local]

(* ****** ****** *)

local
//
val
mymat =
matrixref_make_elt{int}(PDIM, PDIM, 0)
//
val () = mymat[1,PDIM,0] := 1
val () = mymat[1,PDIM,1] := 1
val () = mymat[1,PDIM,2] := 1
val () = mymat[2,PDIM,2] := 1
//
in (* in-of-local *)
//
fun
Piece_update_30
  (P: Piece): void =
  Piece_update_mat(P, "#0e0e0e", "#5cb85c", mymat)
//
end // end of [local]

(* ****** ****** *)

local
//
val
mymat =
matrixref_make_elt{int}(PDIM, PDIM, 0)
//
val () = mymat[2,PDIM,0] := 1
val () = mymat[2,PDIM,1] := 1
val () = mymat[2,PDIM,2] := 1
val () = mymat[1,PDIM,2] := 1
//
in (* in-of-local *)
//
fun
Piece_update_31
  (P: Piece): void =
  Piece_update_mat(P, "#0e0e0e", "#5cb85c", mymat)
//
end // end of [local]

(* ****** ****** *)

local
//
val
mymat =
matrixref_make_elt{int}(PDIM, PDIM, 0)
//
val () = mymat[1,PDIM,0] := 1
val () = mymat[1,PDIM,1] := 1
val () = mymat[2,PDIM,1] := 1
val () = mymat[2,PDIM,2] := 1
//
in (* in-of-local *)
//
fun
Piece_update_40
  (P: Piece): void =
  Piece_update_mat(P, "#0e0e0e", "#d9534f", mymat)
//
end // end of [local]

(* ****** ****** *)

local
//
val
mymat =
matrixref_make_elt{int}(PDIM, PDIM, 0)
//
val () = mymat[2,PDIM,0] := 1
val () = mymat[2,PDIM,1] := 1
val () = mymat[1,PDIM,1] := 1
val () = mymat[1,PDIM,2] := 1
//
in (* in-of-local *)
//
fun
Piece_update_41
  (P: Piece): void =
  Piece_update_mat(P, "#0e0e0e", "#d9534f", mymat)
//
end // end of [local]

(* ****** ****** *)
//
extern
fun
Piece_mat_nullify(Piece_mat): void = "mac#"
//
implement
Piece_mat_nullify(M) =
(
//
matrixref_foreach_cloref
  (M, PDIM, PDIM, lam(i, j) => M[i,PDIM,j] := Block_null())
//
) (* end of [Piece_mat_nullify] *)
//
(* ****** ****** *)
//
extern
fun
Piece_mat_collide_at
  (Piece_mat, x: int, y: int): bool = "mac#"
//
implement
Piece_mat_collide_at
  (M1, x, y) = let
//
val board = theGameBoard_get()
//
fun
ftest(i: natLt(PDIM), j: natLt(PDIM)): bool =
(
if isneqz(M1[i,PDIM,j])
  then GameBoard_isset_at(board, x+i, y+j) else false
)
//
in
  matrixref_exists_cloref(M1, PDIM, PDIM, lam(i, j) => ftest(i, j))
end // end of [Piece_mat_collide_at]
//
(* ****** ****** *)
//
extern
fun
Piece_repos_blocks(Piece): void = "mac#"
//
implement
Piece_repos_blocks
  (piece) = let
//
val M1 = piece.mat1()
val x0 = piece.x() and y0 = piece.y()
//
fun
block_repos
  (b: Block, x_i: int, y_j: int): void =
  if isneqz(b)
    then (b.x := int2double(x_i); b.y := int2double(y_j)) else ()
  // end of [if]
//
in
//
matrixref_foreach_cloref
  (M1, PDIM, PDIM, lam(i, j) => block_repos(M1[i,PDIM,j], x0+i, y0+j))
//
end // end of [Piece_repos_blocks]
//
(* ****** ****** *)
//
extern
fun
Piece_stage_blocks(Piece): void = "mac#"
//
implement
Piece_stage_blocks
  (piece) = let
//
val M1 = piece.mat1()
//
in
//
matrixref_foreach_cloref
(
  M1, PDIM, PDIM
, lam(i, j) => let
    val b = M1[i,PDIM,j]
  in
    if isneqz(b) then $extfcall(void, "theStage_addChild", b)
  end // end of [let] // end of [lam]
)
//
end // end of [Piece_stage_blocks]
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
  A, m, n, lam(i, j) => B[j,m,m-1-i] := A[i,n,j]
)
//
) (* end of [matrixref_lrotate_to] *)
//
(* ****** ****** *)
//
extern
fun
matrixref_rrotate_to
  {a:t@ype}{m,n:int}
(
  A: matrixref(a, m, n),
  B: matrixref(a, n, m), m: int(m), n: int(n)
) : void // end of [matrixref_rrotate_to]
//
implement
matrixref_rrotate_to
  {a}{m,n}(A, B, m, n) =
(
//
matrixref_foreach_cloref
(
  A, m, n, lam(i, j) => B[n-1-j,m,i] := A[i,n,j]
)
//
) (* end of [matrixref_rrotate_to] *)
//
(* ****** ****** *)

implement
Piece_xmove_l
  (piece) = let
//
val x = piece.x() and y = piece.y()
//
val
test = Piece_mat_collide_at(piece.mat1(), x-1, y)
//
in
//
if test then false else (piece.x := x-1; Piece_repos_blocks(piece); true)
//
end // end of [Piece_xmove_l]

(* ****** ****** *)

implement
Piece_xmove_r
  (piece) = let
//
val x = piece.x() and y = piece.y()
//
val
test = Piece_mat_collide_at(piece.mat1(), x+1, y)
//
in
//
if test then false else (piece.x := x+1; Piece_repos_blocks(piece); true)
//
end // end of [Piece_xmove_r]

(* ****** ****** *)

implement
Piece_ymove_dn
  (piece) = let
//
val x = piece.x() and y = piece.y()
//
val
test = Piece_mat_collide_at(piece.mat1(), x, y+1)
//
in
//
if test then false else (piece.y := y+1; Piece_repos_blocks(piece); true)
//
end // end of [Piece_ymove_dn]

(* ****** ****** *)

implement
Piece_lrotate
  (piece) = let
//
val M1 = piece.mat1()
val M2 = piece.mat2()
//
val () =
  matrixref_lrotate_to(M1, M2, PDIM, PDIM)
//
val
test = Piece_mat_collide_at (M2, piece.x(), piece.y())
//
in
//
if test
  then (Piece_mat_nullify(M2); false)
  else (Piece_mat_nullify(M1); piece.mat1 := M2; piece.mat2 := M1; Piece_repos_blocks(piece); true)
//
end (* end of [Piece_lrotate] *)

(* ****** ****** *)
    
implement
Piece_rrotate
  (piece) = let
//
val M1 = piece.mat1()
val M2 = piece.mat2()
//
val () =
  matrixref_rrotate_to(M1, M2, PDIM, PDIM)
//
val
test = Piece_mat_collide_at (M2, piece.x(), piece.y())
//
in
//
if test
  then (Piece_mat_nullify(M2); false)
  else (Piece_mat_nullify(M1); piece.mat1 := M2; piece.mat2 := M1; Piece_repos_blocks(piece); true)
//
end (* end of [Piece_rrotate] *)

(* ****** ****** *)
//
implement
thePiece_xmove_l() =
  ignoret(Piece_xmove_l(thePiece_get()))
//
(* ****** ****** *)
//
implement
thePiece_xmove_r() =
  ignoret(Piece_xmove_r(thePiece_get()))
//
(* ****** ****** *)
//
implement
thePiece_lrotate() =
  ignoret(Piece_lrotate(thePiece_get()))
//
implement
thePiece_rrotate() =
  ignoret(Piece_rrotate(thePiece_get()))
//
(* ****** ****** *)
//
extern
fun
Piece_start_out
  (P0: Piece): void = "mac#"
//
implement
Piece_start_out
  (P0) =
{
//
val x = (GCOLS-PDIM)/2
//
val test =
  Piece_mat_collide_at(P0.mat1(), x, 0)
//
val () =
if not(test) then
{
//
val () = P0.x := x
val () = P0.y := 0
val () = Piece_repos_blocks(P0)
val () = Piece_stage_blocks(P0)
//
} (* end of [if] *)
//
val () = if test then theGame_stop()
val () = if test then alert("Game over!")
//
} // end of [Piece_start_out]
//
(* ****** ****** *)
//
implement
thePiece_start_out() =
  Piece_start_out(thePiece_get())
//
(* ****** ****** *)

implement
Piece_dump_blocks
  (piece) = let
//
val x = piece.x()
val y = piece.y()
val M1 = piece.mat1()
//
fun
fwork(
  i: natLt(PDIM)
, j: natLt(PDIM)
) : void = let
//
val b_ij = M1[i,PDIM,j]
val isnot = isneqz(b_ij)
//
in
//
if
isnot
then let
//
val () =
  M1[i,PDIM,j] := Block_null()
//
in
  theGameBoard_set_at(x+i, y+j, b_ij)
end // end of [then]
else () // end of [else]
//
end (* end of [fwork] *)
//
in
  matrixref_foreach_cloref(M1, PDIM, PDIM, lam(i, j) => fwork(i, j))
end // end of [Piece_dump_blocks]

(* ****** ****** *)
//
implement
thePiece_dump_blocks() =
  Piece_dump_blocks(thePiece_get())
//
(* ****** ****** *)

implement
Piece_update_rand
  (P) = let
//
val type = double2int(10 * JSmath_random())
//
in
//
case+ type of
| 0 => Piece_update_0(P)
| 1 => Piece_update_10(P)
| 2 => Piece_update_11(P)
| 3 => Piece_update_20(P)
| 4 => Piece_update_21(P)
| 5 => Piece_update_30(P)
| 6 => Piece_update_31(P)
| 7 => Piece_update_40(P)
| 8 => Piece_update_41(P)
| _ => Piece_update_rand(P)
//
end // end of [Piece_update_rand]

(* ****** ****** *)
//
extern
fun
Piece_stageNP_blocks(Piece): void = "mac#"
//
implement
Piece_stageNP_blocks
  (piece) = let
//
val M1 = piece.mat1()
//
in
//
matrixref_foreach_cloref
(
  M1, PDIM, PDIM
, lam(i, j) => let
    val b = M1[i,PDIM,j]
  in
    if isneqz(b) then $extfcall(void, "theStageNP_addChild", b)
  end // end of [let] // end of [lam]
)
//
end // end of [Piece_stageNP_blocks]
//
extern
fun
Piece_unstageNP_blocks(Piece): void = "mac#"
//
implement
Piece_unstageNP_blocks
  (piece) = let
//
val M1 = piece.mat1()
//
in
//
matrixref_foreach_cloref
(
  M1, PDIM, PDIM
, lam(i, j) => let
    val b = M1[i,PDIM,j]
  in
    if isneqz(b) then $extfcall(void, "theStageNP_removeChild", b)
  end // end of [let] // end of [lam]
)
//
end // end of [Piece_unstageNP_blocks]
//
(* ****** ****** *)

extern
fun
Piece_reposNP_blocks(Piece): void = "mac#"
//
implement
Piece_reposNP_blocks
  (piece) = let
//
val M1 = piece.mat1()
//
fun
block_repos
  (b: Block, x_i: double, y_j: double): void =
  if isneqz(b) then (b.x := x_i; b.y := y_j) else ()
//
in
//
matrixref_foreach_cloref
  (M1, PDIM, PDIM, lam(i, j) => block_repos(M1[i,PDIM,j], 0.25+i, 0.25+j))
//
end // end of [Piece_reposNP_blocks]

(* ****** ****** *)

local
//
val P0 = Piece_new()
val P1 = Piece_new()
val () = Piece_update_rand(P1)
val () = Piece_reposNP_blocks(P1)
val () = Piece_stageNP_blocks(P1)
//
val thePiece = ref{Piece}(P0)
val theNextPiece = ref{Piece}(P1)
//
in (* in-of-local *)

implement thePiece_get() = thePiece[]
implement theNextPiece_get() = theNextPiece[]

implement
thePiece_theNextPiece_update
 ((*void*)) = let
//
val P0 = thePiece[]
val P1 = theNextPiece[]
//
val () = Piece_start_out(P1)
//
val status = theGameStatus_get()
//
in
//
if(status != 0) then
{
 val () = thePiece[] := P1
 val () = theNextPiece[] := P0
 val () = Piece_update_rand(P0)
 val () = Piece_reposNP_blocks(P0)
 val () = Piece_stageNP_blocks(P0)
 val () = Piece_unstageNP_blocks(P1)
 val () = if (status < 0) then theGame_autoplay_piece(P1)
}
//
end // end of [thePiece_theNextPiece_update]

end // end of [local]

(* ****** ****** *)

implement
Piece_iforeach
  (P0, fwork) = let
//
val M1 = Piece_get_mat1(P0)
//
in
//
matrixref_foreach_cloref
  (M1, PDIM, PDIM, lam(i, j) => fwork(i, j, isneqz(M1[i,PDIM,j])))
//
end // end of [Piece_iforeach]

(* ****** ****** *)

(* end of [tetris_piece.dats] *)
