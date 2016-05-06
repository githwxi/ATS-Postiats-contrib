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
//
extern
fun{}
update1
  : {x,v:real | x > 0}
    (state(M1, x, v)) ->
    state(M1, x+v*dt, v+g*dt)
//
(* ****** ****** *)
//
extern
fun{}
update1_jump
  : {x,v:real | x <= 0}
    state(M1, x, v) -> state(M2, i2r(0), ~v)
//
(* ****** ****** *)
//
extern
fun{}
update2
  : {x,v:real | v > 0}
    state(M2, x, v) ->
    state(M2, x+v*dt, v+g*dt)
//
(* ****** ****** *)
//
extern
fun{}
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
(* ****** ****** *)
//
extern
fun{}
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
val g = $UN.cast(9.8): real(g)
//
(* ****** ****** *)

implement
{}(*tmp*)
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
{}(*tmp*)
update1_jump(state) = let
//
val+STATE1(x, v) = state
//
in
  STATE2(int2real(0), ~v)
end // end of [update1_jump]

(* ****** ****** *)

implement
{}(*tmp*)
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
{}(*tmp*)
update2_jump(state) = let
//
val+STATE2(x, v) = state
//
in
  STATE1(x, int2real(0))
end // end of [update2_jump]

(* ****** ****** *)

fun{}
loop1{x,v:real}
  (state: state(M1, x, v)): void = let
  val dt = the_dt_get()
  val x = state_get_x(state)
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
  val dt = the_dt_get()
  val v = state_get_v(state)
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

(* end of [bouncing_ball_anim.dats] *)
