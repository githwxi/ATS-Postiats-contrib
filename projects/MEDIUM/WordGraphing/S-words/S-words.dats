(* ****** ****** *)

#ifdef
INCLUDED
#then
#else
staload "./../words.sats"
#endif

(* ****** ****** *)

val () =
{
//
val w0 =
word_create_add("stubborn")
//
val () = w0.add_synonym("inflexible")
val () = w0.add_synonym("mulish")
val () = w0.add_synonym("obdurate")
val () = w0.add_synonym("obstinate")
val () = w0.add_synonym("recalcitrant")
val () = w0.add_synonym("refractory")
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [S-words.dats] *)
