(*
** Tetris
*)

(* ****** ****** *)
//
#define
ATS_STATIC_PREFIX "tetris_gameboard__"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "tetris_gameboard_initize"

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
//
assume
GameBoard_type =
matrixref(Block, GCOLS, GROWS)
//
(* ****** ****** *)

local
//
val
theGameBoard =
matrixref_make_elt
  (GCOLS, GROWS, Block_null())
//
in (* in-of-local *)

implement
theGameBoard_get () = theGameBoard

implement
theGameBoard_set_at
  (x, y, b0) = let
//
val x = g1ofg0(x)
val y = g1ofg0(y)
//
in
//
if x < 0 then () else
if y < 0 then () else
if x >= GCOLS then () else
if y >= GROWS then () else theGameBoard[x,GROWS,y] := b0
//
end // end of [theGameBoard_set_at]

end // end of [local]

(* ****** ****** *)

implement
GameBoard_isset_at
  (board, x, y) = let
//
val x = g1ofg0(x)
val y = g1ofg0(y)
//
in
//
if x < 0 then true else
if y < 0 then true else
if x >= GCOLS then true else
if y >= GROWS then true else isneqz(board[x,GROWS,y])
//
end // end of [GameBoard_isset_at]

(* ****** ****** *)
//
extern
fun
GameBoard_rowful_at
  (GameBoard, y: natLt(GROWS)): bool = "mac#"
//
(* ****** ****** *)

implement
GameBoard_rowful_at
  (board, y) = let
//
val m = GCOLS
val n = GROWS
val n1 = GROWS-1
//
fun
loop
(
  i: natLte(GCOLS)
) : bool =
(
if i < GCOLS
  then (
    if isneqz(board[i,n,y]) then loop(i+1) else false
  ) else true
) (* end of [loop] *)
//
in
  loop(0)
end // end of [GameBoard_rowful_at]

(* ****** ****** *)
//
extern
fun
GameBoard_rowdel_at
  (GameBoard, y: natLt(GROWS)): void = "mac#"
//
(* ****** ****** *)

implement
GameBoard_rowdel_at
  (board, y) = let
//
#define m GCOLS; #define n GROWS
//
fun
fwork
(
  i: natLt(m)
, j: natLt(n)
) : void = let
  val y0j = y-j
  val y1j = y0j-1
in
//
if y1j >= 0
  then board[i,n,y0j] := board[i,n,y1j]
  else (
    if y0j >= 0 then board[i,n,y0j] := Block_null((*void*))
  ) (* end of [else] *)
// end of [if]
//
end // end of [fwork]
//
in
//
ignoret
(
matrixref_forall_cloref
(
  board, m, n
, lam(i, j) => if j <= y then (fwork(i, j); true) else false
) (* end of [matrixref_foreach_cloref] *)
)
//
end (* end of [GameBoard_rowdel_at] *)

(* ****** ****** *)

(* end of [tetris_gameboard.dats] *)
