(*
** Tetris
*)

(* ****** ****** *)

#define ATS_STATIC_PREFIX "tetris_keyboard_"

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "tetris_keyboard_initize"

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
#include
"{$LIBATSCC2JS}/staloadall.hats"
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
//
fun
thePiece_xmove_l() =
  ignoret(Piece_xmove_l(thePiece_get()))
//
(* ****** ****** *)
//
fun
thePiece_xmove_r() =
  ignoret(Piece_xmove_r(thePiece_get()))
//
(* ****** ****** *)
//
fun
thePiece_lrotate() =
  ignoret(Piece_lrotate(thePiece_get()))
//
(* ****** ****** *)
//
fun thePiece_rrotate() = ()
//
(* ****** ****** *)

local

fun
aux_up(): void = let
//
val k = theGameStatus_get()
//
in
//
if k > 0 then thePiece_rrotate()
//
end // end of [aux_up]
//
fun
aux_down(): void = let
//
val k = theGameStatus_get()
//
in
//
if k > 0 then thePiece_lrotate()
//
end // end of [aux_down]
//
fun
aux_left(): void = let
//
val k = theGameStatus_get()
//
in
//
if k > 0 then thePiece_xmove_l()
//
end // end of [aux_left]
//
fun
aux_right(): void = let
//
val k = theGameStatus_get()
//
in
//
if k > 0 then thePiece_xmove_r()
//
end // end of [aux_right]

(* ****** ****** *)

fun
aux_space(): void =
{
  val () = theGameTQuota_delta_space()
}

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
    
(* end of [tetris_keyboard.dats] *)
