(*
one serious issue with linear arrays in ATS
is that an element cannot be easily taken out

we require the array to persist as soon as all
references into it are "live"

we try to fix it with "offsets"

it should be certainly possible to track "taken out"
pointers with the array, but that's going to be very
expensive verification-wise

FIXME does an array like @[List_vt1(int)][n]
work with the below? that's one more indirection
actually

FIXME: what if the same offset is taken twice?
the type system will not be able to track its type properly...

a @ l, a @ l -> this is actually the same thing!
and when one is mutated, so is the other

*)

(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

// given array @[A][n], we'd like to
// have some pointers into it

// better name? aref, for reference inside an array
// basically, its OK to have indices to array
// as soon as they are all deallocated prior to array deallocation

// it's good to be able to use indices instead
//
abst@ype offset (vt@ype, int, bool) = int
typedef offset0 (a:vt@ype, n:int) = [b:bool] offset (a, n, b)
typedef offset1 (a:vt@ype, n:int) = offset (a, n, true)

//
extern
castfn
offset_make {a:vt@ype} {n:int}
  (i: natLt (n)): offset (a, n, true)
//
extern
fun
offset_make_nil {a:vt@ype} {n:int}
  (): offset (a, n, false)
//
extern
fun
offset_is_some {a:vt@ype} {n:int} {b:bool}
  (x: offset (a, n, b)): bool b
//
extern
castfn
offset_cast {a:vt@ype} {n,m:int | n <= m}
  (offset0 (a, n)): offset0 (a, m)
//
extern
castfn
offset_elim {a:vt@ype} {n:int}
  (x: offset1 (a, n)): natLt(n)
//
extern
fun{a:t@ype}
offset_getopt {n:int} {b:bool}
  (&(@[INV(a)][n]), offset (a, n, b), &a? >> opt (a, b)): bool b
//
extern
fun{a:t@ype}
offset_get {n:int}
  (&(@[INV(a)][n]), offset1 (a, n), &a? >> a): void
//
extern
fun{a:t@ype}
offset_set {n:int}
  (&(@[INV(a)][n]), offset1 (a, n), &a >> _): void
//
extern
fun{a:vt@ype}
offset2ptropt {n:int} {l:addr} {b:bool} (
  !array_v (INV(a), l, n)
| ptr l, offset (a, n, b)
) : [l1:addr] (
  option_v ((a @ l1, (a @ l1, !array_v (a, l, n)) -<lin,prf> void), l1 > null)
| ptr l1
) // end of [offset2ptropt]
//
extern  
fun{a:vt@ype}
offset2ptr {n:int} {l:addr}
( !array_v (INV(a), l, n)
| ptr l, offset1 (a, n)
) : [l1:addr] (
  a @ l1
, (a @ l1, !array_v (INV(a), l, n)) -<lin,prf> void
| ptr l1
) // end of [offset2ptr]

(* ****** ****** *)

local

dataprop offset_p (int, int, bool) =
  | {n:int} offset_p_none (~1, n, false)
  | {i,n:int | i >= 0; i < n} offset_p_some (i, n, true)

prfun
offset_p_sub {i:int} {n,m:int | n <= m} {b:bool} .< >.
(pf: offset_p (i, n, b)):<> offset_p (i, m, b) =
  case+ pf of
  | offset_p_none () => offset_p_none ()
  | offset_p_some () => offset_p_some ()
// end of [offset_p_sub]

assume offset (a:vt@ype+, n:int, b:bool) =
  [i:int] (offset_p (i, n, b) | int i)

in // in of [local]
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

(* ****** ****** *)

implement
main0 () = let
//
var A = @[int](5,4,3,2,1)
//
val o0 = offset_make (0)
val o2 = offset_make (2)
val o3 = offset_make (3)
//
val (pf1, fpf1 | p1o0) = offset2ptr<int> (view@A | addr@A, o0)
val (pf2, fpf2 | p2o2) = offset2ptr (view@A | addr@A, o2)
val (pf3, fpf3 | p3o3) = offset2ptr (view@A | addr@A, o3)
//
val out = stdout_ref
val () = fprint (out, "A = ")
val () = fprint_array (out, A, i2sz(5))
val () = fprint_newline (out)
//
val () = println! ("[0] = ", !p1o0, "; [2] = ", !p2o2, "; [3] = ", !p3o3)
//
prval () = fpf1 (pf1, view@A)
prval () = fpf2 (pf2, view@A)
prval () = fpf3 (pf3, view@A)
//
in
  // nothing
end // end of [main]
