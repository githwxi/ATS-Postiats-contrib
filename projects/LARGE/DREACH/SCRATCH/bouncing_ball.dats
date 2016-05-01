(*
** Bouncing ball
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTedu
//
(* ****** ****** *)

datasort real = // abs

(* ****** ****** *)

abstype real(real)

(* ****** ****** *)

stacst g : real
stacst dt : real

(* ****** ****** *)

stacst
int2real : (int) -> real
stadef i2r = int2real

(* ****** ****** *)

stacst
neg_real : (real) -> real
stadef ~ = neg_real

(* ****** ****** *)

stacst
add_real_real : (real, real) -> real
stadef + = add_real_real
stacst
sub_real_real : (real, real) -> real
stadef - = sub_real_real

(* ****** ****** *)

stacst
mul_real_real : (real, real) -> real
stadef * = mul_real_real

(* ****** ****** *)

stacst
gt_real_int : (real, int) -> bool
stadef > = gt_real_int

(* ****** ****** *)

stacst
eq_real_int : (real, int) -> bool
stadef == = eq_real_int

(* ****** ****** *)
//
extern
fun
gt_real_int
  {x:real;i:int}
  (real(x), int(i)): bool(x > i)
//
overload > with gt_real_int
//
(* ****** ****** *)

datasort mode = M1 | M2

(* ****** ****** *)

absvtype
state (mode, x:real, v:real)

(* ****** ****** *)
//
extern
fun
state_get_x{m:mode}{x,v:real}(!state(m, x, v)): real(x)
and
state_get_v{m:mode}{x,v:real}(!state(m, x, v)): real(v)
//
(* ****** ****** *)
//
extern
fun
update1: {x,v:real | x > 0}
         state(M1, x, v) -> state(M1, x+v*dt, v+g*dt)
//
(* ****** ****** *)
//
extern
fun
update1_jump
  : {x,v:real | x == 0} state(M1, x, v) -> state(M2, x, ~v)
//
(* ****** ****** *)
//
extern
fun
update2: {x,v:real | v > 0}
         state(M2, x, v) -> state(M2, x+v*dt, v-g*dt)
//
(* ****** ****** *)
//
extern
fun
update2_jump
  : {x,v:real | v == 0} state(M2, x, v) -> state(M1, x, i2r(0))
//
(* ****** ****** *)

fun
loop1{x,v:real}
  (state: state(M1, x, v)): void = let
  val x = state_get_x(state)
in
  if x > 0
    then loop1(update1(state)) else loop2(update1_jump(state))
  // end of [if]
end // end of [loop1]

and
loop2{x,v:real}
  (state: state(M2, x, v)): void = let
  val v = state_get_v(state)
in
  if v > 0
    then loop2(update2(state)) else loop1(update2_jump(state))
  // end of [if]
end // end of [loop2]

(* ****** ****** *)

(* end of [bouncing_ball.dats] *)
