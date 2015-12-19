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
word_create_add("deity")
//
val () = w0.add_synonym("god")
val () = w0.add_synonym("goddess")
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val w0 =
word_create_add("differentiate")
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val w0 =
word_create_add("disaster")
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val w0 =
word_create_add("discourse")
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [D-words.dats] *)
