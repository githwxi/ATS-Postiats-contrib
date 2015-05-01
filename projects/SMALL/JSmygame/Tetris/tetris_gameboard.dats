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

implement
GameBoard_bottom_drop
  (board) = let
//
#define m GCOLS
#define n GROWS
//
fun
fwork
(
  i: natLt(m)
, j: natLt(n)
) : void = let
  val m1i = m-1-i
  val m2i = m1i-1
in
//
if m2i >= 0
  then board[m1i,n,j] := board[m2i,n,j]
  else board[m1i,n,j] := Block_null((*void*))
// end of [if]
//
end // end of [fwork]
//
in
//
matrixref_foreach_cloref
(
  board, m, n, lam(i, j) => fwork(i, j)
) (* end of [matrixref_foreach_cloref] *)
//
end (* end of [GameBoard_bottom_drop] *)

(* ****** ****** *)
    
implement
GameBoard_bottom_isful
  (board) = let
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
    if isneqz(board[i,n,n1]) then loop(i+1) else false
  ) else true
) (* end of [loop] *)
//
in
  loop(0)
end // end of [GameBoard_bottom_isful]

(* ****** ****** *)

(* end of [tetris_gameboard.dats] *)
