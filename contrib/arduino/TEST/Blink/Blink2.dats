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

#define NDELAY 1000.0

(* ****** ****** *)

extern
fun
myloop (): void = "myloop"

(* ****** ****** *)

implement
myloop () = () where
{
//
val () = DDRB[DDB5] := 1
//
val () =
while(true)
{
  val () = PORTB[PORTB5] := 1
  val () = _delay_ms (NDELAY)
  val () = PORTB[PORTB5] := 0
  val () = _delay_ms (NDELAY)
}
//
} (* end of [myloop] *)

(* ****** ****** *)

%{$
//
void
setup () { return; }
//
void loop () { myloop(); return; }
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Blink2.dats] *)
