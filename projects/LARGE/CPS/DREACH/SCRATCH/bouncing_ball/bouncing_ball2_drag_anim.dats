(*
** BouncingBall(with drag):attempt2
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTedu
//
(* ****** ****** *)
//
#define
ATS_STATIC_PREFIX "bouncing_ball2_drag_anim_"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "bouncing_ball2_drag_anim_dynload"

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
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
absprop EPS(t:time)
//
extern
praxi
lemma_inf_gte
  {t0,t1:time | t0 >= t1}(EPS(t0), real(t1)): EPS(t1)
//
(* ****** ****** *)

stacst g : real
stacst D : real
stacst K : real

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
(
  !state1(t)
) : [deriv(v1,t) == ~g+D*v1(t)*v1(t)] void
//
extern
prfun
mode1_jump
{
  t:time
| x1(t) == 0
}
(
  state1(t)
) : [x2(t) == 0; v2(t) == ~v1(t)] state(m2, t)
//
extern
prfun
mode1_invt{t:time}(!state1(t)): [x1(t) >= 0] void
//
(* ****** ****** *)  
//
extern
praxi
mode1_eqn2
  {t,dt:time}
(
  !state2(t)
) : [deriv(x2,t) == v2(t)] void
extern
praxi
mode2_eqn2
  {t,dt:time}
(
  !state2(t)
) : [deriv(v2,t) == ~g-D*v2(t)*v2(t)] void
//
extern
fun
mode2_jump
{
  t:time
| v2(t) == 0
}
(
  state2(t)
) : [x1(t) == x2(t); v1(t) == 0] state1(t)
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
extern
fun
state1_flow
{ t,dt:time
| dt >= 0; x1(t+dt) >= 0
}
(EPS(dt)|state1(t), real(dt)): state1(t+dt)
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
| dt >= 0; v2(t+dt) >= 0
} (EPS(dt) | state(m2, t), real(dt)): state(m2, t+dt)
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
  pf: EPS(dt) | state1(t), dt: real(dt)
) : real(x1(t+dt))
extern
fun
step_v1
  {t,dt:time}
(
  pf: EPS(dt) | state1(t), dt: real(dt)
) : real(v1(t+dt))
//
extern
fun
step_x2
  {t,dt:time}
(
  pf: EPS(dt) | state2(t), dt: real(dt)
) : real(x2(t+dt))
extern
fun
step_v2
  {t,dt:time}
(
  pf: EPS(dt) | state2(t), dt: real(dt)
) : real(v2(t+dt))
//
(* ****** ****** *)
//
val g = $UN.cast{real(g)}(9.8)
val D = $UN.cast{real(g)}(0.10)
val K = $UN.cast{real(g)}(0.90)
//
implement
step_x1
  (pf | st, dt) =
  $UN.cast(st.x() + st.v() * dt)
implement
step_v1
  (pf | st, dt) = let
  val v1_0 = st.v() in $UN.cast(v1_0 - (g - D * v1_0 * v1_0) * dt)
end // end of [step_vt]
//
implement
step_x2(pf | st, dt) =
  $UN.cast(st.x() + st.v() * dt)
implement
step_v2
  (pf | st, dt) = let
  val v2_0 = st.v() in $UN.cast(v2_0 - (g + D * v2_0 * v2_0) * dt)
end // end of [step_vt]
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
} (EPS(dt) | state(m2, t), real(dt)): state(m2, t+dt)
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
x1_zcross
{ r:real
; t0,t1:time
| x1(t0) >= 0 ; x1(t1) <= 0
}
(
  st: !state1(t0)
, real(t0), real(x1(t0)), real(t1), real(x1(t1))
) : [t:time | t0 <= t; t <= t1; x1(t)==0] real(t)
//
(* ****** ****** *)
//
implement
x1_zcross
  (st, t_0, x1_0, _, _) = $UN.cast(t_0-(x1_0/st.v()))
//
(* ****** ****** *)
//
extern
fun
v2_zcross
{ r:real
; t0,t1:time
| v2(t0) >= 0 ; v2(t1) <= 0
}
(
  st: !state2(t0)
, real(t0), real(v2(t0))
, real(t1), real(v2(t1))
) : [t:time | t0 <= t; t <= t1; v2(t)==0] real(t)
//
(* ****** ****** *)
//
implement
v2_zcross
  (st, t_0, v2_0, _, _) = $UN.cast(t_0+(v2_0/(g+D*v2_0*v2_0)))
//
(* ****** ****** *)
//
extern
fun theFwork_eval(): void
//
extern
fun
delayed_by
(
  delta: real0
, fwork: () -<lincloptr1> void
) : void // end-of-function
//
(* ****** ****** *)

local

val theFwork = ref{int}(0)

in (* in-of-local *)

implement
delayed_by
  (dt, fwork) = let
//
(*
val dt =
  $UN.cast{double}(dt)
//
val dt =
  g1ofg0_int(double2int(dt*1000000))
//
*)
(*
val () = assert(dt >= 0)
val () = assert(dt <= 1000000)
val _(*void*) = usleep_int(dt)
*)
//
in
  theFwork[] := $UN.castvwtp0{int}(fwork)
end // end of [delayed_by]

implement
theFwork_eval() = let
  val fwork = theFwork[]
  val ((*void*)) = theFwork[] := 0
in
  $UN.cast{() -<cloref> void}(fwork)()
end // end of [theFwork_eval]

end // end of [local]

(* ****** ****** *)
//
abstype ball
//
extern
fun ball_new (): ball = "mac#"
//
extern
fun ball_get_x(ball): double = "mac#"
extern
fun ball_set_x(ball, double): void = "mac#"
//
extern
fun
theBall_get(): ball = "mac#"
extern
fun
theBall_get_x(): double = "mac#"
extern
fun
theBall_set_x(double): void = "mac#"
//
extern
fun
theStage_update(): void = "mac#"
extern
fun
theStage_addChild{a:type}(x: a): void = "mac#"
//
(* ****** ****** *)
//
%{^
//
var theStage = 0;
//
function
theStage_initize()
{
//
theStage = new createjs.Stage("theCanvas");
//
} /* theStage_initize */
//
function
theStage_addChild(obj)
{
  theStage.addChild(obj); return;
}
//
function theStage_update() { return theStage.update(); }
//
%}

(* ****** ****** *)

val () = $extfcall(void, "theStage_initize")

(* ****** ****** *)

%{
//
var RAD = 32
var XSCREEN = 640
var YSCREEN = 480
//
function
ball_new()
{
  var
  ball = new createjs.Shape();
  ball.x = XSCREEN/2; ball.y = 0;
  ball.graphics.beginFill("yellow").drawCircle(0, 0, RAD);
  return ball;
}
//
function
ball_get_x(ball) { return ball.x ; }
function
ball_set_x(ball, x0) { ball.y = YSCREEN-20*x0-RAD; return ; }
//
%} // end of [%{]
//
(* ****** ****** *)

local

val
theBall = ref{ball}($UN.cast(0))

fun
theBall_initize(): void =
{
  val B0 = ball_new()
  val () = theBall[] := B0
  val () = theStage_addChild(B0)
}

implement
theBall_get() = theBall[]
implement
theBall_get_x() = ball_get_x(theBall[])
implement
theBall_set_x(x0) = ball_set_x(theBall[], x0)

in (* in-of-local *)

val () = theBall_initize((*void*))

end // end of [local]
  
(* ****** ****** *)

(*
val _0_ = int2real(0)
*)

(* ****** ****** *)

fun
theBall_update
  (x: real0): void =
  theStage_update() where
{
  val () = theBall_set_x($UN.cast(x))
} (* end of [theBall_update] *)

(* ****** ****** *)

#define N 1000

(* ****** ****** *)

extern
fun
state1_loop
{t,dt:time | dt >= 0}
(
  pf: EPS(dt) | n: int, st: state1(t), dt: real(dt)
) : void // end of [state1_loop]
and
state2_loop
{t,dt:time | dt >= 0}
(
  pf: EPS(dt) | n: int, st: state2(t), dt: real(dt)
) : void // end of [state1_loop]

(* ****** ****** *)

implement
state1_loop
  (pf | n, st, dt) = let
//
  val t_0 = state_get_t(st)
  val x1_0 = state_get_x(st)
//
  val n0 = n % N; val n1 = n0 + 1
//
  val x1_dx = step_x1(pf | st, dt)
//
in
//
  if x1_dx >= 0
    then let
      val st_1 =
        state1_flow(pf | st, dt)
      // end of [val]
    in
      if n0 > 0
        then
        state1_loop(pf | n1, st_1, dt)
        else let
          val () = theBall_update(st.x())
        in
          delayed_by(N*dt, llam() => state1_loop(pf | n1, st_1, dt))
        end // end of [else]
      // end of [if]
    end // end of [then]
    else let
      prval () = mode1_invt(st)
        val t_1 =
          x1_zcross(st, t_0, x1_0, t_0+dt, x1_dx)
        // end of [val]
        val dt_1 = t_1 - t_0
      prval pf_1 = lemma_inf_gte(pf, dt_1)
        val st_1 = state1_flow(pf_1 | st, dt_1)
    in
        state2_loop(pf | n1, state1_jump(st_1), dt)
      // delayed_by
    end // end of [else]
//
end // end of [state1_loop]

(* ****** ****** *)

implement
state2_loop
  (pf | n, st, dt) = let
//
  val t_0 = state_get_t(st)
  val v2_0 = state_get_v(st)
//
  val n0 = n % N; val n1 = n0 + 1
//
  val v2_dv = step_v2(pf | st, dt)
//
in
//
  if v2_dv >= 0
    then let
      val st_1 =
        state2_flow(pf | st, dt)
      // end of [val]
    in
      if n0 > 0
        then
        state2_loop(pf | n1, st_1, dt)
        else let
          val () = theBall_update(st.x())
        in
          delayed_by(N*dt, llam() => state2_loop(pf | n1, st_1, dt))
        end // end of [else]
      // end of [if]
    end // end of [then]
    else let
      prval () = mode2_invt(st)
        val t_1 =
          v2_zcross(st, t_0, v2_0, t_0+dt, v2_dv)
        // end of [val]
        val dt_1 = t_1 - t_0
      prval pf_1 = lemma_inf_gte(pf, dt_1)
        val st_1 = state2_flow(pf_1 | st, dt_1)
    in
      state1_loop(pf | n1, state2_jump(st_1), dt)
    end // end of [else]
//
end // end of [state_loop2]

(* ****** ****** *)

local
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
val
theTicks = Bacon_interval{int}(25, 0)
//
in
//
stacst dt : time
//
val dt = $UN.cast{real(dt)}(1.0/(50*N))
prval () = $UN.prop_assert{dt > 0}((*void*))
prval pf = $UN.proof_assert{EPS(dt)}((*void*))
//
val
st0 =
STATE
( m1
, int2real(0)
, $UN.cast(int2real(20)), $UN.cast(int2real(0))
)
//
val () = state1_loop(pf(*EPS(dt)*) | 0, st0, dt)
//
val () = theTicks.onValue()(lam(_) =<cloref1> theFwork_eval())
//
end // end of [local]

(* ****** ****** *)

%{$
//
function
bouncing_ball2_drag_anim_initize()
{
  var _ = bouncing_ball2_drag_anim_dynload()
}
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [bouncing_ball2_drag_anim.dats] *)
