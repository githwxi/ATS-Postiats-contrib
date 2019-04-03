(*
#
# Blink without delay
#
*)
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#define
ARDUINO_targetloc "./../.."
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$ARDUINO}/staloadall.hats"
//
(* ****** ****** *)

%{^
#define NDELAY1 1000
#define NDELAY2 1000
%} // end of [%{^]

(* ****** ****** *)
//
extern
fun
setup (): void = "mac#"
//
implement
setup () =
{
  val () = pinMode(13, OUTPUT)
}
//
(* ****** ****** *)
//
val L = LOW
and H = HIGH
//
macdef NDELAY1 = $extval(ulint, "NDELAY1")
macdef NDELAY2 = $extval(ulint, "NDELAY2")
//
extern
fun
loop (): void = "mac#"
//
implement
loop () = let
//
fnx
myloop1
(
  ms: ulint
) : void = let
//
val ms2 = millis()
//
in
//
if ms2 >= ms + NDELAY1
  then (digitalWrite (13, H); myloop2 (ms2)) else myloop1 (ms)
//
end // end of [myloop1]
and
myloop2
(
  ms: ulint
) : void = let
  val ms2 = millis()
in
//
if ms2 >= ms + NDELAY2
  then (digitalWrite (13, L); myloop1 (ms2)) else myloop2 (ms)
//
end // end of [myloop2]
//
in
  myloop1 (millis())
end // end of [loop]

(* ****** ****** *)

(* end of [Blink3.dats] *)
