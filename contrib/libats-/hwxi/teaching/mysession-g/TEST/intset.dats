(*
** For testing
** intset implementation
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
"./../SATS/basis_intset.sats"
staload _ =
"./../DATS/basis_intset.dats"

(* ****** ****** *)

overload + with intset_add_elt

(* ****** ****** *)

overload + with intset_union
overload * with intset_intersect

(* ****** ****** *)

implement
main0() = () where
{
//
val () =
println!
  ("Hello from [intset]!")
//
#define N 10
//
val xs = intset_nil{N}()
val xs = xs + 1
val xs = xs + 3
val xs = xs + 5
val xs = xs + 6
val () = println! ("xs = ", xs)
//
val xs = xs + xs
val () = println! ("xs = ", xs)
//
val xs = xs * xs
val () = println! ("xs = ", xs)
//
val ys =
  intset_ncomplement(xs, N)
//
val () = println! ("ys = (", ys, ")")
//
val () = println! ("xs * ys = (", xs * ys, ")")
val () = println! ("xs + ys = (", xs + ys, ")")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [intset.dats] *)
