(*
** BouncingBall: attempt3
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
absprop DERIV
(
  f: time -> real, time(*t*), r: real
) (* absprop DERIV *)
//
(* ****** ****** *)
//
absvtype state(mode, time)
absvtype vstate(mode, time)
//
(* ****** ****** *)
//
extern
fun
vstate_free
  {m:mode}
  {t:time}(vstate(m, t)): void
//
overload .free with vstate_free
//
(* ****** ****** *)
//
extern
fun
state_get_time
  {m:mode}{t:time}(!state(m, t)): real(t)
extern
fun
vstate_get_time
  {m:mode}{t:time}(!vstate(m, t)): real(t)
//
overload .time with state_get_time
overload .time with vstate_get_time
//
(* ****** ****** *)
//
stacst g : real
(*
stadef g = f2r(9.8)
*)
//
(* ****** ****** *)
//
stacst x : (mode, time) -> real
stacst v : (mode, time) -> real
//
stadef x1(t:time) = x(1, t)
stadef x2(t:time) = x(2, t)
stadef v1(t:time) = v(1, t)
stadef v2(t:time) = v(2, t)
//
vtypedef state1(t:time) = state(1, t)
vtypedef state2(t:time) = state(2, t)
vtypedef vstate1(t:time) = vstate(1, t)
vtypedef vstate2(t:time) = vstate(2, t)
//
(* ****** ****** *)
//
extern
fun
state_get_x
  {m:mode}{t:time}(!state(m, t)): real(x(m, t))
extern
fun
state_get_v
  {m:mode}{t:time}(!state(m, t)): real(v(m, t))
//
overload .x with state_get_x
overload .v with state_get_v
//
(* ****** ****** *)
//
extern
fun
vstate_get_x
  {m:mode}{t:time}(!vstate(m, t)): real(x(m, t))
extern
fun
vstate_get_v
  {m:mode}{t:time}(!vstate(m, t)): real(v(m, t))
//
overload .x with vstate_get_x
overload .v with vstate_get_v
//
(* ****** ****** *)
//
stadef
mode1_inv
  (t:time) =
  (x1(t) >= 0 && v1(t) <= 0)
//
stadef
mode1_flow_dx
  (t:time, dt:time) =
  (x1(t+dt)-x1(t) == v1(t)*dt)
stadef
mode1_flow_dv
  (t:time, dt:time) =
  (v1(t+dt)-v1(t) == ( ~g )*dt)
//
stadef
mode1_jmp1_pre
  (t: time) = (x1(t) == 0)
stadef
mode1_jmp1_post
  (t: time) =
  (x2(t)==x1(t) && v2(t) == ~v1(t))
//
(* ****** ****** *)
//
stadef
mode2_inv
  (t:time) =
  (x2(t) >= 0 && v2(t) >= 0)
//
stadef
mode2_flow_dx
  (t:time, dt:time) =
  (x2(t+dt)-x2(t) == v2(t)*dt)
stadef
mode2_flow_dv
  (t:time, dt:time) =
  (v2(t+dt)-v2(t) == ( ~g )*dt)
//
stadef
mode2_jmp1_pre
  (t: time) = (v2(t) == 0)
stadef
mode2_jmp1_post
  (t: time) =
  (x1(t) == x2(t) && v1(t) == ( 0 ))
//
(* ****** ****** *)
//
extern
praxi
state1_inv
  {t:time}
  (!state1(t)): [mode1_inv(t)] void
//
extern
fun
state1_reify
  {m0:mode}
  {t0,t1:time|mode1_inv(t1)}
  (state(m0,t0), vstate1(t1)): state1(t1)
//
extern
fun
state1_flow_eval
{t,dt:time}
(
  state: !state1(t), dt: real(dt)
) :
[
  mode1_flow_dx(t, dt)
; mode1_flow_dv(t, dt) ] vstate1(t+dt)
extern
fun
state1_jmp1_eval
{ t:time
| mode1_jmp1_pre(t)
} (state: !state1(t)): [mode1_jmp1_post(t)] vstate2(t)
//
(* ****** ****** *)
//
extern
praxi
state2_inv
  {t:time}
  (!state2(t)): [mode2_inv(t)] void
//
extern
fun
state2_reify
  {m0:mode}
  {t0,t1:time|mode2_inv(t1)}
  (state(m0,t0), vstate2(t1)): state2(t1)
//
extern
fun
state2_flow_eval
{t,dt:time}
(
  state: !state2(t), dt: real(dt)
) :
[
  mode2_flow_dx(t, dt)
; mode2_flow_dv(t, dt) ] vstate2(t+dt)
extern
fun
state2_jmp1_eval
{ t:time
| mode2_jmp1_pre(t)
} (state: !state2(t)): [mode2_jmp1_post(t)] vstate1(t)
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
(st: state1(t), dt: real(dt)): void
extern
fun
state2_loop
{t,dt:time | dt >= 0}
(st: state2(t), dt: real(dt)): void

(* ****** ****** *)

implement
state1_loop
  {t,dt}(st, dt) = let
//
prval () =
$UN.prop_assert{g > 0}()
//
prval () = state1_inv(st)
//
  val t_0 = st.time()
  val st_ = state1_flow_eval{t,dt}(st, dt)
//
  val x1_0 = st.x()
  val x1_dt = st_.x()
//
in
//
  if x1_dt >= 0
    then (
      state1_loop(state1_reify(st, st_), dt)
    ) (* end of [then] *)
    else let
      val () = st_.free()
      val t_1 =
        x1_zcross(st, t_0, x1_0, t_0+dt, x1_dt)
      // end of [val]
      val dt_1 = t_1 - t_0
    prval ((*void*)) =
      __assert__(t_0+dt_1) where
      {
        extern
        praxi
        __assert__
          {t:time|x1(t)==0}(real(t)): [x1(t) >= 0] void
        // praxi
      } (* end of [prval] *)
//
      val st_ =
        state1_flow_eval(st, dt_1)
      // end of [val]
      val st_1 = state1_reify(st, st_)
//
      val st_1_ = state1_jmp1_eval(st_1)
      val st_1_2 = state2_reify(st_1, st_1_)
//
    in
      state2_loop(st_1_2, dt)
    end // end of [else]
//
end // end of [state1_loop]

(* ****** ****** *)

implement
state2_loop
  {t,dt}(st, dt) = let
//
prval () =
$UN.prop_assert{g > 0}()
//
prval () = state2_inv(st)
//
  val t_0 = st.time()
  val st_ = state2_flow_eval{t,dt}(st, dt)
//
  val v2_0 = st.v()
  val v2_dt = st_.v()
//
in
//
  if v2_dt >= 0
    then (
      state2_loop(state2_reify(st, st_), dt)
    ) (* end of [then] *)
    else let
      val () = st_.free()
      val t_1 =
        v2_zcross(st, t_0, v2_0, t_0+dt, v2_dt)
      // end of [val]
      val dt_1 = t_1 - t_0
    prval ((*void*)) =
      __assert__(t_0+dt_1) where
      {
        extern
        praxi __assert__{t:time|v2(t)==0}(real(t)): [v2(t) >= 0] void
      } (* end of [prval] *)
      val st_ =
        state2_flow_eval(st, dt_1)
      // end of [val]
      val st_1 = state2_reify(st, st_)
//
      val st_1_ = state2_jmp1_eval(st_1)
      val st_1_2 = state1_reify(st_1, st_1_)
//
    in
      state1_loop(st_1_2, dt)
    end // end of [else]
//
end // end of [state_loop2]

(* ****** ****** *)

(* end of [bouncing_ball3.dats] *)
