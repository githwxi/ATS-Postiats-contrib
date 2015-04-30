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

%{^
//
function
Block_new_c1c2(c1, c2)
{
  var
  bullet = new createjs.Shape();
//
  bullet.x = 0;
  bullet.y = 0;
//
  bullet.graphics.beginStroke(c1).beginFill(c2).drawRect(0, 0, 0, 15);
  return { createjs: bullet };
//
}
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
