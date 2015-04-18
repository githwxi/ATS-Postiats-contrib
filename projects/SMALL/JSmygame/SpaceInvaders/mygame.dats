(*
** SpaceInvaders
*)

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
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
(* ****** ****** *)

abstype JSevent

(* ****** ****** *)
//
%{^
function
JSevent_keyCode(x){ return x.keyCode; }
%} // end of ...
//
extern
fun
JSevent_keyCode(x: JSevent): int = "mac#"
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

#define KUP 38
#define KDOWN 40
#define KLEFT 37
#define KRIGHT 39

(* ****** ****** *)
//
extern
fun
theKeyDowns_handle
  (fwork: int -<cloref1> void): void
//
(* ****** ****** *)

local
//
val
theKeyDowns =
  $extval(EStream(JSevent), "theKeyDowns")
//
val
theKeyCodes =
  theKeyDowns.map(lam(x) =<cloref1> JSevent_keyCode(x))
//
in (* in-of-local *)

implement
theKeyDowns_handle(fwork) = theKeyCodes.onValue(fwork)

end // end of [local]

(* ****** ****** *)
//
%{^
//
var
theStage = 0;
//
function
theGame_tick(event)
{
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
extern
fun
theGame_initize(): void = "mac#"
//
val () = theGame_initize((*void*))
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
extern
fun
theStage_addChild{a:type}(x: a): void = "mac#"
//
(* ****** ****** *)

abstype player
abstype myplayer

(* ****** ****** *)

%{^
//
function
myplayer_new()
{
  var
  player = new createjs.Shape();
  player.x = 0;
  player.y = 0;
  player.graphics.beginFill("yellow").drawCircle(0, 0, 16);
  return { player: player, isadded: 0 };
}
//
function
myplayer_get_player(x0) { return x0.player; }
//
%} // end of [%{]
//
extern
fun
myplayer_new (): myplayer = "mac#"
//
extern
fun
myplayer_get_player (myplayer): player = "mac#"
//
(* ****** ****** *)
//
%{^
//
function
myplayer_incby_x
  (myplayer, dx)
  { myplayer.player.x += dx; return; }
function
myplayer_incby_y
  (myplayer, dy)
  { myplayer.player.y += dy; return; }
//
%} // end of [%{]
//
extern
fun
myplayer_incby_x (myplayer, dx: int): void = "mac#"
extern
fun
myplayer_incby_y (myplayer, dy: int): void = "mac#"
//
(* ****** ****** *)

extern
fun theMyPlayer_get (): Option(myplayer)

(* ****** ****** *)

local

val
theMyPlayer = ref(None)

fun
theMyPlayer_initize(): void =
{
  val x0 = myplayer_new()
  val () = myplayer_incby_x(x0, 16)
  val () = myplayer_incby_y(x0, 640-16)
  val () = theStage_addChild(myplayer_get_player(x0))
  val () = theMyPlayer[] := Some(x0)
}

implement
theMyPlayer_get() = theMyPlayer[]

in (* in-of-local *)

val () = theMyPlayer_initize((*void*))

end // end of [local]

(* ****** ****** *)

local

fun
aux_up(): void = let
//
val opt = theMyPlayer_get()
//
in
//
case+ opt of
| None () => ()
| Some (x0) => myplayer_incby_y(x0, ~10)
//
end // end of [aux_up]
//
fun
aux_down(): void = let
//
val opt = theMyPlayer_get()
//
in
//
case+ opt of
| None () => ()
| Some (x0) => myplayer_incby_y(x0, (10))
//
end // end of [aux_down]
//
fun
aux_left(): void = let
//
val opt = theMyPlayer_get()
//
in
//
case+ opt of
| None () => ()
| Some (x0) => myplayer_incby_x(x0, ~10)
//
end // end of [aux_left]
//
fun
aux_right(): void = let
//
val opt = theMyPlayer_get()
//
in
//
case+ opt of
| None () => ()
| Some (x0) => myplayer_incby_x(x0, (10))
//
end // end of [aux_right]

fun
fwork_keycode(c: int) =
(
case+ 0 of
//
| _ when c = KUP => aux_up()
| _ when c = KDOWN => aux_down()
| _ when c = KLEFT => aux_left()
| _ when c = KRIGHT => aux_right()
//
| _ (* ignored *) => ()
//
) (* end of [fwork_keycode] *)

in (* in-of-local *)

val () = theKeyDowns_handle(lam(c) => fwork_keycode(c))

end // end of [local]

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
