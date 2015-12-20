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
#include "./DATA/E-words.dats"
#include "./DATA/F-words.dats"
#include "./DATA/G-words.dats"
#include "./DATA/H-words.dats"
#include "./DATA/I-words.dats"
#include "./DATA/J-words.dats"
#include "./DATA/K-words.dats"
#include "./DATA/L-words.dats"
#include "./DATA/M-words.dats"
#include "./DATA/N-words.dats"
#include "./DATA/O-words.dats"
#include "./DATA/P-words.dats"
#include "./DATA/Q-words.dats"
#include "./DATA/R-words.dats"
#include "./DATA/S-words.dats"
#include "./DATA/T-words.dats"
#include "./DATA/U-words.dats"
#include "./DATA/V-words.dats"
#include "./DATA/W-words.dats"
#include "./DATA/X-words.dats"
#include "./DATA/Y-words.dats"
#include "./DATA/Z-words.dats"
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
val ws = theDictionary.listize0()
val ws =
list0_mergesort
  (ws, lam(x, y) => $effmask_all(compare(x, y)))
//
val () =
wordlst_split_a2z(ws)
//
val () = println! ("(*")
//
val () =
  println! ("theDictionary.size() = ", nw)
//
val () = println! ("*)")
val () = println! ("\n(* ****** ****** *)\n")
//
val () = fprint_wordlst_code(stdout_ref, ws)
//
val () = println! ("(* end of [all-words-in-one.dats] *)")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [words_all.dats] *)
