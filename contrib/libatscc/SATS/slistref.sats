(*
** libatscc-common
*)

(* ****** ****** *)

(*
staload "./../basics.sats"
*)

(* ****** ****** *)
//
abstype
slistref_type(a:vt@ype)
//
typedef
slistref(a:vt@ype) = slistref_type(a)
//
(* ****** ****** *)

fun
slistref_make_nil{a:vt0p}(): slistref(a)

(* ****** ****** *)
//
fun
slistref_push{a:vt0p}(slistref(a), x0: a): void
//
(* ****** ****** *)
//
fun
slistref_pop_exn{a:vt0p}(slistref(a)): (a)
fun
slistref_pop_opt{a:vt0p}(slistref(a)): Option_vt(a)
//
(* ****** ****** *)
//
fun
slistref_length{a:vt0p}(slistref(a)): intGte(0)
//
(* ****** ****** *)
//
fun
slistref_foldleft
  {res:vt0p}{a:t0p}
  (slistref(a), init: res, fopr: (res, a) -<cloref1> res): res
fun
slistref_foldright
  {a:t0p}{res:vt0p}
  (slistref(a), fopr: (a, res) -<cloref1> res, sink: res): res
//
(* ****** ****** *)

(* end of [slistref.sats] *)
