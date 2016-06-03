(*
** Bouncing ball: attemp 2
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTedu
//
(* ****** ****** *)
//
staload
"libats/SATS/Number/real.sats"
staload
"libats/DATS/Number/real_double.dats"
//
(* ****** ****** *)

sortdef mode = int
sortdef time = real

(* ****** ****** *)
//
absprop INF(t:time)
//
extern
praxi
lemma_inf_gte
  {t0,t1:time | t0 >= t1}(INF(t0), real(t1)): INF(t1)
//
(* ****** ****** *)

stacst g : real

(* ****** ****** *)

stadef m1 = 1 and m2 = 2

(* ****** ****** *)
//
stacst x
  : (mode, time) -> real
stacst v
  : (mode, time) -> real
//
(* ****** ****** *)

stadef x1(t:time) = x(m1, t)
stadef x2(t:time) = x(m2, t)
stadef v1(t:time) = v(m1, t)
stadef v2(t:time) = v(m2, t)

(* ****** ****** *)

absvtype state(mode, time)

vtypedef state1(t) = state(m1, t)
vtypedef state2(t) = state(m2, t)

(* ****** ****** *)
//
stacst
deriv :
(
  time -> real, time(*t*), time(*dt*)
) -> real
//
(* ****** ****** *)
//
extern
praxi
state1_eqn1
  {t,dt:time}
(
  INF(dt) | !state1(t)
) : [deriv(x1,t,dt) == v1(t)] void
extern
praxi
state1_eqn2
  {t,dt:time}
  (INF(dt) | !state1(t)): [deriv(v1,t,dt) == ~g] void
//
(* ****** ****** *)  
//
extern
praxi
state2_eqn2
  {t,dt:time}
(
  INF(dt) | !state(m2, t)
) : [deriv(x2,t,dt) == v2(t)] void
extern
praxi
state2_eqn2
  {t,dt:time}
  (INF(dt) | !state(m2, t)): [deriv(v2,t,dt) == ~g] void
//
(* ****** ****** *)  
//
extern
fun
state_get_t
  {m:mode}{t:time}(!state(m, t)): real(t)
extern
fun
state_get_x
  {m:mode}{t:time}(!state(m, t)): real(x(m, t))
extern
fun
state_get_v
  {m:mode}{t:time}(!state(m, t)): real(v(m, t))
//
(* ****** ****** *)
//
extern
fun
state1_flow
{ t,dt:time
| x1(t+dt) >= 0
}
(INF(dt)|state1(t), real(dt)): state1(t+dt)
//
extern
fun
state1_jump
{
  t:time
| x1(t) == 0
} (state1(t))
: [x2(t) == 0; v2(t) == ~v1(t)] state(m2, t)
//
(* ****** ****** *)
//
extern
fun
state2_flow
{ t,dt:time
| v2(t+dt) >= 0
} (INF(dt) | state(m2, t), real(dt)): state(m2, t+dt)
//
extern
fun
state2_jump
{
  t:time
| v2(t) == 0
} (state2(t)): [x1(t) == x2(t); v1(t) == 0] state1(t)
//
(* ****** ****** *)

extern
fun
delta_x1
  {t,dt:time}
(
  pf: INF(dt) | !state1(t), dt: real(dt)
) : real(x1(t+dt))

extern
fun
delta_v2
  {t,dt:time}
(
  pf: INF(dt) | !state2(t), dt: real(dt)
) : real(v2(t+dt))

(* ****** ****** *)
//
extern
fun
x1_midval
{ r:real
; t0,t1:time
| x1(t0) >= r ; r >= x1(t1)
}
(
  real(x1(t0)), real(r), real(x1(t1))
) : [t:time | t0 >= t; t >= t1; x1(t)==0] real(t)
//
(* ****** ****** *)
//
extern
fun
v2_midval
{ r:real
; t0,t1:time
| v2(t0) >= r ; r >= v2(t1)
}
(
  real(v2(t0)), real(r), real(v2(t1))
) : [t:time | t0 >= t; t >= t1; v2(t)==0] real(t)
//
(* ****** ****** *)

extern
fun
state1_loop
{t,dt:time}
(
  pf: INF(dt) | st: state1(t), dt: real(dt)
) : void // end-of-function
extern
fun
state2_loop
{t,dt:time}
(
  pf: INF(dt) | st: state2(t), dt: real(dt)
) : void // end-of-function

(* ****** ****** *)

val _0_ = int2real(0)

(* ****** ****** *)

implement
state1_loop
  (pf | st, dt) = let
//
  val t_0 = state_get_t(st)
  val x1_0 = state_get_x(st)
  val x1_dx = delta_x1(pf | st, dt)
//
in
//
  if x1_dx >= 0
    then let
      val st_1 =
      state1_flow(pf | st, dt)
    in
      state1_loop(pf | st_1, dt)
    end // end of [then]
    else let
        val t_1 =
          x1_midval(x1_0, _0_, x1_dx)
        // end of [val]
        val dt_1 = t_1 - t_0
      prval pf_1 = lemma_inf_gte(pf, dt_1)
        val st_1 = state1_flow(pf_1 | st, dt_1)
    in
      state2_loop(pf | state1_jump(st_1), dt)
    end // end of [else]
//
end // end of [state1_loop]

(* ****** ****** *)

implement
state2_loop
  (pf | st, dt) = let
//
  val t_0 = state_get_t(st)
  val v2_0 = state_get_v(st)
  val v2_dv = delta_v2(pf | st, dt)
//
in
//
  if v2_dv >= 0
    then let
      val st_1 =
      state2_flow(pf | st, dt)
    in
      state2_loop(pf | st_1, dt)
    end // end of [then]
    else let
        val t_1 =
          v2_midval(v2_0, _0_, v2_dv)
        // end of [val]
        val dt_1 = t_1 - t_0
      prval pf_1 = lemma_inf_gte(pf, dt_1)
        val st_1 = state2_flow(pf_1 | st, dt_1)
    in
      state1_loop(pf | state2_jump(st_1), dt)
    end // end of [else]
//
end // end of [state_loop2]

(* ****** ****** *)

(* end of [bouncing_ball2.dats] *)
