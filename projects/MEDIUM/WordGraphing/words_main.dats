(* ****** ****** *)

(*
** Author: Zoe Xi
** Author: Hongwei Xi
*)

(* ****** ****** *)

#define INCLUDED 1

(* ****** ****** *)

#include "./words.dats"

(* ****** ****** *)

#include "./A-words/A-words.dats"
#include "./B-words/B-words.dats"
#include "./C-words/C-words.dats"
#include "./D-words/D-words.dats"
#include "./J-words/J-words.dats"
#include "./P-words/P-words.dats"
#include "./R-words/R-words.dats"
#include "./S-words/S-words.dats"

(* ****** ****** *)

#include "./Zoe-new-words-addition.dats"

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
