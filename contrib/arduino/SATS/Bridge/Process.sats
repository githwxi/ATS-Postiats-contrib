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
Process_begin
  (Process_ptr, cmd: string): void = "mac#"
//
overload ._begin with Process_begin
//
(* ****** ****** *)
fun
Process_addParameter
  (Process_ptr, param: string): void = "mac#"
//
overload .addParameter with Process_addParameter
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
Process_run(Process_ptr): uint = "mac#"
fun
Process_runAsynchronously(Process_ptr): void = "mac#"
//
fun
Process_runShellCommand
  (Process_ptr, command: string): uint = "mac#"
fun
Process_runShellCommandAsynchronously
  (Process_ptr, command: string): void = "mac#"
//
overload .run with Process_run
overload .runAsynchronously with Process_runAsynchronously
overload .runShellCommand with Process_runShellCommand
overload .runShellCommandAsynchronously with Process_runShellCommandAsynchronously
//
(* ****** ****** *)
//
fun
Process_running(Process_ptr): bool = "mac#"
fun
Process_exitValue(Process_ptr): uint = "mac#"
//
fun Process_close(Process_ptr): void = "mac#"
//
overload .running with Process_running
overload .exitValue with Process_exitValue
overload .close with Process_close(*void*)
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
