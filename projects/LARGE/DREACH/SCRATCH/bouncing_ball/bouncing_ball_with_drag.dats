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
stacst D : real
stacst K : real
stacst dt : real

(* ****** ****** *)

datasort mode = M1 | M2

(* ****** ****** *)

absvtype
state(mode, x:real, v:real)

(* ****** ****** *)
//
extern
fun
state_get_x{m:mode}{x,v:real}(!state(m, x, v)): real(x)
and
state_get_v{m:mode}{x,v:real}(!state(m, x, v)): real(v)
//
overload .x with state_get_x
overload .v with state_get_v
//
(* ****** ****** *)
//
extern
fun
update1_flow
  : {x,v:real | x > 0}
    state(M1, x, v) ->
    state(M1, x+v*dt, v-(g+D*v)*dt)
//
(* ****** ****** *)
//
extern
fun
update1_jump
  : {x,v:real | x <= 0}
    state(M1, x, v) -> state(M2, i2r(0), ~(K*v))
//
(* ****** ****** *)
//
extern
fun
update2_flow
  : {x,v:real | v > 0}
    state(M2, x, v) ->
    state(M2, x+v*dt, v-(g+D*v)*dt)
//
(* ****** ****** *)
//
extern
fun
update2_jump
  : {x,v:real | v <= 0}
    state(M2, x, v) -> state(M1, x, i2r(0))
//
(* ****** ****** *)

fun
loop1{x,v:real}
  (state: state(M1, x, v)): void = let
  val x = state_get_x(state)
in
  if x > 0
    then loop1(update1_flow(state)) else loop2(update1_jump(state))
  // end of [if]
end // end of [loop1]

and
loop2{x,v:real}
  (state: state(M2, x, v)): void = let
  val v = state_get_v(state)
in
  if v > 0
    then loop2(update2_flow(state)) else loop1(update2_jump(state))
  // end of [if]
end // end of [loop2]

(* ****** ****** *)

(* end of [bouncing_ball_with_drag.dats] *)
