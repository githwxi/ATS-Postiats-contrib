(* ****** ****** *)
//
// Title:
// Concepts of Programming Languages
// Number: CAS CS 320
// Semester: Spring 2016
// Class Time: TR 12:30-2:00
// Instructor: Hongwei Xi (hwxiATbuDOTedu)
// Teaching Fellow: Hanwen Wu (hwwuATbuDOTedu)
//
(* ****** ****** *)

#define
ATS_STATIC_PREFIX "Wormlike_keyboard_"

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "Wormlike_keyboard_initize"

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME/contrib\
/libatscc2js/ATS2-0.3.2"
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
#staload (*opened*) "./Wormlike.sats"
//
(* ****** ****** *)
//
#staload
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
theKeyDowns.map(TYPE{int})
  (lam(x) =<cloref1> JSevent_keyCode(x))
//
in (* in-of-local *)

implement
theKeyDowns_handle(fwork) = theKeyCodes.onValue()(fwork)

end // end of [local]

(* ****** ****** *)

#define KUP 38
#define KDOWN 40
#define KLEFT 37
#define KRIGHT 39
#define KSPACE 32

(* ****** ****** *)

local
//
(*
fun
aux_up() = alert("Up!")
*)
//
fun
aux_up(): void = ignoret(theWorm_move_up())
//
fun
aux_down(): void = ignoret(theWorm_move_down())
//
fun
aux_left(): void = ignoret(theWorm_move_left())
//
fun
aux_right(): void = ignoret(theWorm_move_right())
//
(* ****** ****** *)

fun
fwork_keycode(c: int): void =
(
case+ 0 of
//
| _ when c = KUP => aux_up()
| _ when c = KDOWN => aux_down()
| _ when c = KLEFT => aux_left()
| _ when c = KRIGHT => aux_right()
//
| _ (* ignored *) => ((*void*))
//
) (* end of [fwork_keycode] *)

fun
fwork_keycode2(c: int): void = let
  val () = fwork_keycode(c) in thePrintbd_display()
end // end of [fwork_keycode2]

in (* in-of-local *)

val () = theKeyDowns_handle(lam(c) => fwork_keycode2(c))

end // end of [local]

(* ****** ****** *)
    
(* end of [Wormlike_keyboard.dats] *)
