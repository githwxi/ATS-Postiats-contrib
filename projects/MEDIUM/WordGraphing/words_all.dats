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

(*
#include "./DATA/A-words.dats"
#include "./DATA/B-words.dats"
#include "./DATA/C-words.dats"
#include "./DATA/D-words.dats"
#include "./DATA/J-words.dats"
#include "./DATA/P-words.dats"
#include "./DATA/R-words.dats"
#include "./DATA/S-words.dats"
*)

(* ****** ****** *)

#include "./DATA/all-words-in-one.dats"

(* ****** ****** *)

#include "./Zoe-new-words-addition.dats"

(* ****** ****** *)

implement
main0() = () where
{
//
val nw =
  theDictionary.size()
//
val () = println! ("(*")
//
val () =
  println! ("theDictionary.size() = ", nw)
//
val () = println! ("*)")
val () = println! ("\n(* ****** ****** *)\n")
//
val ws = theDictionary.listize0()
val ws =
  list0_mergesort(ws, lam(x, y) => $effmask_all(compare(x, y)))
//
val () = list0_foreach(ws, lam(w) => fprint_word_code(stdout_ref, w))
//
val () = println! ("(* end of [all-words-in-one.dats] *)")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [words_all.dats] *)
