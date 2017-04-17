(*
** SpaceInvaders
*)

(* ****** ****** *)

#define ATS_STATIC_PREFIX "mygame_"

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
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
var
theKeyDowns =
  $(document).asEventStream("keydown")
//
var
theKeyDowns =
theKeyDowns.doAction(".preventDefault")
//
%} // end of ...
//
(* ****** ****** *)
//
%{^
//
var theStage = 0;
//
function
theGame_tick(event)
{
  thePlayerBullets_update();
  theEnemiesBullets_update();
  theStage.update(); return;
}
//
function
theGame_initize()
{
  theStage = new createjs.Stage("theGameCanvas");
  createjs.Ticker.addEventListener("tick", theGame_tick);
}
//
%}
//
val () =
theGame_initize() where
  { extern fun theGame_initize(): void = "mac#" }
//
(* ****** ****** *)
//
%{^
//
function
theStage_addChild(x)
{
  theStage.addChild(x.createjs); return;
}
//
%} // end of [%{^]
//
(* ****** ****** *)
//
val () = mygame_bullet_initize()
val () = mygame_enemy_initize()
val () = mygame_player_initize()
val () = mygame_keyboard_initize()
//
(* ****** ****** *)

%{$
//
function
mygame_initize()
{
  var _ = my_dynload()
}
//
%} // end of [%{$]

(* ****** ****** *)
    
(* end of [mygame.dats] *)
