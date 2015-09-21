(*
** LiquidCrystal library
*)

(* ****** ****** *)

%{#
#include \
"arduino/CATS/LedControl/LedControl.cats"
%} // end of [%{#]

(* ****** ****** *)
//
(*
class LedControl
*)
abst@ype
LedControl =
$extype"LedControl"
abstype LedControl_ptr = ptr
//
(* ****** ****** *)
//
fun
LedControl
(
  dataPin: int
, clockPin: int, csPin: int, ndevice: int
) : LedControl_ptr = "mac#" // end-of-fun
//
(* ****** ****** *)

fun
LedControl_getDeviceCount(): int = "mac#"

(* ****** ****** *)
//
fun
LedControl_shutdown
(
  LedControl_ptr, addr: int, status: bool
) : void = "mac#" // end-of-function
//
overload .shutdown with LedControl_shutdown
//
(* ****** ****** *)
//
fun
LedControl_setScanLimit
(
  LedControl_ptr, addr: int, limit: intBtwe(1, 8)
) : void = "mac#" // end-of-function
//
fun
LedControl_setIntensity
(
  LedControl_ptr, addr: int, intensity: intBtw(0, 16)
) : void = "mac#" // end-of-function
//
overload .setScanLimit with LedControl_setScanLimit
overload .setIntensity with LedControl_setIntensity
//
(* ****** ****** *)
//
fun
LedControl_clearDisplay(addr: int): void = "mac#"
//
overload .clearDisplay with LedControl_clearDisplay
//
(* ****** ****** *)
//
fun
LedControl_setLed
(
  addr: int, row: int, col: int, state: bool
) : void = "mac#" // end of [LedControl_setLed]
//
overload .setLed with LedControl_setLed // overload
//
(* ****** ****** *)
//
fun
LedControl_setRow
  (addr: int, row: int, value: byte): void = "mac#"
//
overload .setRow with LedControl_setRow // overload
//
(* ****** ****** *)
//
fun
LedControl_setColumn
  (addr: int, col: int, value: byte): void = "mac#"
//
overload .setColumn with LedControl_setColumn // overload
//
(* ****** ****** *)
//
fun
LedControl_setChar
(
  addr: int, digit: int, value: char, dp: bool
) : void = "mac#" // end of [LedControl_setDigit]
//
overload .setChar with LedControl_setChar // overload
//
fun
LedControl_setDigit
(
  addr: int, digit: int, value: byte, dp: bool
) : void = "mac#" // end of [LedControl_setDigit]
//
overload .setDigit with LedControl_setDigit // overload
//
(* ****** ****** *)

(* end of [LedControl.sats] *)
