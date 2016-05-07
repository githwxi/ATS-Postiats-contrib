(*
** SpaceInvaders
*)

(* ****** ****** *)

#define ATS_STATIC_PREFIX "mygame_player_"

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
staload "./mygame.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
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
player_get_x(player, x) { return player.createjs.x ; }
function
player_get_y(player, y) { return player.createjs.y ; }
//
function
player_set_x(player, x) { player.createjs.x = x; return; }
function
player_set_y(player, y) { player.createjs.y = y; return; }
//
function
player_incby_x(player, dx) { player.createjs.x += dx; return; }
function
player_incby_y(player, dy) { player.createjs.y += dy; return; }
//
%} // end of [%{]
//
(* ****** ****** *)

implement
player_fire_bullet
  (player) = let
//
val blt = bullet_new(0)
//
val () = blt.x := player.x()
val () = blt.y := player.y() - YPLAYER/2
//
val () = theStage_addChild(blt)
//
val () = thePlayerBullets_add(blt)
//
in
  // alert("player_fire_bullet!")
end // end of [player_fire_bullet]

(* ****** ****** *)
    
local

val
thePlayer = ref(None)

fun
thePlayer_initize(): void =
{
  val x0 = player_new()
  val () = player_incby_x(x0, XSCREEN/2)
  val () = player_incby_y(x0, YSCREEN-YPLAYER/2)
  val () = theStage_addChild(x0)
  val () = thePlayer[] := Some(x0)
}

implement
thePlayer_get() = thePlayer[]

in (* in-of-local *)

val () = thePlayer_initize((*void*))

end // end of [local]

(* ****** ****** *)

(* end of [mygame_player.dats] *)
