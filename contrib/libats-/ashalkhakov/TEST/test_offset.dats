(*
**
//
// Usage of offsets
//
**
** Author: Artyom Shalkhakov
** Authoremail: artyom DOT shalkhakov AT gmail DOT com
** Start Time: February, 2015
**
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../SATS/offset.sats"
staload _ = "./../DATS/offset.dats"

(* ****** ****** *)

implement
main0 () = let
//
var A = @[int](5,4,3,2,1)
//
var o0: int
val () = o0 := 0
prval () = offset_make_ref (o0)
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
prval () = offset_free_ref (o0)
//
in
  // nothing
end // end of [main0]

(* ****** end of [test_offset.dats] ****** *)
