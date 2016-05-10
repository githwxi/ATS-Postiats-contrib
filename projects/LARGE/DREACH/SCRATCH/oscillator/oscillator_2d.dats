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

absvtype
state(mode, x:real, y:real, tau:real)

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

fun
loop1{x,y,tau:real}
(
  state: state(M1, x, y, tau)
) : void = let
//
val x = state_get_x(state)
val y = state_get_y(state)
val tau = state_get_tau(state)
//
in
  loop1(mode1_flow(state))
end // end of [loop1]


(* ****** ****** *)

(* end of [oscillator_2d.dats] *)
