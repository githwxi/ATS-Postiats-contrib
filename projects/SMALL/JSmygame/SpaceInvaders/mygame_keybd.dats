(*
** SpaceInvaders
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "mygame_keybd_initize"

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
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
(* ****** ****** *)
//
abstype JSevent
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

#define KUP 38
#define KDOWN 40
#define KLEFT 37
#define KRIGHT 39
#define KSPACE 32

(* ****** ****** *)

local

fun
aux_up(): void = let
//
val opt = thePlayer_get()
//
in
//
case+ opt of
| None () => ()
| Some (x0) => player_incby_y(x0, ~10)
//
end // end of [aux_up]
//
fun
aux_down(): void = let
//
val opt = thePlayer_get()
//
in
//
case+ opt of
| None () => ()
| Some (x0) => player_incby_y(x0, (10))
//
end // end of [aux_down]
//
fun
aux_left(): void = let
//
val opt = thePlayer_get()
//
in
//
case+ opt of
| None () => ()
| Some (x0) => player_incby_x(x0, ~10)
//
end // end of [aux_left]
//
fun
aux_right(): void = let
//
val opt = thePlayer_get()
//
in
//
case+ opt of
| None () => ()
| Some (x0) => player_incby_x(x0, (10))
//
end // end of [aux_right]

(* ****** ****** *)

fun
aux_space(): void = let
//
val opt = thePlayer_get()
//
in
//
case+ opt of
| None () => ()
| Some (x0) => player_fire_bullet(x0)
//
end // end of [aux_space]

(* ****** ****** *)

fun
fwork_keycode(c: int) =
(
case+ 0 of
//
| _ when c = KUP => aux_up()
| _ when c = KDOWN => aux_down()
| _ when c = KLEFT => aux_left()
| _ when c = KRIGHT => aux_right()
| _ when c = KSPACE => aux_space()
//
| _ (* ignored *) => ()
//
) (* end of [fwork_keycode] *)

in (* in-of-local *)

val () = theKeyDowns_handle(lam(c) => fwork_keycode(c))

end // end of [local]

(* ****** ****** *)
    
(* end of [mygame_keybd.dats] *)
