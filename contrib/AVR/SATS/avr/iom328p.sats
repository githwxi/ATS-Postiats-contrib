(* ****** ****** *)
//
// For applying ATS
// to AVR programming
//
(* ****** ****** *)

%{#
//
#include \
"AVR/CATS/avr/iom328p.cats"
//
%} // end of [%{#]

(* ****** ****** *)
//
staload
"./../../basics.sats"
//
(* ****** ****** *)
//
fun
reg8_get_at
(
  reg8, i: natLt(8)
) : natLt(2) = "mac#"
fun
reg8_set_at
(
  reg8, i: natLt(8), b: natLt(2)
) : void = "mac#" // end-of-fun
fun
reg8_set0_at(reg8, i: natLt(8)): void = "mac#"
fun
reg8_set1_at(reg8, i: natLt(8)): void = "mac#"
//
overload [] with reg8_get_at
overload [] with reg8_set_at
//
(* ****** ****** *)
//
(*
#define PINB _SFR_IO8(0x03)
*)
macdef PINB = $extval(reg8, "PINB")
//
#define PINB0 0
#define PINB1 1
#define PINB2 2
#define PINB3 3
#define PINB4 4
#define PINB5 5
#define PINB6 6
#define PINB7 7
//
(*
#define DDRB _SFR_IO8(0x04)
*)
macdef DDRB = $extval(reg8, "DDRB")
//
#define DDB0 0
#define DDB1 1
#define DDB2 2
#define DDB3 3
#define DDB4 4
#define DDB5 5
#define DDB6 6
#define DDB7 7
//
(*
#define PORTB _SFR_IO8(0x05)
*)
macdef PORTB = $extval(reg8, "PORTB")
//
#define PORTB0 0
#define PORTB1 1
#define PORTB2 2
#define PORTB3 3
#define PORTB4 4
#define PORTB5 5
#define PORTB6 6
#define PORTB7 7
//
(* ****** ****** *)

(* end of [iom328p.sats] *)
