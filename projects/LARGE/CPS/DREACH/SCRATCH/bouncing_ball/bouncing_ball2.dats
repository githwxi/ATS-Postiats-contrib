(*
** BouncingBall: attempt2
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTedu
// Start time : June, 2016
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
absprop EPS(t:time)
//
extern
praxi
lemma_eps_gte
  {t0,t1:time | t0 >= t1}(EPS(t0), real(t1)): EPS(t1)
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

vtypedef state1(t:time) = state(m1, t)
vtypedef state2(t:time) = state(m2, t)

(* ****** ****** *)
//
stacst
deriv :
(time -> real, time(*t*)) -> real
//
(* ****** ****** *)
//
extern
praxi
mode1_eqn1
  {t:time}
(
  !state1(t)
) : [deriv(x1,t) == v1(t)] void
extern
praxi
mode1_eqn2
  {t:time}
  (!state1(t)): [deriv(v1,t) == ~g] void
//
extern
praxi
mode1_jump
{
  t:time
| x1(t) == 0
} (!state1(t))
: [x2(t) == x1(t); v2(t) == ~v1(t)] void
//
extern
prfun
mode1_invt{t:time}(!state1(t)): [x1(t) >= 0] void
//
(* ****** ****** *)  
//
extern
praxi
mode2_eqn2
  {t,dt:time}
(
  !state2(t)
) : [deriv(x2,t) == v2(t)] void
extern
praxi
mode2_eqn2
  {t,dt:time}
  (!state2(t)): [deriv(v2,t) == ~g] void
//
extern
praxi
mode2_jump
{
  t:time
| v2(t) == 0
} (!state2(t)): [x1(t) == x2(t); v1(t) == 0] void
//
extern
prfun
mode2_invt{t:time}(!state2(t)): [v2(t) >= 0] void
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
( EPS(dt)
| state1(t), real(dt)): state1(t+dt)
//
extern
fun
state1_jump
{t:time|x1(t)==0}(state1(t)): state2(t)
//
(* ****** ****** *)
//
extern
fun
state2_flow
{ t,dt:time
| v2(t+dt) >= 0
} (EPS(dt)|state2(t),real(dt)): state2(t+dt)
//
extern
fun
state2_jump{t:time|v2(t) == 0}(state2(t)): state1(t)
//
(* ****** ****** *)
//
extern
fun
step_x1
  {t,dt:time}
(
  pf: EPS(dt) | !state1(t), dt: real(dt)
) : real(x1(t+dt))
and
step_v1
  {t,dt:time}
(
  pf: EPS(dt) | !state1(t), dt: real(dt)
) : real(v1(t+dt))
//
extern
fun
step_x2
  {t,dt:time}
(
  pf: EPS(dt) | !state2(t), dt: real(dt)
) : real(x2(t+dt))
and
step_v2
  {t,dt:time}
(
  pf: EPS(dt) | !state2(t), dt: real(dt)
) : real(v2(t+dt))
//
(* ****** ****** *)
//
extern
fun
x1_zcross
{ t0,t1:time
| t0 <= t1 ;
  x1(t0) >= 0 ; x1(t1) <= 0
}
(
  st: !state1(t0)
, real(t0), real(x1(t0))
, real(t1), real(x1(t1))
) : [t:time |
     t0 <= t; t <= t1; x1(t)==0] real(t)
//
(* ****** ****** *)
//
extern
fun
v2_zcross
{ t0,t1:time
| t0 <= t1 ;
  v2(t0) >= 0; v2(t1) <= 0
}
(
  st: !state2(t0)
, real(t0), real(v2(t0))
, real(t1), real(v2(t1))
) : [t:time |
     t0 <= t; t <= t1; v2(t)==0] real(t)
//
(* ****** ****** *)

extern
fun
state1_loop
{t,dt:time | dt >= 0}
(
  pf: EPS(dt) | st: state1(t), dt: real(dt)
) : void // end-of-function
extern
fun
state2_loop
{t,dt:time | dt >= 0}
(
  pf: EPS(dt) | st: state2(t), dt: real(dt)
) : void // end-of-function

(* ****** ****** *)

implement
state1_loop
  (pf | st, dt) = let
//
  val t_0 = state_get_t(st)
  val x1_0 = state_get_x(st)
  val x1_dx = step_x1(pf | st, dt)
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
    prval () = mode1_invt(st)
      val t_1 =
        x1_zcross(st, t_0, x1_0, t_0+dt, x1_dx)
      // end of [val]
      val dt_1 = t_1 - t_0
    prval pf_1 = lemma_eps_gte(pf, dt_1)
    prval ((*void*)) =
      __assert__(t_0+dt_1) where
      {
        extern
        praxi __assert__{t:time|x1(t)==0}(real(t)): [x1(t) >= 0] void
      }
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
  val v2_dv = step_v2(pf | st, dt)
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
    prval () = mode2_invt(st)
      val t_1 =
        v2_zcross(st, t_0, v2_0, t_0+dt, v2_dv)
      // end of [val]
      val dt_1 = t_1 - t_0
    prval pf_1 = lemma_eps_gte(pf, dt_1)
    prval ((*void*)) =
      __assert__(t_0+dt_1) where
      {
        extern
        praxi __assert__{t:time|v2(t)==0}(real(t)): [v2(t) >= 0] void
      }
      val st_1 = state2_flow(pf_1 | st, dt_1)
    in
      state1_loop(pf | state2_jump(st_1), dt)
    end // end of [else]
//
end // end of [state_loop2]

(* ****** ****** *)

(* end of [bouncing_ball2.dats] *)
