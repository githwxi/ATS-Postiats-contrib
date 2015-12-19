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
  hashtbl_make_nil<string,word>(i2sz(INITCAP))
end // end of [theDictionary]

(* ****** ****** *)

implement
{}(*tmp*)
word_create
  (spelling) = w0 where
{
//
val () =
println!
  ("word_create: ", spelling)
//
val w0 =
  gvhashtbl_make_nil(16)
val () =
  w0["spelling"] := GVstring(spelling)
//
} (* end of [word_create] *)

(* ****** ****** *)

implement
{}(*tmp*)
word_create_add
  (spelling) = w0 where
{
//
val w0 =
  word_create(spelling)
val-~None_vt() =
  hashtbl_insert(theDictionary, spelling, w0)
//
} (* end of [word_create_add] *)

(* ****** ****** *)

(* end of [words.dats] *)
