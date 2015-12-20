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
dict_type = ptr
//
typedef
dict = dict_type
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
val theDict: dict
//
(* ****** ****** *)
//
fun
// fun{}
dict_get_size(dict): size_t
//
overload .size with dict_get_size
//
(* ****** ****** *)
//
fun
// fun{}
dict_search_word_exn
  (dict, string): word
fun
// fun{}
dict_search_word_opt
  (dict, string): Option_vt(word)
//
overload [] with dict_search_word_exn
overload .search with dict_search_word_opt
//
(* ****** ****** *)
fun
// fun{}
dict_insert_word
  (dict, word): Option_vt(word)
//
overload .insert with dict_insert_word
//
(* ****** ****** *)
//
fun
// fun{}
dict_get_wordlst(dict: dict): wordlst
//
(* ****** ****** *)
//
fun
// fun{}
word_create(string): word
//
fun
// fun{}
word_create_add(string): word
//
(* ****** ****** *)
//
fun
// fun{}
word_get_spelling(w0: word): string
//
overload .spelling with word_get_spelling
//
(* ****** ****** *)
//
fun
// fun{}
word_add_meaning
  (w0: word, meaning: string): void
//
overload .add_meaning with word_add_meaning
//
fun
// fun{}
word_get_meanings(w0: word): gvlist
//
overload .meanings with word_get_meanings
//
(* ****** ****** *)
//
fun
// fun{}
word_add_synonym
  (w0: word, synonym: string): void
fun
// fun{}
word_add_antonym
  (w0: word, antonym: string): void
//
overload .add_synonym with word_add_synonym
overload .add_antonym with word_add_antonym
//
(* ****** ****** *)
//
fun
// fun{}
word_get_synonyms(w0: word): gvlist
fun
// fun{}
word_get_antonyms(w0: word): gvlist
//
overload .synonyms with word_get_synonyms
overload .antonyms with word_get_antonyms
//
(* ****** ****** *)
//
fun
// fun{}
compare_word_word(word, word): int
//
overload compare with compare_word_word
//
(* ****** ****** *)
//
fun{}
fprint_word_text : fprint_type(word)
//
(* ****** ****** *)
//
fun{}
fprint_word_code : fprint_type(word)
fun{}
fprint_wordlst_code : fprint_type(wordlst)
//
(* ****** ****** *)
//
fun{}
wordlst_process
  (ws: wordlst): wordlst
//
fun{}
wordlst_process$cont(w: word): bool
fun{}
wordlst_process$fwork(w: word): void
//
(* ****** ****** *)
//
fun{}
wordlst_split_a2z(ws: wordlst): void
//
(* ****** ****** *)

fun{}
wordlst_get_duplicates(ws: wordlst): wordlst

(* ****** ****** *)

(* end of [words.sats] *)
