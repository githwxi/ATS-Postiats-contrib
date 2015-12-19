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
val () =
  fprintln! (out, "} // end of [val]\n")
val () =
  fprintln! (out, "(* ****** ****** *)\n")
//
} (* end of [fprint_word_code] *)

end // end of [local]

(* ****** ****** *)

(* end of [words.dats] *)
