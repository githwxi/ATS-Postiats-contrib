(*
** Process library
*)

(* ****** ****** *)

%{#
#include \
"arduino/CATS/Bridge/Process.cats"
%} // end of [%{#]

(* ****** ****** *)
//
(*
class Process : Stream
*)
abst@ype
Process =
$extype"Process"
abstype
Process_ptr =
$extype"Process_ptr"
//
(* ****** ****** *)
//
fun
Process((*void*)): Process_ptr = "mac#"
//
(* ****** ****** *)
//
fun
Process_available
  (p0: Process_ptr): int = "mac#"
//
overload .available with Process_available
//
(* ****** ****** *)
//
fun
Process_read(Process_ptr): int = "mac#"
fun
Process_peek(Process_ptr): int = "mac#"
//
overload .read with Process_read
overload .peek with Process_peek
//
(* ****** ****** *)
//
fun
Process_write_char
  (Process_ptr, char): size_t = "mac#"
//
(* ****** ****** *)
//
fun
Process_flush (Process_ptr): void = "mac#"
//
(* ****** ****** *)
//
overload .write with Process_write_char
overload .flush with Process_flush(*void*)
//
(* ****** ****** *)

(* end of [Process.sats] *)
