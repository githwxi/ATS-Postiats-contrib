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
    
(* end of [tetris_gameboard.dats] *)
