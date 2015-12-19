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
word_create_add("papal")
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val w0 =
word_create_add("panoramic")
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val w0 =
word_create_add("placid")
//
val () = w0.add_synonym("quiet")
//
val () = w0.add_antonym("boisterous")
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [P-words.dats] *)
