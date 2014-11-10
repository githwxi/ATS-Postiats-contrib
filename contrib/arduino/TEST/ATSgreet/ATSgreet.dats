(*
** HX-2014-11-09:
** This is adapted from
** some code by Kiwamu Okabe
** See:
** https://raw.githubusercontent.com/fpiot/arduino-ats/master/demo/lcd_ats/DATS/main.dats
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
#include
"{$ARDUINO}/staloadall.hats"
//
staload
"{$ARDUINO}/SATS/LiquidCrystal/LiquidCrystal.sats"
//
typedef lcd = LiquidCrystal_ptr
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#define LCD_WIDTH 16

(* ****** ****** *)

val g_str_atsrun = "<ATS running!>"
val g_str_message = "\
ATS is a statically typed programming language that \
unifies implementation with formal specification. It \
is equipped with a highly expressive type system rooted \
in the framework Applied Type System, which gives the \
language its name. In particular, both dependent types \
and linear types are available in ATS.\
" // end of [g_str_message]

(* ****** ****** *)
//
extern
fun{}
myprint_one (): void
extern
fun{}
myprint_many (n: intGte(0)): void
//
implement
{}(*tmp*)
myprint_many
  (n) = let
in
  if n > 0 then (myprint_one(); myprint_many(n-1))
end // end of [myprint_many]
//
(* ****** ****** *)
//
extern
fun{}
myprint_char (char): void
extern
fun{}
myprint_string (str: string): void
//
implement
{}(*tmp*)
myprint_string
  (str) = let
//
fun
loop
(
  p: ptr
) : void = let
  val c = $UN.ptr0_get<char> (p)
in
  if isneqz(c) then (myprint_char(c); loop(ptr0_succ<char>(p)))
end // end of [loop]
//
in
  loop (string2ptr(str))
end // end of [myprint_string]
//
(* ****** ****** *)
//
extern
fun
lcd_print_row0 (lcd): void
//
implement
lcd_print_row0 (lcd) = let
//
val str = g_str_atsrun
val len = length (str)
val margin = half(LCD_WIDTH - sz2i(len))
val () = lcd.setCursor(0, margin)
//
implement
myprint_char<> (c) =
(
  ignoret(lcd.write($UN.cast{natLt(256)}(c)))
) (* end of [myprint_char] *)
//
in
  myprint_string (str)
end // end of [lcd_print_row0]
//
(* ****** ****** *)
//
extern
fun
lcd_print_row1
  (lcd, pos: intGte(0)): int
//
implement
lcd_print_row1
  (lcd, pos) = let
//
val p0 = string2ptr(g_str_message)
//
var i0: int = pos
fun{}
i0_get () = $UN.ptr0_get<int> (addr@i0)
fun{}
i0_set (i: int) = $UN.ptr0_set<int> (addr@i0, i)
fun{}
getc(): char = let
  val i = i0_get()
in
//
if
i < LCD_WIDTH
then
(
  i0_set (i+1); ' '
) (* end of [then] *)
else let
  val c =
  $UN.ptr0_get_at<char> (p0, i-LCD_WIDTH)
in
  if isneqz(c) then (i0_set (i+1); c) else ' '
end // end of [else]
//
end // end of [getc]
//
implement
myprint_one<> () =
(
  ignoret(lcd.write($UN.cast{natLt(256)}(getc())))
) (* end of [myprint_one] *)
//
val () = myprint_many (LCD_WIDTH)
//
in
  i0 - (pos)
end // end of [lcd_print_row1]
//
(* ****** ****** *)

#define NDELAY 250

(* ****** ****** *)
//
extern
fun
setup (): void = "mac#"
//
implement
setup () = ()
//
(* ****** ****** *)
//
extern
fun loop (): void = "mac#"
and loop2 (lcd, pos: intGte(0)): void = "mac#"
//
%{$
void
loop ()
{
  LiquidCrystal lcd(8, 13, 9, 4, 5, 6, 7); loop2(&lcd, 0); return;
}
%} // end of [%{$]
//
(* ****** ****** *)

implement
loop2 (lcd, pos) = let
//
val () = lcd_print_row0 (lcd)
val n1 = lcd_print_row1 (lcd, 0)
val () = delay (NDELAY)
//
in
  if n1 > 0 then loop2 (lcd, pos + 1) else loop2 (lcd, 0)
end // end of [loop2]

(* ****** ****** *)

(* end of [ATSgreet.dats] *)
