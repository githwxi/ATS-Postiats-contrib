(*
#
# ListOps
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
//
staload
"{$ARDUINO}/SATS/Firmata/Firmata.sats"  
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

%{^
#define \
ATSextmcall(obj, mtd, funarg) obj.mtd funarg
%} // end of [%{^]

(* ****** ****** *)
//
extern
fun
digitalWriteCallback
(
  port: byte, value: int
) : void = "mac#" // endfun
//
implement
digitalWriteCallback
(
  port, value
) = () where
{
  val () = digitalWrite (13, if(value=0)then(0)else(1))
}
//
(* ****** ****** *)

extern
fun
setup
(
// argless
) : void = "mac#"

implement
setup () =
{
//
val () =
$extmcall (void, Firmata, "setFirmwareVersion", 0, 1)
val () =
$extmcall (void, Firmata, "attach", DIGITAL_MESSAGE, digitalWriteCallback)
//
val ((*void*)) = $extmcall (void, Firmata, "begin", 57600)
//
} (* end of [setup] *)

(* ****** ****** *)
//
extern
fun
loop
(
// argless
) : void = "mac#"
//
implement
loop () =
{
//
val () =
if Firmata_ptr.available() > 0 then Firmata_ptr.processInput()
//
} // end of [loop]
//
(* ****** ****** *)

(* end of [Blink.dats] *)
