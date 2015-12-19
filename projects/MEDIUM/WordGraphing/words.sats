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
//
abstype
word_type = ptr
//
typedef
word = word_type
typedef
wordlst = list0(word)
//
(* ****** ****** *)
//
(*
val
theDictionary
  : hashtbl(string, word)
*)
//
val
theDictionary : dynarray(word)
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
//
fun{}
word_add_synonym
  (w0: word, synonym: string): void
fun{}
word_add_antonym
  (w0: word, antonym: string): void
//
overload .add_synonym with word_add_synonym
overload .add_antonym with word_add_antonym
//
(* ****** ****** *)

(* end of [words.sats] *)
