(* ****** ****** *)

(*
** Author: Zoe Xi
** Author: Hongwei Xi
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

typedef
word = gvhashtbl
typedef
wordlst = list0(word)

(* ****** ****** *)
//
val
theDictionary
  : hashtbl(string, word)
//
(* ****** ****** *)
//
fun{}
word_create(string): word
//
fun{}
word_create_add(string): word
//
(* ****** ****** *)

(* end of [words.sats] *)
