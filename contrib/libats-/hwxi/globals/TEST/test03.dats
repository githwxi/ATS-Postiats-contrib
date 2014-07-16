(*
** HX-2013-06:
** Toplevel list-based stack
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload S =
{
//
typedef T = int
//
#include "./../HATS/gstacklst.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

implement
main0 () =
{
//
val () = $S.push(0)
val () = println! ("$S.push(0)")
val () = $S.push(1)
val () = println! ("$S.push(1)")
val () = $S.push(2)
val () = println! ("$S.push(2)")
val () = println! ("$S.get_top_exn() = ", $S.get_top_exn())
//
val () = println! ("$S.pop_exn() = ", $S.pop_exn())
val () = println! ("$S.pop_exn() = ", $S.pop_exn())
//
val () = $S.push(3)
val () = println! ("$S.push(3)")
val () = println! ("$S.get_top_exn() = ", $S.get_top_exn())
//
val () = println! ("$S.pop_exn() = ", $S.pop_exn())
val () = println! ("$S.pop_exn() = ", $S.pop_exn())
//
val () = println! ("$S.isnil((*void*)) = ", $S.isnil())
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test03.dats] *)
