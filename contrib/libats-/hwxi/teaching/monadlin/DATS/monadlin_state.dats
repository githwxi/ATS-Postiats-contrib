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
monadlin_vtype(a:vt@ype+) = ptr

(* ****** ****** *)

vtypedef
M(a:vt@ype) = monadlin_vtype(a)

(* ****** ****** *)
//
extern
fun
{a:vt@ype}
monadlin_return(x: a): M(a)
//
(* ****** ****** *)
//
extern
fun
{a,b:vt@ype}
monadlin_bind
  (fopr: cfun(a, b), mx: M(a)): M(b)
//
(* ****** ****** *)

absvtype state_vtype
vtypedef state = state_vtype

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
assume
monadlin_vtype(a) =
  state -<lincloptr1> (state, a)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
monadlin_return(x) = llam s => (s, x)
//
(* ****** ****** *)
//
implement
{a,b}(*tmp*)
monadlin_bind
  (fopr, mx) =
  llam s =>
  (s, fopr(y)) where
  {
    val (s, y) = mx(s)
    val ((*void*)) =
      cloptr_free($UN.castvwtp0{cloptr(void)}(mx))
    // end of [val]
  } // end of [where] // end of [llam]
//
(* ****** ****** *)

(* end of [monadlin_state.dats] *)
