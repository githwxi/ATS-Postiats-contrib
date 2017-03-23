(* ****** ****** *)

(*
** Linear state monads
*)

(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

absvtype
stmonad_vtype(a:vt@ype+) = ptr

(* ****** ****** *)

vtypedef
M(a:vt@ype) = stmonad_vtype(a)

(* ****** ****** *)
//
extern
fun
{a:vt@ype}
stmonad_return(x: a): M(a)
//
(* ****** ****** *)
//
extern
fun
{a,b:vt@ype}
stmonad_bind
  (fopr: cfun(a, b), mx: M(a)): M(b)
//
(* ****** ****** *)
//
absvtype state_vtype
vtypedef state = state_vtype
//
(* ****** ****** *)
//
extern
fun{}
state_create(): state
extern
fun{}
state_destroy(state): void
//
(* ****** ****** *)
//
extern
fun
{a:vt@ype}
stmonad_runState(M(a), state): @(state, a)
//
(* ****** ****** *)

local
//
assume
stmonad_vtype(a) =
  state -<lincloptr1> (state, a)
//
in (* in-of-local *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
stmonad_return(x) = llam s => (s, x)
//
(* ****** ****** *)
//
implement
{a,b}(*tmp*)
stmonad_bind
  (fopr, mx) =
  llam s =>
  (s, fopr(x)) where
  {
  val (s, x) = mx(s)
  val ((*void*)) =
    cloptr_free($UN.castvwtp0{cloptr(void)}(mx))
  // end of [val]
  } // end of [where] // end of [llam]
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
stmonad_runState
  (mx, s) = sx where
{
  val sx = mx(s)
  val ((*void*)) =
    cloptr_free($UN.castvwtp0{cloptr(void)}(mx))
  // end of [val]
} // end of [where] // end of [llam]
//
(* ****** ****** *)
//
end // end of [local]

(* ****** ****** *)

(* end of [stmonad_state.dats] *)
