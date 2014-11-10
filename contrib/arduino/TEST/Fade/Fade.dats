(*
#
# Fade
#
*)
(* ****** ****** *)

(*
/*
 Fade
 
 This example shows how to fade an LED on pin 9
 using the analogWrite() function.
 
 This example code is in the public domain.
*/
int brightness = 0;    // how bright the LED is
int fadeAmount = 5;    // how many points to fade the LED by

void setup()  { 
  // declare pin 9 to be an output:
  pinMode(9, OUTPUT);
} 

void loop()  { 
  // set the brightness of pin 9:
  analogWrite(9, brightness);    

  // change the brightness for next time through the loop:
  brightness = brightness + fadeAmount;

  // reverse the direction of the fading at the ends of the fade: 
  if (brightness == 0 || brightness == 255) {
    fadeAmount = -fadeAmount ; 
  }     
  // wait for 30 milliseconds to see the dimming effect    
  delay(30);                            
}
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$ARDUINO}/staloadall.hats"
//
(* ****** ****** *)
//
#define LEDPIN 9
#define FADE_AMOUNT 5
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
  val () = pinMode(LEDPIN, OUTPUT)
}
//
(* ****** ****** *)
//
extern
fun
theBrightness_set (n: natLt(256)): void
//
implement
theBrightness_set (n) = analogWrite (LEDPIN, n)
//
(* ****** ****** *)

fnx
myloop0
(
  n: natLt(256)
) : void = let
  val n2 = n + FADE_AMOUNT
  val () = theBrightness_set (n)
  val () = delay (30)
in
  if n2 >= 256
    then myloop1 (n - FADE_AMOUNT) else myloop0 (n2)
  // end of [if]
end // end of [myloop0]

and
myloop1
(
  n: natLt(256)
) : void = let
  val n2 = n - FADE_AMOUNT
  val () = theBrightness_set (n)
  val () = delay (30)
in
  if n2 >= 0 then myloop1 (n2) else myloop0 (n + FADE_AMOUNT)
end // end of [myloop1]

(* ****** ****** *)
//
extern
fun loop (): void = "mac#"
//
implement loop () = myloop0(0)
//
(* ****** ****** *)

(* end of [Fade.dats] *)
