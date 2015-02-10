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

#define NDELAY1 1000.0
#define NDELAY2 1000.0

(* ****** ****** *)
//
extern
fun
loop (): void = "mac#"
//
implement
loop () = () where
{
  val () = PORTB[PORTB5] := 1
  val () = _delay_ms (NDELAY1)
  val () = PORTB[PORTB5] := 0
  val () = _delay_ms (NDELAY2)
}
//
(* ****** ****** *)
//
extern
fun
setup (): void = "mac#"
implement
setup () = () where
{
//
val () = DDRB[DDB5] := 1
//
} (* end of [setup] *)
//
(* ****** ****** *)

(* end of [Blink2.dats] *)
