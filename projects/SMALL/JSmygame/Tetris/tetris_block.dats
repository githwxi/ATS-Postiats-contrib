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
  block.graphics.beginStroke(c1).beginFill(c2).drawRect(0, 0, 0, 15);
  return { createjs: block };
//
}
//
function Block_null() { return null; }
function Block_is_null(x) { return (x === null); }
function Block_isnot_null(x) { return (x !== null); }
//
%} // end of [%{]

(* ****** ****** *)
//
implement
Block_new () =
  $extfcall(Block, "Block_new_c1c2", "#eee", "#428bca")
//
(* ****** ****** *)

(* end of [tetris_block.dats] *)
