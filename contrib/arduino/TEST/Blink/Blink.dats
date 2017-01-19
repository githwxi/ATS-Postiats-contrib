(*
#
# Blink
#
*)
(* ****** ****** *)

(*
/*
  Blink
  Turns on an LED on for one second,
  then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(13, OUTPUT);     
}

void loop() {
  digitalWrite(13, HIGH);   // set the LED on
  delay(1000);              // wait for a second
  digitalWrite(13, LOW);    // set the LED off
  delay(1000);              // wait for a second
}
*)

(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
//
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
extern
fun loop (): void = "mac#"
//
implement loop () =
{
//
val () =
(
  digitalWrite (13, HIGH) ; delay (1000)
) (* end of [val] *)
//
val () =
(
  digitalWrite (13, LOW ) ; delay (1000)
) (* end of [val] *)
//
} (* end of [loop] *)
//
(* ****** ****** *)

(* end of [Blink.dats] *)
