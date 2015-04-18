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

abstype player

(* ****** ****** *)

extern
fun
player_new (): player = "mac#"

(* ****** ****** *)

extern
fun
player_incby_x (player, x: int): void = "mac#"
extern
fun
player_incby_y (player, y: int): void = "mac#"

(* ****** ****** *)

local

fun aux_up(): void = alert("UP")
fun aux_down(): void = alert("DOWN")
fun aux_left(): void = alert("LEFT")
fun aux_right(): void = alert("RIGHT")

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
