(*
** Bouncing ball
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTedu
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
"libats/SATS/NUMBER/real.sats"
//
staload
"libats/DATS/NUMBER/real_double.dats"
//
(* ****** ****** *)

stacst g : real
stacst dt : real

(* ****** ****** *)

datasort mode = M1 | M2

(* ****** ****** *)

datatype
mode(mode) = M1(M1) | M2(M2)

(* ****** ****** *)

(*
absvtype
state(mode, x:real, v:real)
*)

(* ****** ****** *)
//
datatype
state(mode, x: real, v:real) =
| STATE1(M1,x,v) of (real(x), real(v))
| STATE2(M2,x,v) of (real(x), real(v))
//
(* ****** ****** *)
//
extern
fun
state_get_x
{m:mode}{x,v:real}(!state(m, x, v)): real(x)
and
state_get_v
{m:mode}{x,v:real}(!state(m, x, v)): real(v)
//
overload .x with state_get_x
overload .v with state_get_v
//
(* ****** ****** *)

implement
state_get_x
  (state) =
(
  case+ state of STATE1(x, _) => x | STATE2(x, _) => x
)
implement
state_get_v
  (state) =
(
  case+ state of STATE1(_, v) => v | STATE2(_, v) => v
)

(* ****** ****** *)
//
extern
fun
update1
  : {x,v:real | x > 0}
    (state(M1, x, v)) ->
    state(M1, x+v*dt, v+g*dt)
//
(* ****** ****** *)
//
extern
fun
update1_jump
  : {x,v:real | x <= 0}
    state(M1, x, v) -> state(M2, i2r(0), ~v)
//
(* ****** ****** *)
//
extern
fun
update2
  : {x,v:real | v > 0}
    state(M2, x, v) ->
    state(M2, x+v*dt, v+g*dt)
//
(* ****** ****** *)
//
extern
fun
update2_jump
  : {x,v:real | v <= 0}
    (state(M2, x, v)) -> state(M1, x, i2r(0))
//
(* ****** ****** *)
//
extern
fun{}
the_dt_get(): real(dt)
//
implement
{}(*tmp*)
the_dt_get() = $UN.cast(1.0/100)
//
(* ****** ****** *)
//
extern
fun
delayed_by
(
  delta: real0, fwork: () -<lincloptr1> void
) : void // end-of-function
//
(* ****** ****** *)
//
prval () =
  $UN.prop_assert{false}()
//
(* ****** ****** *)
//
val g = $UN.cast(~9.8): real(g)
//
(* ****** ****** *)

implement
update1(state) = let
//
val dt = the_dt_get()
val+STATE1(x, v) = state
//
in
  STATE1(x+v*dt, v+g*dt)
end // end of [update1]

(* ****** ****** *)

implement
update1_jump(state) = let
//
val+STATE1(x, v) = state
//
in
  STATE2(int2real(0), ~v)
end // end of [update1_jump]

(* ****** ****** *)

implement
update2(state) = let
//
val dt = the_dt_get()
val+STATE2(x, v) = state
//
in
  STATE2(x+v*dt, v+g*dt)
end // end of [update2]

(* ****** ****** *)

implement
update2_jump(state) = let
//
val+STATE2(x, v) = state
//
in
  STATE1(x, int2real(0))
end // end of [update2_jump]

(* ****** ****** *)

local

staload
"libc/SATS/unistd.sats"

in (* in-of-local *)

implement
delayed_by
  (dt, fwork) = let
//
val dt =
  $UN.cast{double}(dt)
//
val dt =
  g1ofg0_int(g0f2i(dt*1000000))
//
val () = assert(dt >= 0)
val () = assert(dt <= 1000000)
//
val _(*void*) = usleep_int(dt)
//
val () = fwork()
//
in
  cloptr_free($UN.castvwtp0{cloptr(void)}(fwork))
end // end of [delayed_by]

end // end of [local]

(* ****** ****** *)

fun
loop1{x,v:real}
  (state: state(M1, x, v)): void = let
//
  val dt = the_dt_get()
//
  val x = state_get_x(state)
  val v = state_get_v(state)
(*
  val () = println! ("state1: x = ", x)
  val () = println! ("state1: v = ", v)
*)
in
  if x > 0
    then
    delayed_by
      (dt, llam() => loop1(update1(state)))
    // delayed_by
    else loop2(update1_jump(state))
  // end of [if]
end // end of [loop1]

and
loop2{x,v:real}
  (state: state(M2, x, v)): void = let
//
  val dt = the_dt_get()
//
  val x = state_get_x(state)
  val v = state_get_v(state)
(*
  val () = println! ("state2: x = ", x)
  val () = println! ("state2: v = ", v)
*)
in
  if v > 0
    then
    delayed_by
      (dt, llam() => loop2(update2(state)))
    // delayed_by
    else loop1(update2_jump(state))
  // end of [if]
end // end of [loop2]

(* ****** ****** *)

implement
main0() =
{
//
val x0 = int2real(10)
val v0 = int2real(00)
val () = loop1(STATE1(x0, v0))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [bouncing_ball_anim.dats] *)
