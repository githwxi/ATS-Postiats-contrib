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
#define
ATS_STATIC_PREFIX "oscillator_2d_anim_"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "oscillator_2d_anim_dynload"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
(*
#include
"share/atspre_staload.hats"
*)
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
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
staload
"{$LIBATSCC2JS}/DATS/Number/real_double.dats"
//
(* ****** ****** *)
(*
#define ax 1
#define ay 1.2
#define omega 3.14
*)
//
stacst ax: real
stacst ay: real
stacst omega: real
//
stacst dt : real
//
(* ****** ****** *)

datasort mode = M1

(* ****** ****** *)

(*
absvtype
state(mode, x:real, y:real, tau:real)
*)
//
datatype
state(mode, x:real, y:real, tau:real) =
| STATE1(M1,x,y,tau) of (real(x), real(y), real(tau))
//
(* ****** ****** *)
//
extern
fun
state_get_x
  {m:mode}
  {x,y,tau:real}(!state(m, x, y, tau)): real(x)
extern
fun
state_get_y
  {m:mode}
  {x,y,tau:real}(!state(m, x, y, tau)): real(y)
extern
fun
state_get_tau
  {m:mode}
  {x,y,tau:real}(!state(m, x, y, tau)): real(tau)
//
overload .x with state_get_x
overload .y with state_get_y
overload .tau with state_get_tau
//
(* ****** ****** *)

implement
state_get_x(state) =
  let val+STATE1(x, y, tau) = state in x end
implement
state_get_y(state) =
  let val+STATE1(x, y, tau) = state in y end
implement
state_get_tau(state) =
  let val+STATE1(x, y, tau) = state in tau end

(* ****** ****** *)
//
val ax = $UN.cast(1.0): real(ax)
val ay = $UN.cast(1.2): real(ay)
val omega = $UN.cast(3.14): real(omega)
//
(* ****** ****** *)
//
extern
fun
mode1_flow
  : {x,y,tau:real}
    state(M1, x, y, tau) ->
    state(
      M1,
      x-(ax*sin(omega*tau))*dt,
      y-(ay*sin(omega*tau))*omega*dt, tau+dt
    ) (* state *)
//
(* ****** ****** *)
//
extern
fun
mode1_jump
  : {x,y,tau:real}
    state(M1, x, y, tau) -> state(M1, x, y, tau)
//
(* ****** ****** *)
//
extern
fun{}
the_dt_get(): real(dt)
//
implement
{}(*tmp*)
the_dt_get() = $UN.cast(1.0/50)
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

implement
mode1_flow(state) = let
//
val dt = the_dt_get()
val+STATE1(x, y, tau) = state
//
val sin_ = sin(omega * tau)
//
val vx = ~ax * sin_
val vy = ~ay * sin_ * omega
//
in
  STATE1(x+vx*dt, y+vy*dt, tau+dt)
end // end of [mode1_flow]

(* ****** ****** *)


extern
fun theFwork_eval(): void

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
extern
fun ball_get_y(ball): double = "mac#"
extern
fun ball_set_y(ball, double): void = "mac#"
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
extern
fun
theBall_get_y(): double = "mac#"
extern
fun
theBall_set_y(double): void = "mac#"
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
var RAD = 8
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
ball_get_x(ball) { return ball.y ; }
function
ball_set_x(ball, x0) { ball.y = YSCREEN/2.5-100*x0; return ; }
function
ball_get_y(ball) { return ball.x ; }
function
ball_set_y(ball, y0) { ball.x = XSCREEN/3.0-100*y0; return ; }
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
implement
theBall_get_y() = ball_get_y(theBall[])
implement
theBall_set_y(y0) = ball_set_y(theBall[], y0)

in (* in-of-local *)

val () = theBall_initize((*void*))

end // end of [local]

(* ****** ****** *)

fun
loop1{x,y,tau:real}
(
  state: state(M1, x, y, tau)
) : void = let
//
val dt = the_dt_get()
//
val x = state_get_x(state)
val y = state_get_y(state)
val tau = state_get_tau(state)
//
val x_ =
  $UN.cast{double}(x)
val y_ =
  $UN.cast{double}(y)
//
val () = theBall_set_x(x_)
val () = theBall_set_y(y_)
//
val () = theStage_update()
//
in
  delayed_by(dt, llam() => loop1(mode1_flow(state)))
end // end of [loop1]

(* ****** ****** *)

local
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
val
theTicks = Bacon_interval{int}(50, 0)
//
in
//
val () =
loop1(STATE1(int2real(0), int2real(0), int2real(0)))
//
val () = theTicks.onValue(lam(_) =<cloref1> theFwork_eval())
//
end // end of [local]

(* ****** ****** *)

%{$
//
function
oscillator_2d_anim_initize()
{
  var _ = oscillator_2d_anim_dynload()
}
//
%} // end of [%{$]

(* ****** ****** *)

(*
implement
main0() =
{
//
val () = loop1(STATE1(int2real(0), int2real(0), int2real(0)))
//
} (* end of [main0] *)
*)

(* ****** ****** *)

(* end of [oscillator_2d_anim.dats] *)
