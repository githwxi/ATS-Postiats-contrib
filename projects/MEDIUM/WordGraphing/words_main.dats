(* ****** ****** *)

(*
** Author: Zoe Xi
** Author: Hongwei Xi
*)

(* ****** ****** *)

#include "./words.dats"

(* ****** ****** *)

#include "./A-words/A-words.dats"

(* ****** ****** *)

implement
main0() = () where
{
//
val nw = theDictionary.size()
//
val ((*void*)) =
  println! ("theDictionary.size() = ", nw)
//
(*
val ws = theDictionary.listize0()
*)
val ws = theDictionary.listize1()
val () = assertloc (nw = length(ws))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [words_main.dats] *)
