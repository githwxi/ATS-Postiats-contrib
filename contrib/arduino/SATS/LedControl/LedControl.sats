(*
** LedControl library
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
typedef byte = $extype"byte"
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
//
fun
LedControl_getDeviceCount
  (lc: LedControl_ptr): int = "mac#"
//
overload .getDeviceCount with LedControl_getDeviceCount
//
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
LedControl_clearDisplay
  (lc: LedControl_ptr, addr: int): void = "mac#"
//
overload .clearDisplay with LedControl_clearDisplay
//
(* ****** ****** *)
//
fun
LedControl_setLed
(
  LedControl_ptr
, addr: int, row: int, col: int, state: bool
) : void = "mac#" // end of [LedControl_setLed]
//
overload .setLed with LedControl_setLed // overload
//
(* ****** ****** *)
//
fun
LedControl_setRow
(
  LedControl_ptr, addr: int, row: int, value: byte
) : void = "mac#" // end of [LedControl_setRow]
//
overload .setRow with LedControl_setRow // overload
//
(* ****** ****** *)
//
fun
LedControl_setColumn
(
  LedControl_ptr, addr: int, col: int, value: byte
) : void = "mac#" // end of [LedControl_setColumn]
//
overload .setColumn with LedControl_setColumn // overload
//
(* ****** ****** *)
//
fun
LedControl_setChar
(
  LedControl_ptr
, addr: int, digit: int, value: char, dp: bool
) : void = "mac#" // end of [LedControl_setDigit]
//
overload .setChar with LedControl_setChar // overload
//
fun
LedControl_setDigit
(
  LedControl_ptr
, addr: int, digit: int, value: byte, dp: bool
) : void = "mac#" // end of [LedControl_setDigit]
//
overload .setDigit with LedControl_setDigit // overload
//
(* ****** ****** *)

(* end of [LedControl.sats] *)
