(* ****** ****** *)
//
// HX-2014-01-25:
// infseq-indexed arrays
//
(* ****** ****** *)

staload "contrib/libats-/wdblair/prelude/SATS/array.sats"
staload "contrib/libats-/wdblair/prelude/SATS/integer.sats"

(* ****** ****** *)

staload "contrib/libats-/wdblair/patsolve/SATS/stampseq.sats"

(* ****** ****** *)

(**
implement {}
ptr_offset (p, pi, sz) = let
  val d = pi - p
in
   g1int2uint_ssize_size(d) / sz
end
*)

(* ****** ****** *)

implement {a} ptr_get0 (pf | p) = !p

extern
fun array_ptrswap_size {a:t@ype} {l:addr}
  {n:int} {i,j:nat | i < n; j < n} {xs:stmsq} (
  pf: !array_v(a, l, xs, n) >> array_v (a, l, swap_at(xs, i, j), n) |
    p1: ptr(l+i*sizeof(a)), p2: ptr(l+j*sizeof(a)), sz: size_t (sizeof(a))
): void = "mac#"

(**
  Here is a precise type for memcpy. I wonder if this could be used to
  swap regions of arrays.
  
  Unfortunately, this may be too complicated for the effort.
*)
extern
fun memcpy {l,p:addr} {num,n,m:nat | num <= n; num <= m} {xs,ys:stmsq} (
  pfd: !array_v (byte, l, xs, n) >>
    array_v (byte, l, append(take(ys, num), num, drop(xs, num), n-num), n),
  pfs: !array_v (byte, p, ys, m) | pd: ptr l, ps: ptr p, num: size_t num
): ptr l = "mac#"

(**

  Z3 can't figure this one out :D
fun
copy {l,p:addr} {n:nat} {xs,ys:stmsq} (
  pfd: !array_v (byte, l, xs, n) >> array_v (byte, l, ys, n),
  pfs: !array_v (byte, p, ys, n)
    | pd: ptr l, ps: ptr p, n: size_t n
): void = {
  val _ = memcpy (pfd, pfs | pd, ps, n)
}
*)

implement {}
array_ptrswap {a}{l}{n}{i,j}{xs} (pf | p, q, sz) =
  array_ptrswap_size {a}{l}{n}{i,j}{xs} (pf | p, q, sz)

local

prfun
lemma
  {l:addr}{a:t@ype}{xs:stmsq}
  {n:int}{i:nat | i <= n} .<i>.
(
  pf: array_v(a, l, xs, n), i: size_t (i)
) : (
  array_v (a, l, take(xs, i), i)
, array_v (a, l+sizeof(a)*i, drop(xs, i), n-i)
) = let
in
//
if i = 0
then
  (array_v_nil (), pf)
else let
  prval array_v_cons (pf1, pf2) = pf
  prval (pf21, pf22) = array_v_split (pf2, i-1)
in
  (array_v_cons (pf1, pf21), pf22)
end // end of [else]
//
end // end of [lemma]

in (* in-of-local *)

primplement
array_v_split (pf, i) = lemma (pf, i)

end // end of [local]

(* ****** ****** *)

local

prfun
lemma
  {a:t@ype}{l:addr}{xs,ys:stmsq}
  {m,n:nat} .<m>.
(
  xs: array_v(a, l, xs, m),
  ys: array_v(a, l+sizeof(a)*m, ys, n)
) : (
  array_v (a, l, append(xs, m, ys, n), m+n)
) = 
  case+ xs of
    | array_v_nil () => ys
    | array_v_cons (x, xss) => let
      val tail = array_v_unsplit (xss, ys)
    in
      array_v_cons (x, tail)
    end
// end of [lemma]

in (* in-of-local *)

primplement
array_v_unsplit (xs, ys) = lemma (xs, ys)

end // end of [local]

(* ****** ****** *)

implement {a}
array_get_at
  (pf | p, i) = x where
{
//
prval (pf1, pf2) = array_v_split (pf, i)
prval array_v_cons (pf21, pf22) = pf2
//
val pi = ptr_add<a> (p, i)
val x = ptr_get0<a> (pf21 | pi)
//
prval ((*void*)) =
  pf := array_v_unsplit (pf1, array_v_cons (pf21, pf22))
//
} (* end of [array_get_at] *)

(**

Z3 cannot solve this one.

implement {a}
array_set_at
  (pf | p, i, x) = {
//
prval (pf1, pf2) = array_v_split (pf, i)
prval array_v_cons (pf21, pf22) = pf2
//
val pi = ptr_add<a> (p, i)
val () = ptr_set0<a> (pf21 | pi, x)
//
prval ((*void*)) = pf := array_v_unsplit (pf1, array_v_cons (pf21, pf22))
//
} (* end of [array_set_at] *)
*)

(* ****** ****** *)

(* end of [array.dats] *)
