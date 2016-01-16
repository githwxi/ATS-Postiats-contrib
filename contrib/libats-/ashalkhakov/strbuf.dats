#include
"share/atspre_define.hats"  
#include
"share/atspre_staload.hats"

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

// NOTE: one issue with these lemmas is that
// strbuf is assumed to always hold the null-terminated string
//
// it is a win when you work with strings, but it isn't when
// you only want to build up a string (in this case, to not break
// the invariant you have to put null-terminator every time
// you append a character)
//
// however, when a strbuf is being built, we really do not want
// to make it consumable as a string

absvt@ype sstrbuf_vt (int, int, addr) = (ptr, ptr, size_t)
vtypedef sstrbuf_vt0 = sstrbuf_vt (0, 0, null)?
vtypedef sstrbuf_vt1 (m:int, l:addr) = [n:int | n <= m] sstrbuf_vt (m, n, l)

extern
fun
sstrbuf_make {n:pos} {l:addr} (b0ytes_v (l, n) | ptr l, size_t n, &sstrbuf_vt0 >> sstrbuf_vt (n-1, 0, l)): void

extern
fun
sstrbuf_check {m,n:int} {l:addr} (&sstrbuf_vt (m, n, l)): size_t (m-n)

extern
fun
sstrbuf_cons {m,n:int | n < m} {l:addr} (&sstrbuf_vt (m, n, l) >> sstrbuf_vt (m, n+1, l), charNZ): void

extern
fun
sstrbuf_free_strnptr {m,n:int} {l:addr} (
  &sstrbuf_vt (m, n, l) >> sstrbuf_vt0
) : [l1:agz] (b0ytes_v (l, m+1) | strnptr (l1, n))

(* ***** ****** *)

extern
prfun lemma_sizeof_byte_char (): [sizeof(byte) == sizeof(char)] void

dataprop LTE (int, int) = {m,n:int | n <= m} LTE (m, n)

assume sstrbuf_vt (m:int, n:int, l:addr) = @(
  (array_v (charNZ, l, n), array_v (byte?, l + n*sizeof(byte), m-n+1) | ptr l)
, size_t m
, (LTE (m, n) | size_t n)
) (* end of [sstrbuf_vt] *)

implement
sstrbuf_make {n} {l} (pf_bytes | p, n, sbf) = let
  prval () = lemma_array_v_param {byte?} (pf_bytes)
  prval () = $effmask_wrt (sbf.0.0 := array_v_nil {charNZ} ())
  prval () = $effmask_wrt (sbf.0.1 := pf_bytes)
  val () = sbf.0.2 := p
  val () = sbf.1 := pred (n)
  val () = sbf.2 := (LTE () | g1int2uint_int_size(0))
in
  // nothing
end

implement
sstrbuf_check {m,n} {l} (sbf) = let
  prval LTE () = sbf.2.0
in
  sbf.1 - sbf.2.1
end

implement
sstrbuf_cons {m,n} {l} (sbf, c) = let
  extern
  prfun lemma_char_size () : [sizeof(char)==sizeof(byte)] void
  prval () = lemma_char_size ()
  prval (pf2_at, pf2_arr) = array_v_uncons {byte?} {l+n*sizeof(byte)} (sbf.0.1)
  val p1 = ptr_add<char> (sbf.0.2, sbf.2.1)
  prval pf2_at = $UN.castview0 {charNZ? @ l+n*sizeof(char)} (pf2_at)
  val () = ptr_set<charNZ> (pf2_at | p1, c)
  prval LTE () = sbf.2.0
  val () = sbf.2 := (LTE () | succ (sbf.2.1))
  prval pf1_arr = array_v_extend (sbf.0.0, pf2_at)
  prval () = $effmask_wrt (sbf.0.0 := pf1_arr)
  prval () = $effmask_wrt (sbf.0.1 := pf2_arr)
in
  // nothing
end

// now, if you want to get a string, put 0 at p+n
// and that's all!
// there is always enough space

////
(*
implement
sstrbuf_free_strnptr {m,n} {l} (sbf) = let
in
end

  &sstrbuf_vt (m, n, l) >> sstrbuf_vt0
) : [l1:agz] (b0ytes_v (l, m+1) | strnptr (n, l1))

implement
sstrbuf_
*)

////


extern
prfun
lemma_strbuf_v_param_nat
  {l:addr}{m,n:int} (pf: !strbuf_v (l, m, n)): [m>=0;n>=0] void

extern
praxi strbuf_v_nil
  {n:int} {l:addr} // [n] must be a nat
  (pf1: char(0) @ l, pf2: b0ytes_v (l + 1*sizeof(char), n))
  : strbuf_v (l, n+1, 0)
// end of [strbuf_v]

extern
praxi strbuf_v_unnil
  {m:pos} {l:addr}
  (pf1: strbuf_v (l, n, 0))
  : (char(0) @ l, b0ytes_v (l + 1*sizeof(char), n-1))

extern
praxi strbuf_v_cons
  {m,n:int} {l:addr} // [m] and [n] must be nats
  (pf1: charNZ @ l, pf2: strbuf_v (l + 1*sizeof(char), m, n))
  :<prf> strbuf_v (l, m+1, n+1)
// end of [strbuf_v_cons]

dataview
strbufopt_v (int, int, addr, int) =
  | {m:nat} {l:addr}
    strbufopt_v_none (m, ~1, l, 0) of b0ytes m @ l
  | {m,n:nat} {l:addr} {c:int8 | c > 0}
    strbufopt_v_some (m, n, l, c) of strbuf_v (l, m, n)
// end of [strbufopt_v]

extern
praxi strbuf_v_uncons
  {m,n:int} {l:addr} (pf: strbuf_v (l, m, n))
  :<prf> [c:int8] @(
   char c @ l, strbufopt_v (m-1, n-1, l + sizeof(char), c)
) // end of [strbuf_v_uncons]

extern
prfun strbuf_v_split
  {m,n:int}
  {i:nat | i <= n}
  {l:addr} (
  f_str: strbuf_v (l, m, n)
) : (array_v (charNZ, l, i), strbuf_v (l+i*sizeof(char), m-i, n-i))
// end of [strbuf_v_split]

extern
prfun strbuf_v_unsplit
  {n1:nat}
  {m2,n2:nat}
  {l:addr} (
  pf_buf: array_v (charNZ, l, n1)
, pf_str: strbuf_v (l+n1*sizeof(char), m2, n2)
) : strbuf_v (n1+m2, n1+n2, l)
// end of [strbuf_v_unsplit]

(* ****** ****** *)

extern
fun
strbuf_null
  {n:pos} {l:addr}
  (pf: b0ytes_v (l, n) | ptr l)
  : (strbuf_v (l, n, 0) | void)

extern
fun
strbuf_cons
  {m,n:int | n < m} // [m] and [n] must be nats
  (&strbuf (m, n) >> strbuf (m, n+1), &size_t n >> size_t (n+1), charNZ): void
// end of [strbuf_cons]

(*
extern
castfn
strbuf_strnptr_takeout
  {m,n:int} {l:addr} (
  strbuf_v (l, m, n)
| ptr l
) : (
  strnptr (l, n) -<lin,prf> strbuf_v (l, m, n)
| strnptr (l, n)
)
*)

extern
fun
strbuf_to_strnptr {m,n:int} (
  &strbuf (m, n) >> _
) : strnptr (n)

extern
fun
strbuf_to_string {m,n:int} {l:addr} (
  &strbuf (m, n) >> _
) : string (n)

(* ****** ****** *)

extern
prfun lemma_sizeof_byte_char (): [sizeof(byte) == sizeof(char)] void


implement
strbuf_null
  {n} {l}
  (pf_bytes | p) = let
  prval (pf_at, pf1_bytes) = array_v_uncons {byte?} (pf_bytes)
  prval pf_at = __cast (pf_at) where {
    extern
    prfun __cast {l:addr} (x: byte? @ l): char(0)? @ l
  }
  prval () = lemma_sizeof_byte_char ()
  val () = ptr_set<char(0)> (pf_at | p, $UN.castvwtp0{char(0)}(0))
  prval pf_sbf = strbuf_v_nil (pf_at, pf1_bytes)
in
  (pf_sbf | ())
end

implement
strbuf_cons
  {m,n} // [m] and [n] must be nats
  (sbf, n, c) = let
  val p = addr@(sbf)
  prval (pf_chars, pf_sbf1) = strbuf_v_split (view@(sbf))
  prval (pf_at, pf_bytes) = strbuf_v_unnil (pf_sbf1)
  prval (pf_at, pf_sbf1opt) = strbuf_v_uncons (pf_sbf1)
  val pn = ptr_add (p, n)
  val pc = ptr_get (pf_at | pn)
in
  if iszero (pc) then let
    prval strbufopt_v_none (pf_bytes) = pf_sbf1opt
    val () = ptr_set (pf_at | ptr_add (p, n), c)
    val () = n := succ n
  in
  end else let
    prval strbufopt_v_some (pf_sbf1) = pf_sbf1opt
  in
  end
  
extern
praxi strbuf_v_cons
  {m,n:int} {l:addr} // [m] and [n] must be nats
  (pf1: charNZ @ l, pf2: strbuf_v (l + 1*sizeof(char), m, n))
  :<prf> strbuf_v (l, m+1, n+1)
  prval pf_
  
  
  // if the next byte is a zero
  prval pf_sbf1 = strbuf_v_cons (pf_at, pf_sbf1opt)
in

  val (
extern
praxi strbuf_v_uncons
  {m,n:int} {l:addr} (pf: strbuf_v (l, m, n))
  :<prf> [c:int8] @(
   char c @ l, strbufopt_v (m-1, n-1, l + sizeof(char), c)
) // end of [strbuf_v_uncons]  
in
end
  trbuf (m, n) >> strbuf (m, n+1), &size_t n >> size_t (n+1), charNZ): void
// end of [strbuf_cons]

implement
strbuf_to_strnptr {m,n} (
  sbf
) = let
  val (fpf | s) = strbuf_strnptr_takeout (view@(sbf) | addr@(sbf))
  val s1 = strnptr_copy (s)
  prval () = view@(sbf) := fpf (s)
in
  s1
end

implement
strbuf_to_string {m,n} (
  sbf
) = let
  prval () = lemma_strbuf_v_param_nat (view@(sbf))
  val s = strbuf_to_strnptr (sbf)
  prval () = lemma_strnptr_param (s)
in
  strnptr2string (s)
end

(* ****** ****** *)
////
staload UN = "prelude/SATS/unsafe.sats"
implement
main (argc, argv) = 0 where {
  var A = @[byte][5]()
  val () = $UN.castvwtp0{byte} (0)
  
}