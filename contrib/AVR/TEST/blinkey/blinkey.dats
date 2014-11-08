(*
** HX-2014-11-07:
** This is adapted from
** some code by William Blair
*)

(* ****** ****** *)
//
%{^
typedef
void
*voilatile_voidptr;
%}
//
#define ATS_DYNLOADFLAG 0  
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
staload "{$AVR}/basics.sats"
//
staload "{$AVR}/SATS/avr/io.sats"
staload "{$AVR}/SATS/avr/iom328p.sats"
//
staload "{$AVR}/SATS/util/delay.sats"
//
(* ****** ****** *)

#define NDELAY 250.0

(* ****** ****** *)

extern
fun main (): int = "main"

(* ****** ****** *)

implement
main () = 0 where
{
//
val () = DDRB[DDB3] := 1
//
val () =
while(true)
{
  val () = PORTB[PORTB3] := 1
  val () = _delay_ms (NDELAY)
  val () = PORTB[PORTB3] := 0
  val () = _delay_ms (NDELAY)
}
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [blinkey.dats] *)
