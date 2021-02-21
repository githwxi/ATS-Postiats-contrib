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

absvt@ype buf_vt (a:t@ype, int, int, addr) = @(ptr, size_t)
vtypedef buf_vt0 (a:t@ype) = buf_vt (a, 0, 0, null)?
vtypedef buf_vt1 (a:t@ype, n:int, l:addr) = [i:int | i <= n] buf_vt (a, i, n, l)

extern
fun
buf_make {a:t@ype} {n:int} {l:addr} (
  array_v (INV(a), l, n)
| ptr l
, size_t n
, &buf_vt0 (a) >> buf_vt (a, 0, n, l)
): void

extern
fun
buf_free {a:t@ype} {n,m:int} {l:addr} (
  // NB. the type given to buf after returning
  // is the same as what it was prior to [buf_make]
  &buf_vt (a, n, m, l) >> buf_vt0 (a)
): (array_v (a, l, m) | void)

extern
fun{a:t@ype}
buf_check {n,m:int} {l:addr} (
  &buf_vt (a, n, m, l) >> _
): bool (n < m)

extern
fun{a:t@ype}
buf_rem {n,m:int} {l:addr} (
  &buf_vt (a, n, m, l) >> _
): int (m-n)

extern
fun{a:t@ype}
buf_read {n,m:int | n < m} {l:addr} (
  &buf_vt (a, n, m, l) >> buf_vt (a, n+1, m, l)
): a

(* ****** ****** *)

local

// NB. the structure of the type closely follows
// the structure given in the interface; we are only
// allowed to refine the tuple elements, but not
// add some new elements, even if we only add proofs
// NB. we don't add a top-level constraint to the top (e.g. [n>=0])
assume buf_vt (a:t@ype, n:int, m:int, l:addr) = @(
  (array_v (a, l, n), array_v (a, l + n*sizeof(a), m-n) | ptr (l + n*sizeof(a)))
, size_t (m-n)
) (* end of [buf_vt] *)

in (* of [local] *)

implement
buf_make {a} {n} {l} (pf_bytes | p, n, buf) = () where {
  prval () = lemma_array_v_param {a} (pf_bytes)
  prval () = $effmask_wrt (buf.0.0 := array_v_nil {a} ())
  prval () = $effmask_wrt (buf.0.1 := pf_bytes)
  val () = buf.0.2 := p
  val () = buf.1 := n
}

implement
buf_free {a} {m,n} {l} (buf) = let
  prval pf_arr = array_v_unsplit (buf.0.0, buf.0.1)
in
  (pf_arr | ())
end

implement{a}
buf_check {n,m} {l} (buf) = buf.1 > g1int2uint_int_size(0)

implement{a}
buf_rem {n,m} {l} (buf) = g1uint2int_size_int (buf.1)

implement{a}
buf_read {n,m} {l} (buf) = let
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
getsh {n,m:int | n+2 <= m} {l:addr} (buf: &buf_vt (uint8, n,m,l) >> buf_vt1 (uint8, m,l)): uint = let
  val c0 = b2ui (buf_read (buf))
  val c1 = b2ui (buf_read (buf))
in
  c0 lor (c1 << 8)
end // end of [getsh]

(*
// getws(buf,s): read buf until rem > 0 or until you find a zero byte
// - if zero byte is found: return a string
// - otherwise: fail hard
*)

staload SBF = "libats/SATS/stringbuf.sats"
stadef stringbuf = $SBF.strinbuf

extern
fun
getws {n:int} {l:addr} (
  buf: &buf_vt1 (uint8, n, l)
, sbf: &stringbuf
) : strptr0

implement
getws {n} {l} (buf, sbf) = let
  fun loop (buf: &buf_vt1 (uint8, n, l), sbf: &stringbuf) =
    if buf_check (buf) then let
      val c = buf_read (buf)
    in
      if c = 0 then let
        
      // terminate the string
      // copy the string out of the strbuf
      in
      end else let
      // append c to the string
      in
      end;
      // continue
      loop (buf, s)
    end else let
      // failure, return 0
    in
      strptr_null ()
    end
  // allocate strbuf on stack
  val res = loop (buf, s)
in
  res
end

(* ****** ****** *)

implement
main (argc, argv) = let
  var A = @[uint8]($UN.cast {uint8} (3), $UN.cast {uint8} (2), $UN.cast {uint8} (4), $UN.cast {uint8} (5), $UN.cast {uint8} (1))
  var buf: buf_vt0 (uint8)
  val () = buf_make (view@(A) | addr@(A), g1int2uint_int_size (5), buf)
  
  val c0 = buf_read<uint8> (buf)
  val c1 = buf_read<uint8> (buf)
  val c2 = buf_read<uint8> (buf)
  val c3 = buf_read<uint8> (buf)
  val c4 = buf_read<uint8> (buf)
//  val c5 = buf_read<uint8> (buf) // ill-typed
  
  val () = println!("Elements: ", c0, " ", c1, " ", c2, " ", c3, " ", c4)
  
  val (pf_arr | ()) = buf_free (buf)
  prval () = view@(A) := pf_arr
in
  1
end

