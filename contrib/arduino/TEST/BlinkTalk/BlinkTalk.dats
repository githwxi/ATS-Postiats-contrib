(*
#
# BlinkTalk
#
*)
(* ****** ****** *)

(*
//
// HX-2014-11-08:
// The code is taken from the book on
// "C Programming for Arduino" by Julien Bayle
//
int LEDPIN = 8;
int BAUD_RATE = 9600;
//
void setup() {
  pinMode(LEDPIN, OUTPUT); Serial.begin(BAUD_RATE);
}

void loop() {
  digitalWrite(ledPin, HIGH);
  Serial.print("the pin "); Serial.print(LEDPIN); Serial.println(" is on");
  delay(250);
  digitalWrite(LEDPIN, LOW);
  Serial.print("the pin "); Serial.print(LEDPIN); Serial.println(" is off");
  delay(1000);
}
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$ARDUINO}/staloadall.hats"
//
(* ****** ****** *)

%{^
//
#define \
ATSextmcall(obj, mtd, funarg) obj.mtd funarg
//
%} // end of [%{^]
  
(* ****** ****** *)
//
macdef LEDPIN = 8
macdef BAUD_RATE = 9600
//
(* ****** ****** *)

macdef
Serial = $extval(HardwareSerial, "Serial")
macdef
SerialPtr = $extval(HardwareSerial_ptr, "&Serial")

(* ****** ****** *)
//
extern
fun
setup (): void = "mac#"
//
(* ****** ****** *)

implement
setup () =
{
  val () = pinMode(LEDPIN, OUTPUT)
  val () = $extmcall(void, Serial, "begin", BAUD_RATE)
}

(* ****** ****** *)

macdef
Serial_print(x) = $extmcall(void, Serial, "print", ,(x))
macdef
Serial_println(x) = $extmcall(void, Serial, "println", ,(x))

(* ****** ****** *)

extern
fun loop (): void = "mac#"
//
implement loop () =
{
//
val () = digitalWrite(LEDPIN, HIGH)
val () =
(
  Serial_print("the pin "); Serial_print(LEDPIN); Serial_println(" is on");
)
val () = delay (250)
val () = digitalWrite(LEDPIN, LOW )
val () =
(
  Serial_print("the pin "); Serial_print(LEDPIN); Serial_println(" is off");
)
val () = delay (1000)
//
} (* end of [loop] *)

(* ****** ****** *)

(* end of [BlinkTalk.dats] *)
