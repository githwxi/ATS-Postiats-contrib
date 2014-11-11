(*
** EEPROM library
*)

(* ****** ****** *)

%{#
#include \
"arduino/CATS/EEPROM/EEPROM.cats"
%} // end of [%{#]

(* ****** ****** *)
//
(*
class EEPROMclass
*)
abst@ype
EEPROMclass =
$extype"EEPROMclass"
abstype EEPROMclass_ptr = ptr
//
(* ****** ****** *)
//
macdef
EEPROM = $extval (EEPROMclass, "EEPROM")
//
(* ****** ****** *)

fun EEPROM_read (address: int): uint8 = "mac#"
fun EEPROM_write (address: int, uint8): void = "mac#"

(* ****** ****** *)

(* end of [EEPROM.sats] *)
