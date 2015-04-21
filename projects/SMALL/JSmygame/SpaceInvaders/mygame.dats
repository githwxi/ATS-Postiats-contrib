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
  theStage.addChild(x); return;
}
//
%} // end of [%{^]
//
(* ****** ****** *)

local

val
thePlayer = ref(None)

fun
thePlayer_initize(): void =
{
  val x0 = player_new()
  val () = player_incby_x(x0, XPLAYER/2)
  val () = player_incby_y(x0, YSCREEN-YPLAYER/2)
  val () = theStage_addChild(player_get_createjs(x0))
  val () = thePlayer[] := Some(x0)
}

implement
thePlayer_get() = thePlayer[]

in (* in-of-local *)

val () = thePlayer_initize((*void*))

end // end of [local]

(* ****** ****** *)
//
val () = mygame_keybd_initize()
val () = mygame_bullet_initize()
val () = mygame_player_initize()
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
