(*
#
# EEPROMread
#
*)
(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
#define
ARDUINO_targetloc "./../.."
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$ARDUINO}/staloadall.hats"
//
(* ****** ****** *)

staload
UNSAFE = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
staload
"{$ARDUINO}/SATS/EEPROM/EEPROM.sats"
//
(* ****** ****** *)

%{^
//
#define \
ATSextmcall(obj, mtd, funarg) obj.mtd funarg
//
%} // end of [%{^]

(* ****** ****** *)
//
macdef BAUD_RATE = 9600
//
macdef
DEFAULT = $extval(uint8, "DEFAULT")
macdef
INTERNAL = $extval(uint8, "INTERNAL")
//
macdef
EEPROM = $extval(EEPROMClass, "EEPROM")
macdef
EEPROM_ptr = $extval(EEPROMClass_ptr, "&EEPROM")
//
(* ****** ****** *)
//
extern
fun
setup (): void = "mac#"
//
implement
setup () =
{
//
val () = analogReference(DEFAULT)
//
} (* end of [setup] *)
//
(* ****** ****** *)
//
extern
fun
loop (): void = "mac#"
and
myloop (a: natLt(512)): void
//
(* ****** ****** *)
//
implement
loop () = myloop (0)
//
implement
myloop (a) = let
//
val x = analogRead(0)
val () = EEPROM_ptr.write(a, $UNSAFE.cast{uint8}(x/4))
//
val a1 = a + 1
//
in
//
if a1 < 512 then myloop(a1) else (delay(1000); myloop(0))
//
end // end of [myloop]

(* ****** ****** *)

(* end of [EEPROMwrite.dats] *)
