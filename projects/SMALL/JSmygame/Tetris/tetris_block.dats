(*
** Tetris
*)

(* ****** ****** *)
//
#define
ATS_STATIC_PREFIX "tetris_block__"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "tetris_block_initize"

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

%{^
//
function
Block_new_c1c2(c1, c2)
{
  var
  block = new createjs.Shape();
//
  block.x = 0;
  block.y = 0;
//
  block.graphics.beginStroke(c1).beginFill(c2).drawRect(0,0,20,20);
  return { createjs: block };
//
}
//
function Block_null() { return null; }
function Block_is_null(x) { return (x === null); }
function Block_isnot_null(x) { return (x !== null); }
//
function Block_get_x(block) { return block.createjs.x; }
function Block_set_x(block, x) { block.createjs.x = 20*x; return; }
//
function Block_get_y(block) { return block.createjs.y; }
function Block_set_y(block, y) { block.createjs.y = 20*y; return; }
//
%} // end of [%{]

(* ****** ****** *)
//
(*
implement
Block_new () =
  $extfcall(Block, "Block_new_c1c2", "#eee", "#428bca")
*)
//
(* ****** ****** *)
//
implement
Block_drop1(b) =
  if isneqz(b) then b.y := (b.y()/20 + 1)
//
implement
Block_unstage(b) =
  if isneqz(b) then $extfcall(void, "theStage_removeChild", b)
//
(* ****** ****** *)

(* end of [tetris_block.dats] *)
