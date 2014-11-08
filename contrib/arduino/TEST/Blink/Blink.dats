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

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
macdef
OUTPUT = $extval(int, "OUTPUT")
//
macdef HIGH = $extval(int, "HIGH") and LOW = $extval(int, "LOW")
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
  val () = $extfcall(void, "pinMode", 13, OUTPUT)
}
//
extern
fun loop (): void = "mac#"
implement loop () =
{
  val () =
    $extfcall (void, "digitalWrite", 13, HIGH)
  // end of [val]
  val () = $extfcall (void, "delay", 1000)
  val () = $extfcall (void, "digitalWrite", 13, LOW)
  val () = $extfcall (void, "delay", 1000)
}

(* ****** ****** *)

(* end of [Blink.dats] *)
