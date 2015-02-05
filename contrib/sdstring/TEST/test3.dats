(*
** For testing sdstring
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "./../SATS/sdstring.sats"
//
staload _ = "./../DATS/sdstring.dats"
//
(* ****** ****** *)

implement
main0((*void*)) =
{
//
val
foo = sdsnew("foo")
val () =
println!
("foo = ", $UNSAFE.castvwtp1{string}(foo))
//
implement{env}
sdstring_foreach$fwork(c, env) = c := toupper(c)
//
val n = sdstring_foreach(foo)
val () =
println!
("foo = ",
  $UNSAFE.castvwtp1{string}(foo))
val () = println! ("length(foo) = ", n)
//
val ((*freed*)) = sdsfree(foo)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test2.dats] *)
