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
#define
ATS_STATIC_PREFIX "bouncing_ball2_anim_"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "bouncing_ball2_anim_dynload"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"libats/SATS/Number/real.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
staload
"{$LIBATSCC2JS}/DATS/Number/real_double.dats"
//
(* ****** ****** *)

sortdef mode = int
sortdef time = real

typedef mode(mode) = int(mode)

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

#define m1 1; #define m2 2

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

(*
absvtype state(mode, time)
*)
//
datatype
state(m: mode, t:time) =
| STATE(m, t) of
    (mode(m), real(t), real(x(m,t)), real(v(m,t)))
  // end of [STATE]
//
vtypedef state1(t) = state(m1, t)
vtypedef state2(t) = state(m2, t)
//
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
  INF(dt) | state1(t)
) : [deriv(x1,t,dt) == v1(t)] void
extern
praxi
state1_eqn2
  {t,dt:time}
  (INF(dt) | state1(t)): [deriv(v1,t,dt) == ~g] void
//
(* ****** ****** *)  
//
extern
praxi
state2_eqn2
  {t,dt:time}
(
  INF(dt) | state(m2, t)
) : [deriv(x2,t,dt) == v2(t)] void
extern
praxi
state2_eqn2
  {t,dt:time}
  (INF(dt) | state(m2, t)): [deriv(v2,t,dt) == ~g] void
//
(* ****** ****** *)  
//
extern
fun
state_get_t
  {m:mode}{t:time}
  (st: state(m, t)): real(t)
extern
fun
state_get_x
  {m:mode}{t:time}
  (st: state(m, t)): real(x(m, t))
extern
fun
state_get_v
  {m:mode}{t:time}
  (st: state(m, t)): real(v(m, t))
//
overload .t with state_get_t
overload .x with state_get_x
overload .v with state_get_v
//
(* ****** ****** *)
//
implement
state_get_t(STATE(m, t, x, v)) = t
implement
state_get_x(STATE(m, t, x, v)) = x
implement
state_get_v(STATE(m, t, x, v)) = v
//
(* ****** ****** *)
//
(*
extern
fun
jump_x1
{t:time|x1(t)==0}(state1(t)): [x2(t)==0] void
extern
fun
jump_v1
{t:time|x1(t)==0}(state1(t)): [v2(t)==(~v1(t))] void
*)
//
extern
fun
step_x1
  {t,dt:time}
(
  pf: INF(dt) | state1(t), dt: real(dt)
) : real(x1(t+dt))
extern
fun
step_v1
  {t,dt:time}
(
  pf: INF(dt) | state1(t), dt: real(dt)
) : real(v1(t+dt))
//
extern
fun
step_x2
  {t,dt:time}
(
  pf: INF(dt) | state2(t), dt: real(dt)
) : real(x2(t+dt))
extern
fun
step_v2
  {t,dt:time}
(
  pf: INF(dt) | state2(t), dt: real(dt)
) : real(v2(t+dt))
//
(* ****** ****** *)
//
val g = $UN.cast{real(g)}(9.8)
//
implement
step_x1(pf | st, dt) =
  $UN.cast(st.x() + st.v() * dt)
implement
step_v1(pf | st, dt) = $UN.cast(st.v() - g * dt)
//
implement
step_x2(pf | st, dt) =
  $UN.cast(st.x() + st.v() * dt)
implement
step_v2(pf | st, dt) = $UN.cast(st.v() - g * dt)
//
(* ****** ****** *)

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
{t:time | x1(t) == 0} (state1(t)): state2(t)
//
(* ****** ****** *)
//
implement
state1_flow
  (pf | st, dt) = let
//
val t_dt = st.t() + dt
val x1_dt = step_x1(pf|st,dt)
val v1_dt = step_v1(pf|st,dt)
//
in
  STATE(m1, t_dt, x1_dt, v1_dt)
end // end of [state1_flow]
//
implement
state1_jump
  (st as STATE(m, t, x, v)) =
  STATE(m2, t, $UN.cast(x), $UN.cast(~v))
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
state2_jump{t:time| v2(t) == 0}(state2(t)): state1(t)
//
(* ****** ****** *)
//
implement
state2_flow
  (pf | st, dt) = let
//
val t_dt = st.t() + dt
val x2_dt = step_x2(pf|st,dt)
val v2_dt = step_v2(pf|st,dt)
//
in
  STATE(m2, t_dt, x2_dt, v2_dt)
end // end of [state1_flow]
//
implement
state2_jump
  (st as STATE(m, t, x, v)) =
  STATE(m1, t, $UN.cast(x), $UN.cast( v ))
//
(* ****** ****** *)
//
extern
fun
x1_midval
{ r:real
; t,dt:time
| x1(t) >= 0 ; x1(t+dt) <= 0
}
( INF(dt)
| state1(t)
, real(x1(t)), real(x1(t+dt))
) : [t1:time | t <= t1; t1 <= t+dt; x1(t1)==0] real(t1)
//
(* ****** ****** *)
//
implement
x1_midval
  (pf | st, x1_0, _) = $UN.cast(st.t()-(x1_0/st.v()))
//
(* ****** ****** *)
//
extern
fun
v2_midval
{ r:real
; t,dt:time
| v2(t) >= 0 ; v2(t+dt) <= 0
}
( INF(dt)
| state2(t)
, real(v2(t)), real(v2(t+dt))
) : [t1:time | t <= t1; t1 <= t+dt; v2(t1)==0] real(t)
//
(* ****** ****** *)
//
implement
v2_midval
  (pf | st, v2_0, _) = $UN.cast(st.t() + (v2_0 / (g)))
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

(*
val _0_ = int2real(0)
*)

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
        val t_1 =
          x1_midval(pf | st, x1_0, x1_dx)
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
        val t_1 =
          v2_midval(pf | st, v2_0, v2_dv)
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

(* end of [bouncing_ball2_anim.dats] *)
