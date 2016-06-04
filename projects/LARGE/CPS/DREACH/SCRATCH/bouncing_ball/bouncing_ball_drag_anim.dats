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
#define
ATS_STATIC_PREFIX "bouncing_ball_anim_"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "bouncing_ball_anim_dynload"

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

stacst g : real
stacst D : real
stacst K : real
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

implement
state_get_x
  (state) =
(
  case+ state of STATE1(x, _) => x | STATE2(x, _) => x
)
implement
state_get_v
  (state) =
(
  case+ state of STATE1(_, v) => v | STATE2(_, v) => v
)

(* ****** ****** *)
//
extern
fun
mode1_flow
  : {x,v:real | x > 0}
    state(M1, x, v) ->
    state(M1, x+v*dt, v-(g-D*v*v)*dt)
//
(* ****** ****** *)
//
extern
fun
mode1_jump
  : {x,v:real | x <= 0}
    state(M1, x, v) -> state(M2, i2r(0), ~K*v)
//
(* ****** ****** *)
//
extern
fun
mode2_flow
  : {x,v:real | v > 0}
    state(M2, x, v) ->
    state(M2, x+v*dt, v-(g+D*v*v)*dt)
//
(* ****** ****** *)
//
extern
fun
mode2_jump
  : {x,v:real | v <= 0}
    (state(M2, x, v)) -> state(M1, x, i2r(0))
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
//
val g = $UN.cast(9.8): real(g)
//
val D = $UN.cast(0.10): real(D)
val K = $UN.cast(0.90): real(K)
//
(* ****** ****** *)

implement
mode1_flow(state) = let
//
val dt = the_dt_get()
val+STATE1(x, v) = state
//
in
  STATE1(x+v*dt, v-(g-D*v*v)*dt)
end // end of [mode1_flow]

(* ****** ****** *)

implement
mode1_jump(state) = let
//
val+STATE1(x, v) = state
//
in
  STATE2(int2real(0), ~(K*v))
end // end of [mode1_jump]

(* ****** ****** *)

implement
mode2_flow(state) = let
//
val dt = the_dt_get()
val+STATE2(x, v) = state
//
in
  STATE2(x+v*dt, v-(g+D*v*v)*dt)
end // end of [mode2_flow]

(* ****** ****** *)

implement
mode2_jump(state) = let
//
val+STATE2(x, v) = state
//
in
  STATE1(x, int2real(0))
end // end of [mode2_jump]

(* ****** ****** *)

extern
fun theFwork_eval(): void

(* ****** ****** *)

local

staload
"libc/SATS/unistd.sats"

val theFwork = ref{int}(0)

in (* in-of-local *)

implement
delayed_by
  (dt, fwork) = let
//
val dt =
  $UN.cast{double}(dt)
//
val dt =
  g1ofg0_int(double2int(dt*1000000))
//
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

fun
loop1{x,v:real}
  (state: state(M1, x, v)): void = let
//
  val dt = the_dt_get()
//
  val x = state_get_x(state)
  val v = state_get_v(state)
(*
  val () = println! ("state1: x = ", x)
  val () = println! ("state1: v = ", v)
*)
//
  val x_ =
    $UN.cast{double}(x)
  // end of [val]
  val () = theBall_set_x(x_)
  val () = theStage_update()
//
in
  if x > 0
    then
    delayed_by
      (dt, llam() => loop1(mode1_flow(state)))
    // delayed_by
    else loop2(mode1_jump(state))
  // end of [if]
end // end of [loop1]

and
loop2{x,v:real}
  (state: state(M2, x, v)): void = let
//
  val dt = the_dt_get()
//
  val x = state_get_x(state)
  val v = state_get_v(state)
(*
  val () = println! ("state2: x = ", x)
  val () = println! ("state2: v = ", v)
*)
//
  val x_ =
    $UN.cast{double}(x)
  // end of [val]
  val () = theBall_set_x(x_)
  val () = theStage_update()
//
in
  if v > 0
    then
    delayed_by
      (dt, llam() => loop2(mode2_flow(state)))
    // delayed_by
    else loop1(mode2_jump(state))
  // end of [if]
end // end of [loop2]

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
val () = loop1(STATE1(int2real(20), int2real(0)))
//
val () = theTicks.onValue(lam(_) =<cloref1> theFwork_eval())
//
end // end of [local]

(* ****** ****** *)

%{$
//
function
bouncing_ball_anim_initize()
{
  var _ = bouncing_ball_anim_dynload()
}
//
%} // end of [%{$]

(* ****** ****** *)

(*
implement
main0() =
{
//
val x0 = int2real(10)
val v0 = int2real(00)
val () = loop1(STATE1(x0, v0))
//
} (* end of [main0] *)
*)

(* ****** ****** *)

(* end of [bouncing_ball_drag_anim.dats] *)
