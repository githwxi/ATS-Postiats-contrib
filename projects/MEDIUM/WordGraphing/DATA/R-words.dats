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
word_create_add("recalcitrant")
//
val () = w0.add_synonym("stubborn")
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [R-words.dats] *)
