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
  matrixref(Block, GROWS, GCOLS)
//
(* ****** ****** *)

local

val
theGameBoard =
matrixref_make_elt(GROWS, GCOLS, Block_null())

in (* in-of-local *)

implement
theGameBoard_get () = theGameBoard

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
if x >= GROWS then true else
if y >= GCOLS then true else
  Block_is_null(board[x, GCOLS, y])
//
end // end of [GameBoard_isset_at]

(* ****** ****** *)

implement
GameBoard_bottom_drop
  (board) = let
//
#define m GROWS
#define n GCOLS
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
val n = GCOLS
val m1 = GROWS-1
//
fun
loop
(
  j: natLte(GCOLS)
) : bool =
(
if j < GCOLS
  then (if Block_isnot_null(board[m1,n,j]) then loop(j+1) else false)
  else true
) (* end of [loop] *)
//
in
  loop(0)
end // end of [GameBoard_bottom_isful]

(* ****** ****** *)

(* end of [tetris_gameboard.dats] *)
