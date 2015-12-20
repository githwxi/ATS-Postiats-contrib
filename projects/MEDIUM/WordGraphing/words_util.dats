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

staload "./words.sats"

(* ****** ****** *)

implement
theDictionary =
let
//
val INITCAP = 1024
//
in
  dynarray_make_nil<word>(i2sz(INITCAP))
end // end of [theDictionary]

(* ****** ****** *)

local

assume
word_type = gvhashtbl

in (* in-of-local *)

implement
{}(*tmp*)
word_create
  (spelling) = w0 where
{
//
(*
val () =
println!
  ("word_create: ", spelling)
*)
//
val w0 =
  gvhashtbl_make_nil(16)
val () =
  w0["spelling"] := GVstring(spelling)
//
} (* end of [word_create] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
word_get_spelling(w0) =
  GVstring_uncons(w0["spelling"])
//
(* ****** ****** *)
//
implement
{}(*tmp*)
word_add_synonym
  (w0, rep) =
(
  gvhashtbl_push_atkey(w0, "synonym", GVstring(rep))
)
//
implement
{}(*tmp*)
word_add_antonym
  (w0, rep) =
(
  gvhashtbl_push_atkey(w0, "antonym", GVstring(rep))
)
//
(* ****** ****** *)

implement
{}(*tmp*)
word_get_synonyms
  (w0) = let
//
val gv0 = w0["synonym"]
//
in
//
case- gv0 of
| GVnil() => nil0() | GVlist(gvs) => gvs
//
end // end of [word_get_synonyms]

(* ****** ****** *)

implement
{}(*tmp*)
word_get_antonyms
  (w0) = let
//
val gv0 = w0["antonym"]
//
in
//
case- gv0 of
| GVnil() => nil0() | GVlist(gvs) => gvs
//
end // end of [word_get_antonyms]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
{}(*tmp*)
word_create_add
  (spelling) = w0 where
{
//
val w0 =
  word_create(spelling)
//
val-~None_vt() = theDictionary.insend(w0)
//
} (* end of [word_create_add] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
compare_word_word
  (w0, w1) =
  compare(w0.spelling(), w1.spelling())
//
(* ****** ****** *)

implement
{}(*tmp*)
fprint_word_text
  (out, w0) = () where
{
//
val () =
fprintln! (out, w0.spelling(), ":")
val () =
fprintln! (out, "  ", "synonyms: ", w0.synonyms())
val () =
fprintln! (out, "  ", "antonyms: ", w0.antonyms())
//
} (* end of [fprint_word_text] *)

(* ****** ****** *)

local

fun
fpr_synonym
(
  out: FILEref, syn: string
) : void = () where
{
//
val () =
fprintln!
  (out, "val () =\nword_add_synonym(w0, \"", syn, "\")")
//
} (* end of [fpr_synonym] *)

fun
fpr_synonyms
(
  out: FILEref, gvs: gvlist
) : void =
(
  list0_foreach(gvs, lam(gv) => fpr_synonym(out, GVstring_uncons(gv)))
)

fun
fpr_antonym
(
  out: FILEref, ant: string
) : void = () where
{
//
val () =
fprintln!
  (out, "val () =\nword_add_antonym(w0, \"", ant, "\")")
//
} (* end of [fpr_antonym] *)

fun
fpr_antonyms
(
  out: FILEref, gvs: gvlist
) : void =
(
  list0_foreach(gvs, lam(gv) => fpr_antonym(out, GVstring_uncons(gv)))
)

in (* in-of-local *)
implement
{}(*tmp*)
fprint_word_code
  (out, w0) = () where
{
//
val () =
fprintln!
  (out, "val () =\n{\n//")
//
val wca = "word_create_add"
//
val () =
fprintln!
( out
, "val w0 =\n"
, wca, "(\"", w0.spelling(), "\")"
)
//
val () = fprintln! (out, "//")
//
val xs = w0.synonyms()
val xs = list0_reverse(xs)
val () = fpr_synonyms(out, xs)
val () =
  if isneqz(xs) then fprintln! (out, "//")
//
val xs = w0.antonyms()
val xs = list0_reverse(xs)
val () = fpr_antonyms(out, xs)
val () =
  if isneqz(xs) then fprintln! (out, "//")
//
val () =
  fprintln! (out, "} // end of [val]\n")
val () =
  fprintln! (out, "(* ****** ****** *)\n")
//
} (* end of [fprint_word_code] *)

end // end of [local]

(* ****** ****** *)

implement
{}(*tmp*)
fprint_wordlst_code
  (out, ws) = let
//
implement
wordlst_process$cont<>(w) = true
implement
wordlst_process$fwork<>(w) = fprint_word_code(out, w)
//
in
  ignoret(wordlst_process(ws))
end // end of [fprint_wordlst_code]

(* ****** ****** *)

implement
{}(*tmp*)
wordlst_process(ws) = let
//
fun
loop(ws: wordlst): wordlst =
(
case+ ws of
| list0_cons
    (w, ws2) => let
    val cont =
      wordlst_process$cont<>(w)
    // end of [val]
  in
    if cont then (wordlst_process$fwork(w); loop(ws2)) else ws
  end // end of [list0_cons]
| list0_nil() => list0_nil()
)
//
in
  loop(ws)
end // end of [wordlst_process]

(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
wordlst_split_a2z
  (ws) = let
//
fnx
loop (
  c0: int, ws: wordlst
) : void = let
//
val c1 = int2char0(c0)
val () = assertloc('A' <= c1 && c1 <= 'Z')
val c1 = string_sing($UN.cast{charNZ}(c1))
//
val dir = "DATA/"
//
val fname =
  strptr2string(string0_append(c1, "-words.dats"))
//
val dir_fname = strptr2string(string0_append(dir, fname))
//
val outfil = fileref_open_exn(dir_fname, file_mode_w)
//
in
//
  loop2(c0, ws, fname, outfil)
//
end // end of [loop]
//
and
loop2 (
  c0: int
, ws: wordlst
, fname: string
, outfil: FILEref
) : void = let
//
local
implement
wordlst_process$cont<>(w) = 
(
  c0 = toupper(string_char(w.spelling()))
)
//
implement
wordlst_process$fwork<>(w) = fprint_word_code(outfil, w)
in
val ws = wordlst_process(ws)
end // end of [local]
//
val () =
  fprintln! (outfil, "(* end of [", fname, "] *)")
//
val () = fileref_close(outfil)
//
in
  if int2char0(c0) < 'Z' then loop(c0+1, ws) else ()
end // end of [loop2]
//
in
  loop(char2int0('A'), ws)
end // end of [wordlst_split_a2z]

(* ****** ****** *)

implement
{}(*tmp*)
wordlst_get_duplicates
  (ws) = let
//
fun
loop0
(
  ws: wordlst, res: wordlst
) : wordlst =
(
  case+ ws of
  | list0_nil() => res
  | list0_cons(w, ws) => loop1(ws, w, res)
)
//
and
loop1
(
  ws: wordlst, w0: word, res: wordlst
) : wordlst =
(
  case+ ws of
  | list0_nil() => res
  | list0_cons(w1, ws) => let
      val sgn = compare(w0, w1)
    in
      if sgn = 0
        then let
          val res = cons0(w1, cons0(w0, res))
        in
          loop2 (ws, w1, res)
        end // end of [then]
        else loop1(ws, w1, res)
    end // end of [list_cons]
)
//
and
loop2
(
  ws: wordlst, w1: word, res: wordlst
) : wordlst =
(
  case+ ws of
  | list0_nil() => res
  | list0_cons(w2, ws) => let
      val sgn = compare(w1, w2)
    in
      if sgn = 0
        then loop2(ws, w2, cons0(w2, res)) else loop1(ws, w2, res)
      // end of [if]
    end
)
//
in
  loop0(ws, list0_nil(*void*))
end // end of [wordlst_get_duplicates]

(* ****** ****** *)

(* end of [words_util.dats] *)
