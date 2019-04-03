(*
#
# WiFiStatus
#
*)
(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
#define
ARDUINO_targetloc "./../../.."
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$ARDUINO}/staloadall.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

%{^
typedef char *charptr;
%} // end of [%{^]
abstype charptr = $extype"charptr"

(* ****** ****** *)

%{^
#define ATS_MFREE free
#define ATS_MALLOC malloc
#define ATSextfcall(fun, funarg) fun funarg
#define ATSextmcall(obj, mtd, funarg) obj.mtd funarg
%} // end of [%{^]

(* ****** ****** *)

staload "{$ARDUINO}/SATS/Bridge/Bridge.sats"
staload "{$ARDUINO}/SATS/Bridge/Console.sats"
staload "{$ARDUINO}/SATS/Bridge/Process.sats"

(* ****** ****** *)
//
extern
fun
setup (): void = "mac#"
//
implement
setup () =
{
  val () = Bridge_ptr._begin()
//
  val () = Console_ptr._begin()
  val () = while(~Console_ptr.connected()) ()
//
  val () = Console_ptr.println("[setup]: Console is connected!")
//
} (* end of [setup] *)
//
(* ****** ****** *)
//
extern
fun
myloop ((*void*)): void
//
(* ****** ****** *)
//
extern
fun
loop (): void = "mac#"
implement
loop () =
{
  val () = myloop ()
  val () = delay(5000)
}
//
(* ****** ****** *)

implement
myloop () =
{
//
var WiFiCK: Process
val WiFiCKP = $UN.cast{Process_ptr}(addr@WiFiCK)
//
val err = WiFiCKP.runShellCommand("/usr/bin/pretty-wifi-info.lua")
//
val () =
while(WiFiCKP.available() > 0)
{
  val char =
  $extmcall(char, WiFiCK, "read")
  val ((*void*)) = Console_ptr.print(char)
} (* end of [where] *)
//
val () = Console_ptr.flush()
//
} (* end of [myloop] *)

(* ****** ****** *)

(* end of [WiFiStatus.dats] *)
