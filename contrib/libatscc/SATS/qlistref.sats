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
qlistref_type(a:vt@ype)
//
typedef
qlistref(a:vt@ype) = qlistref_type(a)
//
(* ****** ****** *)

fun
qlistref_make_nil{a:vt0p}(): qlistref(a)

(* ****** ****** *)
//
fun
qlistref_enque{a:vt0p}(qlistref(a), x0: a): void
//
(* ****** ****** *)
//
fun
qlistref_deque_exn{a:vt0p}(qlistref(a)): (a)
fun
qlistref_deque_opt{a:vt0p}(qlistref(a)): Option_vt(a)
//
(* ****** ****** *)
//
fun
qlistref_length{a:vt0p}(qlistref(a)): intGte(0)
//
(* ****** ****** *)
//
fun
qlistref_foldleft
  {res:vt0p}{a:t0p}
  (qlistref(a), init: res, fopr: (res, a) -<cloref1> res): res
fun
qlistref_foldright
  {a:t0p}{res:vt0p}
  (qlistref(a), fopr: (a, res) -<cloref1> res, sink: res): res
//
(* ****** ****** *)

(* end of [qlistref.sats] *)
