(*
** SPI library
*)

(* ****** ****** *)

%{#
#include "arduino/CATS/SPI/SPI.cats"
%} // end of [%{#]

(* ****** ****** *)

macdef // 0x00
SPI_CLOCK_DIV4 = $extval(int, "SPI_CLOCK_DIV4")
macdef // 0x01
SPI_CLOCK_DIV16 = $extval(int, "SPI_CLOCK_DIV16")
macdef // 0x02
SPI_CLOCK_DIV64 = $extval(int, "SPI_CLOCK_DIV64")
macdef // 0x03
SPI_CLOCK_DIV128 = $extval(int, "SPI_CLOCK_DIV128")
macdef // 0x04
SPI_CLOCK_DIV2 = $extval(int, "SPI_CLOCK_DIV2")
macdef // 0x05
SPI_CLOCK_DIV8 = $extval(int, "SPI_CLOCK_DIV8")
macdef // 0x06
SPI_CLOCK_DIV32 = $extval(int, "SPI_CLOCK_DIV32")
macdef // 0x07
SPI_CLOCK_DIV64 = $extval(int, "SPI_CLOCK_DIV64")

(* ****** ****** *)

macdef SPI_MODE0 = $extval(int, "SPI_MODE0") // 0x00
macdef SPI_MODE1 = $extval(int, "SPI_MODE1") // 0x04
macdef SPI_MODE2 = $extval(int, "SPI_MODE2") // 0x08
macdef SPI_MODE3 = $extval(int, "SPI_MODE3") // 0x0C

(* ****** ****** *)
//
(*
// CPOL = bit 3,
// CPHA = bit 2 on SPCR
#define SPI_MODE_MASK 0x0C
// SPR1 = bit 1,
// SPR0 = bit 0 on SPCR
#define SPI_CLOCK_MASK 0x03
// SPI2X = bit 0 on SPSR
#define SPI_2XCLOCK_MASK 0x01
*)
macdef
SPI_MODE_MASK = $extval(int, "SPI_MODE_MASK")
macdef
SPI_CLOCK_MASK = $extval(int, "SPI_CLOCK_MASK")
macdef
SPI_2XCLOCK_MASK = $extval(int, "SPI_2XCLOCK_MASK")
//
(* ****** ****** *)

(*
class SPIClass
*)
abst@ype
SPIClass =
$extype"SPIClass"
abstype SPIClass_ptr = ptr

(* ****** ****** *)

macdef SPI = $extval(SPIClass, "SPI")
macdef SPI_ptr = $extval(SPIClass_ptr, "SPI_ptr")

(* ****** ****** *)
(*
void end();
void begin(); // default
*)
fun
SPI_end
  (SPIClass_ptr): void = "mac#"
fun
SPI_begin
  (SPIClass_ptr): void = "mac#"
//
overload ._end with SPI_end
overload ._begin with SPI_begin
//
(* ****** ****** *)
//
fun SPI_attachInterrupt(): void = "mac#"
fun SPI_detachInterrupt(): void = "mac#" // default
//
overload .attachInterrupt with SPI_attachInterrupt
overload .detachInterrupt with SPI_detachInterrupt
//
(* ****** ****** *)
//
fun SPI_setBitOrder(natLt(256)): void = "mac#"
fun SPI_setDataMode(natLt(256)): void = "mac#"
fun SPI_setClockDivider(natLt(256)): void = "mac#"
//
overload .setBitOrder with SPI_setBitOrder
overload .setDataMode with SPI_setDataMode
overload .setClockDivider with SPI_setClockDivider
//
(* ****** ****** *)

(* end of [SPI.sats] *)
