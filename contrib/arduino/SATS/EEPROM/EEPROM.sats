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
class EEPROMClass
*)
abst@ype
EEPROMClass =
$extype"EEPROMClass"
abstype EEPROMClass_ptr = ptr
//
(* ****** ****** *)
//
macdef
EEPROM = $extval(EEPROMClass, "EEPROM")
//
(* ****** ****** *)
//
fun
EEPROM_read
  (EEPROMClass_ptr, address: intGte(0)): uint8 = "mac#"
fun
EEPROM_write
  (EEPROMClass_ptr, address: intGte(0), uint8): void = "mac#"
//
overload .read with EEPROM_read
overload .write with EEPROM_write
//
(* ****** ****** *)

(* end of [EEPROM.sats] *)
