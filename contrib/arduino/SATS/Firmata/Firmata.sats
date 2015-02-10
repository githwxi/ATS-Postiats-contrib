(*
** Firmata library
*)

(* ****** ****** *)

%{#
#include \
"arduino/CATS/Firmata/Firmata.cats"
%} // end of [%{#]

(* ****** ****** *)

typedef byte = uint8

(* ****** ****** *)
//
(*
class FirmataClass
*)
abst@ype
FirmataClass =
$extype"FirmataClass"
abstype FirmataClass_ptr = ptr
//
(* ****** ****** *)
//
macdef Firmata = $extval(FirmataClass, "Firmata")
macdef Firmata_ptr = $extval(FirmataClass_ptr, "Firmata_ptr")
//
(* ****** ****** *)
//
macdef
DIGITAL_MESSAGE = $extval(byte, "DIGITAL_MESSAGE")
macdef ANALOG_MESSAGE = $extval(byte, "ANALOG_MESSAGE")
macdef REPORT_ANALOG = $extval(byte, "REPORT_ANALOG")
macdef REPORT_DIGITAL = $extval(byte, "REPORT_DIGITAL")
//
macdef SET_PIN_MODE = $extval(byte, "SET_PIN_MODE")
//
macdef SYSTEM_RESET = $extval(byte, "SYSTEM_RESET")
macdef REPORT_VERSION = $extval(byte, "REPORT_VERSION")
//
macdef START_SYSEX = $extval(byte, "START_SYSEX")
macdef END_SYSEX = $extval(byte, "END_SYSEX")
//
(* ****** ****** *)
//
(*
void begin();
void begin(long);
void begin(Stream &s);
*)
//
fun Firmata_begin (FirmataClass_ptr): void = "mac#"
fun Firmata_begin_lint (FirmataClass_ptr, lint): void = "mac#"

(* ****** ****** *)

overload ._begin with Firmata_begin
overload ._begin with Firmata_begin_lint

(* ****** ****** *)
//
(*
void blinkVersion(void);
void printFirmwareVersion(void);
void setFirmwareVersion(byte major, byte minor);  // see macro below
void setFirmwareNameAndVersion(const char *name, byte major, byte minor);
*)
fun Firmata_blinkVersion (FirmataClass_ptr): void = "mac#"
fun Firmata_printFirmwareVersion (FirmataClass_ptr): void = "mac#"
fun
Firmata_setFirmwareVersion
  (FirmataClass_ptr, natLt(256), natLt(256)): void = "mac#"
fun
Firmata_setFirmwareNameAndVersion
  (FirmataClass_ptr, string, natLt(256), natLt(256)): void = "mac#"
//
(* ****** ****** *)

fun Firmata_available (FirmataClass_ptr): int = "mac#"
fun Firmata_processInput (FirmataClass_ptr): void = "mac#"

(* ****** ****** *)

overload .available with Firmata_available
overload .processInput with Firmata_processInput

(* ****** ****** *)

(* end of [Firmata.sats] *)
