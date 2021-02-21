(*
Offsets are used as typed, duplicable references into arrays.

One serious issue with linear arrays in ATS
is that an element cannot be safely taken out.

We try to fix it with "offsets".

It should be certainly possible to track "taken out"
pointers with the array, but that's going to be very
expensive verification-wise.

Note that, if the same offset is taken twice,
the type system will not be able to track its type properly
(in general). For instance, if you have two proofs of a @ l,
then the type checker may get confused.
*)

(* ****** ****** *)
//
abst@ype offset (vt@ype, int, bool) = int
typedef offset0 (a:vt@ype, n:int) = [b:bool] offset (a, n, b)
typedef offset1 (a:vt@ype, n:int) = offset (a, n, true)
//
// temporary
dataview
or_view_view_int_view
  (a0: view+, a1: view+, int) =
  VORleft(a0, a1, 0) of a0 | VORright(a0, a1, 1) of a1
stadef vor = or_view_view_int_view
//
prfun
offset_sizeof_lemma {a:vt@ype} {n:int} {b:bool} ()
  : [sizeof(offset(a, n, b)) == sizeof(int)] void
//
(* ****** ****** *)
//
castfn
offset_make {a:vt@ype} {n:int}
  (i: natLt (n)): offset (a, n, true)
//
praxi
offset_make_ref {a:vt@ype} {n:int}
  (i: !INV(natLt (n)) >> offset (a, n, true)):<prf> void
//
praxi
offset_free_ref {a:vt@ype} {n:int} {b:bool}
  (i: !INV(offset (a, n, b)) >> intBtw (~1, n)):<prf> void
//
fun
offset_make_nil {a:vt@ype} {n:int}
  (): offset (a, n, false)
//
praxi
offset_make_nil_ref {a:vt@ype} {n:int}
  (i: !INV(int (~1)) >> offset (a, n, false)):<prf> void
//
fun
offset_is_some {a:vt@ype} {n:int} {b:bool}
  (x: offset (a, n, b)): bool b
//
castfn
offset_cast {a:vt@ype} {n,m:int | n <= m}
  (offset0 (a, n)): offset0 (a, m)
//
castfn
offset_elim {a:vt@ype} {n:int}
  (x: offset1 (a, n)): natLt(n)
//
fun{a:t@ype}
offset_getopt {n:int} {b:bool}
  (&(@[INV(a)][n]), offset (a, n, b), &a? >> opt (a, b)): bool b
//
fun{a:t@ype}
offset_get {n:int}
  (&(@[INV(a)][n]), offset1 (a, n), &a? >> a): void
//
fun{a:t@ype}
offset_set {n:int}
  (&(@[INV(a)][n]), offset1 (a, n), &a >> _): void
//
fun{a:vt@ype}
offset2ptropt {n:int} {l:addr} {b:bool} (
  !array_v (INV(a), l, n)
| ptr l, offset (a, n, b)
) : [l1:addr] (
  option_v ((a @ l1, (a @ l1, !array_v (a, l, n)) -<lin,prf> void), l1 > null)
| ptr l1
) // end of [offset2ptropt]
//
fun{a:vt@ype}
offset2ptr {n:int} {l:addr}
( !array_v (INV(a), l, n)
| ptr l, offset1 (a, n)
) : [l1:addr] (
  a @ l1
, (a @ l1, !array_v (INV(a), l, n)) -<lin,prf> void
| ptr l1
) // end of [offset2ptr]
//
(* ****** end of [offset.sats] ****** *)
