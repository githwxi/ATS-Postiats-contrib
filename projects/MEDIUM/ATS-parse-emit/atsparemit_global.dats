(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)

staload
FIL = {
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef T = fil_t
//
#include "{$LIBATSHWXI}/globals/HATS/gstacklst.hats"
//
implement
the_filename_pop () = pop_exn ()
implement
the_filename_push (fil) = push (fil)
//
implement
the_filename_get () = get_top_exn ()
//
} (* end of [staload] *)

(* ****** ****** *)

staload
LEXERR = {
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef T = lexerr
//
#include "{$LIBATSHWXI}/globals/HATS/gstacklst.hats"
//
implement
the_lexerrlst_insert (x) = push (x)
//
} (* end of [staload] *)

(* ****** ****** *)

staload KW =
{
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
staload "./atsparemit.sats"
//
typedef key = string
typedef itm = keyword
//
#define CAPACITY 1024
//
//
staload
"libats/SATS/hashtbl_linprb.sats"
//
implement hashtbl$recapacitize<> () = 0
//
#include "{$LIBATSHWXI}/globals/HATS/ghashtbl_linprb.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

val () =
{
//
val-~None_vt() = $KW.insert_opt ("ATSif", ATSif)
val-~None_vt() = $KW.insert_opt ("ATSthen", ATSthen)
val-~None_vt() = $KW.insert_opt ("ATSelse", ATSelse)
//
} (* end of [val] *)

(* ****** ****** *)

implement
keyword_search
  (name) = let
//
val cp = $KW.search_ref (name)
//
in
//
if isneqz(cp)
  then $UNSAFE.cptr_get<keyword> (cp) else KWnone()
//
end // end of [keyword_search]

(* ****** ****** *)

(* end of [atsparemit_global.dats] *)
