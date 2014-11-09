(*
** The prelude for Ardunio
*)

(* ****** ****** *)

%{#
#include "arduino/CATS/HardwareSerial.cats"
%} // end of [%{#]

(* ****** ****** *)

(*
class HardwareSerial
*)
abstype HardwareSerial = $extype"HardwareSerial"

(* ****** ****** *)

macdef Serial = $extval(HardwareSerial, "Serial")
macdef Serial_ = $extval(HardwareSerial, "Serial_")
macdef Serial1 = $extval(HardwareSerial, "Serial1")
macdef Serial2 = $extval(HardwareSerial, "Serial2")
macdef Serial3 = $extval(HardwareSerial, "Serial3")

(* ****** ****** *)
//
fun
HardwareSerial_begin_int
  (HardwareSerial, intGte(0)): void = "mac#"
fun
HardwareSerial_begin_ulint
  (HardwareSerial, baud: ulint): void = "mac#"
//
overload
._begin with HardwareSerial_begin_int
overload
._begin with HardwareSerial_begin_ulint
//
fun
HardwareSerial_end (HardwareSerial): void = "mac#"
//
overload ._end with HardwareSerial_end
//
(* ****** ****** *)
//
fun HardwareSerial_peek (HardwareSerial): int = "mac#"
fun HardwareSerial_read (HardwareSerial): int = "mac#"
//
fun HardwareSerial_write (HardwareSerial, natLt(256)): size_t = "mac#"
//
fun HardwareSerial_flush (HardwareSerial): void = "mac#"
//
fun HardwareSerial_available (HardwareSerial): int = "mac#"
//
(* ****** ****** *)
//
fun
HardwareSerial_print_int
  (HardwareSerial, int): void = "mac#"
fun
HardwareSerial_print_ulint
  (HardwareSerial, ulint): void = "mac#"
fun
HardwareSerial_print_string
  (HardwareSerial, string): void = "mac#"
fun
HardwareSerial_println_string
  (HardwareSerial, string): void = "mac#"
//
overload .print with HardwareSerial_print_int
overload .print with HardwareSerial_print_ulint
overload .print with HardwareSerial_print_string
overload .println with HardwareSerial_println_string
//
(* ****** ****** *)

(* end of [HardwareSerial.sats] *)
