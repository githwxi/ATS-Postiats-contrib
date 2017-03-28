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
{a:vt@ype}
{b:vt@ype}
stmonad_bind
(
mx: M(a), fopr: (a) -<lincloptr1> M(b)
) : M(b) // end of [stmonad_bind]
//
(* ****** ****** *)

extern
fun
{a:t0ype}
{b:vt0ype}
stmonad_list_map
{n:int}
(
xs: list(a, n), fopr: a -<cloref1> M(b)
) : M(list_vt(b, n)) // end-of-function

(* ****** ****** *)

implement
{a}{b}(*tmp*)
stmonad_list_map
  (xs, fopr) = let
//
fun
aux{n:nat}
(
xs: list(a, n)
) : M(list_vt(b, n)) =
(
case+ xs of
| list_nil
  (
    (*void*)
  ) =>
  stmonad_return<list_vt(b,0)>(list_vt_nil())
| list_cons
    (x, xs) => let
    val my = fopr(x)
  in
    stmonad_bind<b><list_vt(b,n)>
    ( my
    , llam y => let
        val mys = aux(xs)
      in
        stmonad_bind<list_vt(b,n-1)><list_vt(b,n)>
        ( mys
        , llam (ys) => stmonad_return<list_vt(b,n)>(list_vt_cons(y, ys))
        )
      end
    )
  end // end of [list_cons]
)
//
in
//
  let prval () = lemma_list_param(xs) in aux(xs) end
//
end (* end of [stmonad_list_map] *)

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
{a}{b}(*tmp*)
stmonad_bind
  (mx, fopr) =
  llam s => sy where
  {
  val (s, x) = mx(s)
  val ((*void*)) =
    cloptr_free($UN.castvwtp0{cloptr(void)}(mx))
  // end of [val]
  val sy = fopr(x)(s)
  val ((*void*)) =
    cloptr_free($UN.castvwtp0{cloptr(void)}(fopr))
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
