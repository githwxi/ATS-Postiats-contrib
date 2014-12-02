(*
#
# HttpClient
#
*)
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$ARDUINO}/staloadall.hats"
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload _ = "prelude/DATS/list.dats"
staload _ = "prelude/DATS/list_vt.dats"

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
staload "{$ARDUINO}/SATS/Bridge/HttpClient.sats"

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
var HC: HttpClient
val HCP = $UN.cast{HttpClient_ptr}(addr@HC)
//
(*
val err = HCP.get("http://192.168.1.3:8888")
*)
//
val err = HCP.get("http://arduino.cc/asciilogo.txt")
//
val () =
while(HCP.available())
{
  val c =
  $extmcall(char, HC, "read")
  val () = Console_ptr.print(c)
} (* end of [where] *)
//
val () = Console_ptr.flush()
//
} (* end of [myloop] *)

(* ****** ****** *)

(* end of [HttpClient.dats] *)
