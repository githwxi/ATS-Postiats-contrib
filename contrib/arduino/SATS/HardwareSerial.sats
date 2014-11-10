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
abstype HardwareSerial_ptr = ptr

(* ****** ****** *)

(*
macdef Serial = $extval(HardwareSerial_ptr, "&Serial")
macdef Serial_ = $extval(HardwareSerial_ptr, "&Serial_")
macdef Serial1 = $extval(HardwareSerial_ptr, "&Serial1")
macdef Serial2 = $extval(HardwareSerial_ptr, "&Serial2")
macdef Serial3 = $extval(HardwareSerial_ptr, "&Serial3")
*)

(* ****** ****** *)
//
fun
HardwareSerial_begin_int
  (HardwareSerial_ptr, intGte(0)): void = "mac#"
fun
HardwareSerial_begin_ulint
  (HardwareSerial_ptr, baud: ulint): void = "mac#"
//
overload
._begin with HardwareSerial_begin_int
overload
._begin with HardwareSerial_begin_ulint
//
fun
HardwareSerial_end (HardwareSerial_ptr): void = "mac#"
//
overload ._end with HardwareSerial_end
//
(* ****** ****** *)
//
fun HardwareSerial_peek (HardwareSerial_ptr): int = "mac#"
fun HardwareSerial_read (HardwareSerial_ptr): int = "mac#"
//
fun HardwareSerial_write
  (p0: HardwareSerial_ptr, c: natLt(256)): size_t = "mac#"
//
fun HardwareSerial_flush (HardwareSerial_ptr): void = "mac#"
//
fun HardwareSerial_available (HardwareSerial_ptr): int = "mac#"
//
(* ****** ****** *)
//
fun
HardwareSerial_print_int
  (HardwareSerial_ptr, int): void = "mac#"
fun
HardwareSerial_print_ulint
  (HardwareSerial_ptr, ulint): void = "mac#"
fun
HardwareSerial_print_string
  (HardwareSerial_ptr, string): void = "mac#"
fun
HardwareSerial_println_string
  (HardwareSerial_ptr, string): void = "mac#"
//
overload .print with HardwareSerial_print_int
overload .print with HardwareSerial_print_ulint
overload .print with HardwareSerial_print_string
overload .println with HardwareSerial_println_string
//
(* ****** ****** *)

(* end of [HardwareSerial.sats] *)
