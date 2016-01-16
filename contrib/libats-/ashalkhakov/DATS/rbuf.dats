(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "./../SATS/rbuf.sats"

(* ****** ****** *)
//
local
//
// NB. the structure of the type closely follows
// the structure given in the interface; we are only
// allowed to refine the tuple elements, but not
// add some new elements, even if we only add proofs
// NB. we don't add a top-level constraint to the top (e.g. [n>=0])
assume rbuf_vt (a:t@ype, n:int, m:int, l:addr) = @(
  (array_v (a, l, n), array_v (a, l + n*sizeof(a), m-n) | ptr (l + n*sizeof(a)))
, size_t (m-n)
) (* end of [buf_vt] *)
//
in (* of [local] *)
//
implement{a}
rbuf_make {n} {l} (pf_bytes | p, n, buf) = () where {
  prval () = lemma_array_v_param {a} (pf_bytes)
  prval () = $effmask_wrt (buf.0.0 := array_v_nil {a} ())
  prval () = $effmask_wrt (buf.0.1 := pf_bytes)
  val () = buf.0.2 := p
  val () = buf.1 := n
} (* end of [rbuf_make] *)
//
implement{a}
rbuf_free {m,n} {l} (buf) = let
  prval pf_arr = array_v_unsplit (buf.0.0, buf.0.1)
in
  (pf_arr | ())
end // end of [rbuf_free]
//
implement{a}
rbuf_check {n,m} {l} (buf) = buf.1 > g1int2uint_int_size(0)
//
implement{a}
rbuf_rem {n,m} {l} (buf) = g1uint2int_size_int (buf.1)
//
implement{a}
rbuf_read {n,m} {l} (buf) = let
  prval pf1_arr = buf.0.0
  prval (pf1_at, pf2_arr) = array_v_uncons {a} {l+n*sizeof(a)} (buf.0.1)
  val c = ptr_get<a> (pf1_at | buf.0.2)
  val () = buf.0.2 := ptr1_succ (buf.0.2)
  val () = buf.1 := pred (buf.1)
  prval pf1_arr = array_v_extend (pf1_arr, pf1_at)
  // why does it complain about wrt effect?
  prval () = $effmask_wrt (buf.0.0 := pf1_arr)
  prval () = $effmask_wrt (buf.0.1 := pf2_arr)
in
  c
end // end of [rbuf_read]
//
end (* of [local] *)
//
(* ****** end of [rbuf.dats] ****** *)
