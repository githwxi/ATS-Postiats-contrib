(* ****** ****** *)
//
// ATS-parsemit
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

(* end of [atsparemit_global.dats] *)
