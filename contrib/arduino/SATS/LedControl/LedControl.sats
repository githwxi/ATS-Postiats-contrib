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

(* end of [LedControl.sats] *)
