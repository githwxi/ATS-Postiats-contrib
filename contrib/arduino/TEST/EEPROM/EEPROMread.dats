(*
#
# EEPROMread
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
Serial = $extval(HardwareSerial, "Serial")
macdef
Serial_ptr = $extval(HardwareSerial_ptr, "&Serial")
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
val () = Serial_ptr._begin(BAUD_RATE)
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
val x = EEPROM_ptr.read(a)
val () = Serial_ptr.print(a)
val () = Serial_ptr.print("\t")
val () = $extmcall(void, Serial, "print", x, DEC)
val () = Serial_ptr.println()
//
val a1 = a + 1
//
in
//
if a1 < 512 then myloop(a1) else (delay(1000); myloop(0))
//
end // end of [myloop]

(* ****** ****** *)

(* end of [EEPROMread.dats] *)
