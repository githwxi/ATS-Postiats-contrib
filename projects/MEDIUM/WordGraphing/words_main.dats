(* ****** ****** *)

(*
** Author: Zoe Xi
** Author: Hongwei Xi
*)

(* ****** ****** *)

#define INCLUDED 1

(* ****** ****** *)

#include "./words_util.dats"

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
main0(argc, argv) = () where
{
//
var
_a2z_: bool = false
var
_all_: bool = false
//
val () =
if
argc >= 2
then (
  case+ argv[1] of
  | "-a2z" => _a2z_ := true
  | "-all" => _all_ := true
  | _ (* rest *) => ((*void*))
) (* end of [then] *)
//
val () =
if
argc >= 3
then (
  case+ argv[2] of
  | "-a2z" => _a2z_ := true
  | "-all" => _all_ := true
  | _ (* rest *) => ((*void*))
) (* end of [then] *)
//
val nw = theDict.size()
//
val ws = dict_get_wordlst(theDict)
//
val ws =
list0_mergesort
  (ws, lam(x, y) => $effmask_all(compare(x, y)))
//
val () =
if _a2z_ then
{
//
val () =
  wordlst_split_a2z(ws)
//
} (* end of [val] *)
//
val () =
if _all_ then
{
val () = println! ("(*")
//
val () =
  println! ("theDict.size() = ", nw)
//
val () = println! ("*)")
val () = println! ("\n(* ****** ****** *)\n")
//
val () = fprint_wordlst_code(stdout_ref, ws)
//
(*
//
val ws_dup =
  wordlst_get_duplicates(ws)
//
val ((*void*)) = println! ("(*")
val ((*void*)) = println! ("Duplicated entries:")
val ((*void*)) = list0_foreach(ws_dup, lam(w) => println! (w.spelling()))
val ((*void*)) = println! ("*)")
val () = println! ("\n(* ****** ****** *)\n")
//
val ((*void*)) = println! ("(* end of [all-words-in-one.dats] *)")
//
*)
//
} (* end of [val] *)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [words_main.dats] *)
