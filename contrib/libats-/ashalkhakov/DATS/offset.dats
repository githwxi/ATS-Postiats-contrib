#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./../SATS/offset.sats"

(* ****** ****** *)

local
//
dataprop offset_p (int, int, bool) =
  | {n:int} offset_p_none (~1, n, false)
  | {i,n:int | i >= 0; i < n} offset_p_some (i, n, true)
//
prfun
offset_p_sub {i:int} {n,m:int | n <= m} {b:bool} .< >.
(pf: offset_p (i, n, b)):<> offset_p (i, m, b) =
  case+ pf of
  | offset_p_none () => offset_p_none ()
  | offset_p_some () => offset_p_some ()
// end of [offset_p_sub]
//
assume offset (a:vt@ype+, n:int, b:bool) =
  [i:int] (offset_p (i, n, b) | int i)
//
in // in of [local]
//
primplement
offset_sizeof_lemma {a} {n} {b} () = ()
//
implement
offset_make {a} {n} (i) = (offset_p_some () | i)
//
implement
offset_cast {a} {n,m} (o) = (offset_p_sub o.0 | o.1)
//
implement
offset_elim {a} {n} (o) = o.1 where {
  prval offset_p_some () = o.0
} (* end of [offset_elim] *)
//
implement
offset_make_nil {a} {n} () = (offset_p_none () | ~1)
//
implement
offset_is_some {a} {n} {b}
  (o) = (
  if o.1 = ~1 then let
    prval offset_p_none () = o.0
  in false end else let
    prval offset_p_some () = o.0
  in true end
) (* end of [offset_is_some] *)
//
implement{a}
offset_getopt {n} {b}
  (arr, o, res) =
  if offset_is_some (o) then let
    val (pf_at, fpf | po) = offset2ptr<a> (view@arr | addr@arr, o)
    val () = res := !po
    prval () = opt_some {a} (res)
    prval () = fpf (pf_at, view@arr)
  in
    true
  end else let
    prval () = opt_none {a} (res)
  in
    false
  end
// end of [offset_getopt]
//
implement{a}
offset_get {n}
  (arr, o, res) = let
  val (pf_at, fpf | po) = offset2ptr<a> (view@arr | addr@arr, o)
  val () = res := !po
  prval () = fpf (pf_at, view@arr)
in
  // empty
end // end of [offset_get]
//
implement{a}
offset_set {n}
  (arr, o, x) = let
  val (pf_at, fpf | po) = offset2ptr<a> (view@arr | addr@arr, o)
  val () = !po := x
  prval () = fpf (pf_at, view@arr)
in
  // empty
end // end of [offset_set]
//
implement{a}
offset2ptropt {n} {l} {b} (
  pf_arr
| p, o
) = (
  if o.1 > ~1 then let
    prval offset_p_some () = o.0
    val (pf_at, fpf | po) = offset2ptr<a> (pf_arr | p, o)
    prval () = __trustme (pf_at) where {
      extern
      prfun
      __trustme {l:addr} (!a @ l): [l > null] void
    } // end of [prval]
  in
    (Some_v @(pf_at, fpf) | po)
  end else let
    prval offset_p_none () = o.0
  in
    (None_v () | the_null_ptr)
  end
) (* end of [offset2ptropt] *)
//
implement{a}
offset2ptr {n} {l}
  (pf_arr | p_arr, o) = (pf, fpf | po) where {
  prval offset_p_some () = o.0
  val po = ptr_add<a> (p_arr, o.1)
  prval (pf, fpf) = __trustme (pf_arr, po) where {
    extern
    prfun
    __trustme {l1:addr}
      (!array_v (a, l, n), ptr l1)
      : (a @ l1, (a @ l1, !array_v (a, l, n)) -<lin,prf> void)
  } // end of [prval]
} // end of [offset2ptr]
//
end // end of [local]
//
(* ****** end of [offset.dats] ****** *)
