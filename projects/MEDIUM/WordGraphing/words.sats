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
word_get_spelling(w0: word): string
//
overload .spelling with word_get_spelling
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
//
fun{}
word_get_synonyms(w0: word): gvlist
fun{}
word_get_antonyms(w0: word): gvlist
//
overload .synonyms with word_get_synonyms
overload .antonyms with word_get_antonyms
//
(* ****** ****** *)
//
fun{}
compare_word_word(word, word): int
//
overload compare with compare_word_word
//
(* ****** ****** *)
//
fun{}
fprint_word_text : fprint_type(word)
//
fun{}
fprint_word_code : fprint_type(word)
//
(* ****** ****** *)

(* end of [words.sats] *)
