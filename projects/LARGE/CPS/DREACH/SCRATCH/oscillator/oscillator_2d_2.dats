(*
** Oscillator(2D)
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
//
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

stacst ax: real
stacst ay: real
stacst omega: real

(* ****** ****** *)

stacst x : (mode, time) -> real
stacst y : (mode, time) -> real
stacst tau : (mode, time) -> real

(* ****** ****** *)

stadef x1(t:time) = x(1, t)
stadef y1(t:time) = y(1, t)
stadef tau1(t:time) = tau(1, t)

(* ****** ****** *)
//
extern
praxi
lemma_x
  {m:mode;t:time}
  ((*void*))
: [~i2r(10) <= x(m,t) && x(m,t) <= ~i2r(10)] void
//
(* ****** ****** *)

prval () = $solver_assert(lemma_x)

(* ****** ****** *)

vtypedef state1(t:time) = state(1, t)
vtypedef vstate1(t:time) = vstate(1, t)

(* ****** ****** *)
//
extern
fun
state_get_x
  {m:mode}
  {t:time}(!state(m, t)): real(x(m, t))
extern
fun
state_get_y
  {m:mode}
  {t:time}(!state(m, t)): real(y(m, t))
//
overload .x with state_get_x
overload .y with state_get_y
//
(* ****** ****** *)
//
extern
fun
vstate_get_x
  {m:mode}
  {t:time}(!vstate(m, t)): real(x(m, t))
extern
fun
vstate_get_y
  {m:mode}
  {t:time}(!vstate(m, t)): real(y(m, t))
//
overload .x with vstate_get_x
overload .y with vstate_get_y
//
(* ****** ****** *)
//
stadef
mode1_inv
  (t:time) =
  (x1(t) >= ~i2r(10) && y1(t) >= ~i2r(10))
//
(* ****** ****** *)
//
stadef
mode1_flow_dx
  (t:time, dt:time) =
  (x1(t+dt)-x1(t) == ~ax * sin(omega*tau1(t)) * dt)
//
stadef
mode1_flow_dy
  (t:time, dt:time) =
  (y1(t+dt)-y1(t) == ~ay * sin(omega*tau1(t)) * omega * dt)
//
stadef
mode1_flow_dtau
  (t:time, dt:time) =
  (tau1(t+dt)-tau1(t) == dt)
//
stadef
mode1_jmp1_pre(t: time) = true
stadef
mode1_jmp1_post(t: time) = true
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
(* ****** ****** *)

extern
fun
state1_flow_eval
{t,dt:time}
(
  state: !state1(t), dt: real(dt)
) :
[
  mode1_flow_dx(t, dt)
; mode1_flow_dy(t, dt) 
; mode1_flow_dtau(t, dt) ] vstate1(t+dt)

(* ****** ****** *)

extern
fun
state1_loop
{t,dt:time | dt >= 0}
(st: state1(t), dt: real(dt)): void

(* ****** ****** *)

implement
state1_loop
  {t,dt}(st, dt) = let
//
prval () = state1_inv(st)
//
  val t_0 = st.time()
  val st_ = state1_flow_eval{t,dt}(st, dt)
//
in
  state1_loop(state1_reify(st, st_), dt)
end // end of [state1_loop]

(* ****** ****** *)

(* end of [oscillator_2d_2.dats] *)
