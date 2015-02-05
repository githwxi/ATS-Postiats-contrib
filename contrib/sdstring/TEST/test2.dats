(*
** For testing sdstring
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../SATS/sdstring.sats"

(* ****** ****** *)

implement
main0((*void*)) =
{
//
val
foo = sdsnew("foo")
val
foo1 = sdsdup(foo)
//
val foo2 = sdscat(foo1, "foo")
val foo3 = sdscatsds(foo2, foo)
//
val () =
println! ("foo3 = ", $UNSAFE.castvwtp1{string}(foo3))
//
val ((*freed*)) = sdsfree(foo)
val ((*freed*)) = sdsfree(foo3)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test2.dats] *)
