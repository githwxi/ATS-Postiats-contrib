(*
** SpaceInvaders
*)

(* ****** ****** *)

#define ATS_STATIC_PREFIX "mygame_enemy_"

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "mygame_enemy_initize"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload "./mygame.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

%{^
//
function
enemy_new()
{
  var
  enemy = new createjs.Shape();
  enemy.x = 0;
  enemy.y = 0;
  enemy.graphics.beginFill("#ff00ff").drawCircle(0, 0, 16);
  return { createjs: enemy, isadded: 0 };
}
//
%} // end of [%{]
//
(* ****** ****** *)
//
%{^
//
function
enemy_get_x(enemy, x) { return enemy.createjs.x ; }
function
enemy_get_y(enemy, y) { return enemy.createjs.y ; }
//
function
enemy_set_x(enemy, x) { enemy.createjs.x = x; return; }
function
enemy_set_y(enemy, y) { enemy.createjs.y = y; return; }
//
function
enemy_incby_x(enemy, dx) { enemy.createjs.x += dx; return; }
function
enemy_incby_y(enemy, dy) { enemy.createjs.y += dy; return; }
//
%} // end of [%{]
//
(* ****** ****** *)

implement
enemy_fire_bullet
  (enemy) = let
//
val blt = bullet_new(1)
//
val () = blt.x := enemy.x
val () = blt.y := enemy.y + YENEMY/2
//
val () = theStage_addChild(blt)
//
val () = thePlayerBullets_add(blt)
//
in
  // alert("enemy_fire_bullet!")
end // end of [enemy_fire_bullet]

(* ****** ****** *)
    
(* end of [mygame_enemy.dats] *)
