(*
** The prelude for Ardunio
*)

(* ****** ****** *)

%{#
#include "arduino/CATS/HardwareSerial.cats"
%} // end of [%{#]

(* ****** ****** *)
//
(*
class HardwareSerial
*)
//
abst@ype
HardwareSerial =
$extype"HardwareSerial"
//
abstype HardwareSerial_ptr = ptr
//
(* ****** ****** *)
//
macdef Serial = $extval(HardwareSerial, "Serial")
macdef Serial_ptr = $extval(HardwareSerial_ptr, "Serial_ptr")
//
macdef Serial_ = $extval(HardwareSerial, "Serial_")
macdef Serial1 = $extval(HardwareSerial, "Serial1")
macdef Serial2 = $extval(HardwareSerial, "Serial2")
macdef Serial3 = $extval(HardwareSerial, "Serial3")
//
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

overload .peek with HardwareSerial_peek
overload .read with HardwareSerial_read
overload .write with HardwareSerial_write
overload .flush with HardwareSerial_flush
overload .available with HardwareSerial_available

(* ****** ****** *)
//
fun
HardwareSerial_print_int
  (HardwareSerial_ptr, int): void = "mac#"
fun
HardwareSerial_print_uint
  (HardwareSerial_ptr, uint): void = "mac#"
fun
HardwareSerial_print_lint
  (HardwareSerial_ptr, lint): void = "mac#"
fun
HardwareSerial_print_ulint
  (HardwareSerial_ptr, ulint): void = "mac#"
fun
HardwareSerial_print_char
  (HardwareSerial_ptr, char): void = "mac#"
fun
HardwareSerial_print_uchar
  (HardwareSerial_ptr, uchar): void = "mac#"
fun
HardwareSerial_print_double
  (HardwareSerial_ptr, double): void = "mac#"
fun
HardwareSerial_print_string
  (HardwareSerial_ptr, string): void = "mac#"
//
overload .print with HardwareSerial_print_int
overload .print with HardwareSerial_print_lint
overload .print with HardwareSerial_print_uint
overload .print with HardwareSerial_print_ulint
overload .print with HardwareSerial_print_char
overload .print with HardwareSerial_print_uchar
overload .print with HardwareSerial_print_double
overload .print with HardwareSerial_print_string
//
(* ****** ****** *)
//
fun
HardwareSerial_println
  (HardwareSerial_ptr): void = "mac#"
fun
HardwareSerial_println_int
  (HardwareSerial_ptr, int): void = "mac#"
fun
HardwareSerial_println_uint
  (HardwareSerial_ptr, uint): void = "mac#"
fun
HardwareSerial_println_lint
  (HardwareSerial_ptr, lint): void = "mac#"
fun
HardwareSerial_println_ulint
  (HardwareSerial_ptr, ulint): void = "mac#"
fun
HardwareSerial_println_char
  (HardwareSerial_ptr, char): void = "mac#"
fun
HardwareSerial_println_uchar
  (HardwareSerial_ptr, uchar): void = "mac#"
fun
HardwareSerial_println_double
  (HardwareSerial_ptr, double): void = "mac#"
fun
HardwareSerial_println_string
  (HardwareSerial_ptr, string): void = "mac#"
//
overload .println with HardwareSerial_println
overload .println with HardwareSerial_println_int
overload .println with HardwareSerial_println_lint
overload .println with HardwareSerial_println_uint
overload .println with HardwareSerial_println_ulint
overload .println with HardwareSerial_println_char
overload .println with HardwareSerial_println_uchar
overload .println with HardwareSerial_println_double
overload .println with HardwareSerial_println_string
//
(* ****** ****** *)

(* end of [HardwareSerial.sats] *)
