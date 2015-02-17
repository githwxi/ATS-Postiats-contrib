(*
** Hello, world!
*)

(* ****** ****** *)

#include
"share/atspre_define.hats"  
#include
"share/atspre_staload.hats"

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

absvt@ype buf_vt (int, int, addr) = @(ptr, ptr)
vtypedef buf_vt0 = buf_vt (0, 0, null)?

extern
fun
buf_make {n:int} {l:addr} (
  array_v (INV(uint8), l, n)
| ptr l
, size_t n
, &buf_vt0 >> buf_vt (0, n, l)
): void

extern
fun
buf_free {n,m:int} {l:addr} (
  // NB. the type given to buf after returning
  // is the same as what it was prior to [buf_make]
  &buf_vt (n, m, l) >> buf_vt0
): (array_v (uint8, l, m+n) | void)

extern
fun
buf_check {n,m:int} {l:addr} (
  &buf_vt (n, m, l) >> _
): bool (m > 0)

extern
fun
buf_read {n,m:int | m > 0} {l:addr} (
  &buf_vt (n, m, l) >> buf_vt (n+1, m-1, l)
): uint8

(* ****** ****** *)

local

// NB. the structure of the type closely follows
// the structure given in the interface; we are only
// allowed to refine the tuple elements, but not
// add some new elements, even if we only add proofs
// NB. we don't add a top-level constraint to the top (e.g. [n>=0])
assume buf_vt (n:int, m:int, l:addr) = @(
  (array_v (uint8, l, n), array_v (uint8, l + n*sizeof(uint8), m) | ptr (l + n*sizeof(uint8)))
, size_t m
) (* end of [buf_vt] *)

in (* of [local] *)

implement
buf_make {n} {l} (pf_bytes | p, n, buf) = () where {
  prval () = lemma_array_v_param {uint8} (pf_bytes)
  prval () = $effmask_wrt (buf.0.0 := array_v_nil {uint8} ())
  prval () = $effmask_wrt (buf.0.1 := pf_bytes)
  val () = buf.0.2 := p
  val () = buf.1 := n
}

implement
buf_free {m,n} {l} (buf) = let
  prval pf_arr = array_v_unsplit (buf.0.0, buf.0.1)
in
  (pf_arr | ())
end

implement
buf_check {n,m} {l} (buf) = buf.1 > g1int2uint_int_size(0)

implement
buf_read {n,m} {l} (buf) = let
  prval pf1_arr = buf.0.0
  prval (pf1_at, pf2_arr) = array_v_uncons {uint8} {l+n*sizeof(uint8)} (buf.0.1)
  val c = ptr_get<uint8> (pf1_at | buf.0.2)
  val () = buf.0.2 := ptr1_succ (buf.0.2)
  val () = buf.1 := pred (buf.1)
  prval pf1_arr = array_v_extend (pf1_arr, pf1_at)
  // why does it complain about wrt effect?
  prval () = $effmask_wrt (buf.0.0 := pf1_arr)
  prval () = $effmask_wrt (buf.0.1 := pf2_arr)
in
  c
end

end (* of [local] *)

(* ****** ****** *)

extern
fun
g0uint_uint8_to_uint (uint8): uint = "ext#"

%{^

ATSinline()
atstype_uint
g0uint_uint8_to_uint (atstype_uint8 x) {
  return ((atstype_uint)(x));
}

%}
#define b2ui g0uint_uint8_to_uint

fun
getsh {n,m:int | m > 2} {l:addr} (buf: &buf_vt (n,m,l) >> buf_vt (n+2, m-2, l)): uint = let
  val c0 = b2ui (buf_read (buf))
  val c1 = b2ui (buf_read (buf))
in
  c0 lor (c1 << 8)
end // end of [getsh]

(*
fun
getws {m,m,i:int | i >= 0; m > i} (
  buf: &buf_vt (n, m, l) >> buf_vt (n+i+1, m-i+1, l)
, i: &int >> int i
) : #[i:int] strnptr (i) = let
in
end
*)

(* ****** ****** *)

implement
main (argc, argv) = let
  var A = @[uint8]($UN.cast {uint8} (3), $UN.cast {uint8} (2), $UN.cast {uint8} (4), $UN.cast {uint8} (5), $UN.cast {uint8} (1))
  var buf: buf_vt0
  val () = buf_make (view@(A) | addr@(A), g1int2uint_int_size (5), buf)
  
  val c0 = buf_read (buf)
  val c1 = buf_read (buf)
  val c2 = buf_read (buf)
  val c3 = buf_read (buf)
  val c4 = buf_read (buf)
//  val c5 = buf_read (buf) // ill-typed
  
  val () = println!("Elements: ", c0, " ", c1, " ", c2, " ", c3, " ", c4)
  
  val (pf_arr | ()) = buf_free (buf)
  prval () = view@(A) := pf_arr
in
  1
end

