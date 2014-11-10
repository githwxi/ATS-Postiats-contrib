(*
** LiquidCrystal library
*)

(* ****** ****** *)

%{#
#include \
"arduino/CATS/LiquidCrystal/LiquidCrystal.cats"
%} // end of [%{#]

(* ****** ****** *)

(*
class LiquidCrystal
*)
abstype LiquidCrystal_ptr = ptr

(* ****** ****** *)
//
fun
LiquidCrystal_begin_2
(
  LiquidCrystal_ptr, col: natLt(256), row: natLt(256)
) : void = "mac#" // end-of-function
//
overload ._begin with LiquidCrystal_begin_2
//
(* ****** ****** *)
//
fun
LiquidCrystal_home(LiquidCrystal_ptr): void = "mac#"
fun
LiquidCrystal_clear(LiquidCrystal_ptr): void = "mac#"
//
overload .home with LiquidCrystal_home
overload .clear with LiquidCrystal_clear
//
(* ****** ****** *)
//
fun
LiquidCrystal_blink(LiquidCrystal_ptr): void = "mac#"
fun
LiquidCrystal_noBlink(LiquidCrystal_ptr): void = "mac#"
//
overload .blink with LiquidCrystal_blink
overload .noBlink with LiquidCrystal_noBlink
//
(* ****** ****** *)
//
fun
LiquidCrystal_cursor(LiquidCrystal_ptr): void = "mac#"
fun
LiquidCrystal_noCursor(LiquidCrystal_ptr): void = "mac#"
//
overload .cursor with LiquidCrystal_cursor
overload .noCursor with LiquidCrystal_noCursor
//
(* ****** ****** *)
//
fun
LiquidCrystal_display(LiquidCrystal_ptr): void = "mac#"
fun
LiquidCrystal_noDisplay(LiquidCrystal_ptr): void = "mac#"
//
overload .display with LiquidCrystal_display
overload .noDisplay with LiquidCrystal_noDisplay
//
(* ****** ****** *)
//
fun
LiquidCrystal_autoscroll(LiquidCrystal_ptr): void = "mac#"
fun
LiquidCrystal_noAutoscroll(LiquidCrystal_ptr): void = "mac#"
//
overload .autoscroll with LiquidCrystal_autoscroll
overload .noAutoscroll with LiquidCrystal_noAutoscroll
//
(* ****** ****** *)
//
fun
LiquidCrystal_leftToRight
  (lcd: LiquidCrystal_ptr): void = "mac#"
fun
LiquidCrystal_rightToLeft
  (lcd: LiquidCrystal_ptr): void = "mac#"
//
overload .leftToRight with LiquidCrystal_leftToRight
overload .rightToLeft with LiquidCrystal_rightToLeft
//
(* ****** ****** *)
//
fun
LiquidCrystal_scrollDisplayLeft
  (lcd: LiquidCrystal_ptr): void = "mac#"
fun
LiquidCrystal_scrollDisplayRight
  (lcd: LiquidCrystal_ptr): void = "mac#"
//
overload .scrollDisplayLeft with LiquidCrystal_scrollDisplayLeft
overload .scrollDisplayRight with LiquidCrystal_scrollDisplayRight
//
(* ****** ****** *)
//
fun
LiquidCrystal_write
(
  LiquidCrystal_ptr, c: natLt(256)
) : size_t = "mac#" // end-of-function
//
overload .write with LiquidCrystal_write
//
(* ****** ****** *)
//
fun
LiquidCrystal_command
(
  lcd: LiquidCrystal_ptr, cmd: natLt(256)
) : void = "mac#" // end-of-function
//
overload .command with LiquidCrystal_command
//
(* ****** ****** *)
//
fun
LiquidCrystal_setCursor
(
  lcd: LiquidCrystal_ptr, col: natLt(256), row: natLt(256)
) : void = "mac#" // end-of-function
//
overload .setCursor with LiquidCrystal_setCursor
//
(* ****** ****** *)
//
fun
LiquidCrystal_createChar
(
  lcd: LiquidCrystal_ptr, num: natLt(8), data: cPtr1(uint8)
) : void = "mac#" // end-of-function
//
overload .createChar with LiquidCrystal_createChar
//
(* ****** ****** *)

(* end of [LiquidCrystal.sats] *)
