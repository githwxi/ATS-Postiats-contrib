(*
** SpaceInvaders
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "mygame_player_initize"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload (*opened*) "./mygame.sats"
//
(* ****** ****** *)

%{^
//
function
player_new()
{
  var
  player = new createjs.Shape();
  player.x = 0;
  player.y = 0;
  player.graphics.beginFill("yellow").drawCircle(0, 0, 16);
  return { createjs: player, isadded: 0 };
}
//
%} // end of [%{]
//
(* ****** ****** *)
//
%{^
//
function
player_get_createjs(x0) { return x0.createjs; }
//
function
player_incby_x(player, dx) { player.createjs.x += dx; return; }
function
player_incby_y(player, dy) { player.createjs.y += dy; return; }
//
%} // end of [%{]
//
(* ****** ****** *)
    
(* end of [mygame_player.dats] *)
