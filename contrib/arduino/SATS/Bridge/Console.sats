(*
** Console library
*)

(* ****** ****** *)

%{#
#include \
"arduino/CATS/Bridge/Console.cats"
%} // end of [%{#]

(* ****** ****** *)

(*
class ConsoleClass
*)
abst@ype
ConsoleClass =
$extype"ConsoleClass"
abstype ConsoleClass_ptr = ptr

(* ****** ****** *)
//
macdef
Console =
$extval(ConsoleClass, "Console")
macdef
Console_ptr =
$extval(ConsoleClass_ptr, "Console_ptr")
//
(* ****** ****** *)
//
fun
Console_end
  (ConsoleClass_ptr): void = "mac#"
fun
Console_begin
  (ConsoleClass_ptr): void = "mac#"
//
overload ._end with Console_end
overload ._begin with Console_begin
//
(* ****** ****** *)
//
fun
Console_buffer
  (ConsoleClass_ptr, size: natLt(256)): void = "mac#"
fun
Console_noBuffer(p0: ConsoleClass_ptr): void = "mac#"
//
(* ****** ****** *)
//
fun
Console_connected
  (p0: ConsoleClass_ptr): bool = "mac#"
//
overload .connected with Console_connected
//
(* ****** ****** *)
//
fun
Console_available
  (p0: ConsoleClass_ptr): int = "mac#"
//
overload .available with Console_available
//
(* ****** ****** *)
//
fun
Console_read(ConsoleClass_ptr): int = "mac#"
fun
Console_peek(ConsoleClass_ptr): int = "mac#"
//
overload .read with Console_read
overload .peek with Console_peek
//
(* ****** ****** *)
//
fun
Console_write_char
  (ConsoleClass_ptr, char): size_t = "mac#"
fun
Console_write_buffer
  {n1,n2:nat | n1 >= n2}
(
  ConsoleClass_ptr, buf: &(@[char][n1]), size_t(n2)
) : size_t = "mac#" // end of [Console_write_buffer]
//
fun
Console_flush (ConsoleClass_ptr): void = "mac#"
//
(* ****** ****** *)
//
overload .write with Console_write_char
overload .write with Console_write_buffer
overload .flush with Console_flush(*void*)
//
(* ****** ****** *)
//
fun
Console_print_int
  (ConsoleClass_ptr, int): void = "mac#"
fun
Console_print_uint
  (ConsoleClass_ptr, uint): void = "mac#"
fun
Console_print_lint
  (ConsoleClass_ptr, lint): void = "mac#"
fun
Console_print_ulint
  (ConsoleClass_ptr, ulint): void = "mac#"
fun
Console_print_char
  (ConsoleClass_ptr, char): void = "mac#"
fun
Console_print_uchar
  (ConsoleClass_ptr, uchar): void = "mac#"
fun
Console_print_double
  (ConsoleClass_ptr, double): void = "mac#"
fun
Console_print_string
  (ConsoleClass_ptr, string): void = "mac#"
//
overload .print with Console_print_int
overload .print with Console_print_lint
overload .print with Console_print_uint
overload .print with Console_print_ulint
overload .print with Console_print_char
overload .print with Console_print_uchar
overload .print with Console_print_double
overload .print with Console_print_string
//
(* ****** ****** *)
//
fun
Console_println
  (ConsoleClass_ptr): void = "mac#"
fun
Console_println_int
  (ConsoleClass_ptr, int): void = "mac#"
fun
Console_println_uint
  (ConsoleClass_ptr, uint): void = "mac#"
fun
Console_println_lint
  (ConsoleClass_ptr, lint): void = "mac#"
fun
Console_println_ulint
  (ConsoleClass_ptr, ulint): void = "mac#"
fun
Console_println_char
  (ConsoleClass_ptr, char): void = "mac#"
fun
Console_println_uchar
  (ConsoleClass_ptr, uchar): void = "mac#"
fun
Console_println_double
  (ConsoleClass_ptr, double): void = "mac#"
fun
Console_println_string
  (ConsoleClass_ptr, string): void = "mac#"
//
overload .println with Console_println
overload .println with Console_println_int
overload .println with Console_println_lint
overload .println with Console_println_uint
overload .println with Console_println_ulint
overload .println with Console_println_char
overload .println with Console_println_uchar
overload .println with Console_println_double
overload .println with Console_println_string
//
(* ****** ****** *)

(* end of [Console.sats] *)
