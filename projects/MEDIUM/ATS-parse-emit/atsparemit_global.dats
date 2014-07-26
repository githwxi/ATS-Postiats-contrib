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
implement
the_lexerrlst_pop_all () = pop_all ()
//
} (* end of [staload] *)

(* ****** ****** *)

staload
PARERR = {
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef T = parerr
//
#include "{$LIBATSHWXI}/globals/HATS/gstacklst.hats"
//
implement
the_parerrlst_insert (x) = push (x)
//
implement
the_parerrlst_pop_all () = pop_all ()
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
val-~None_vt() = $KW.insert_opt ("ATStmpdec", ATStmpdec)
//
val-~None_vt() = $KW.insert_opt ("ATSif", ATSif)
val-~None_vt() = $KW.insert_opt ("ATSthen", ATSthen)
val-~None_vt() = $KW.insert_opt ("ATSelse", ATSelse)
//
val-~None_vt() = $KW.insert_opt ("ATSgoto", ATSgoto)
//
val-~None_vt() = $KW.insert_opt ("ATSreturn", ATSreturn)
val-~None_vt() = $KW.insert_opt ("ATSreturn_void", ATSreturn_void)
//
val-~None_vt() = $KW.insert_opt ("ATStailcalbeg", ATStailcalbeg)
val-~None_vt() = $KW.insert_opt ("ATStailcalend", ATStailcalend)
//
val-~None_vt() = $KW.insert_opt ("ATSINSmove", ATSINSmove)
//
val-~None_vt() = $KW.insert_opt ("ATSINSmove_boxrec", ATSINSmove_boxrec)
val-~None_vt() = $KW.insert_opt ("ATSINSmove_boxrec_ofs", ATSINSmove_boxrec_ofs)
//
val-~None_vt() = $KW.insert_opt ("ATSSELboxrec", ATSSELboxrec)
val-~None_vt() = $KW.insert_opt ("ATSSELfltrec", ATSSELfltrec)
//
val-~None_vt() = $KW.insert_opt ("ATSINSstore_boxrec_ofs", ATSINSstore_boxrec_ofs)
val-~None_vt() = $KW.insert_opt ("ATSINSstore_fltrec_ofs", ATSINSstore_fltrec_ofs)
//
val-~None_vt() = $KW.insert_opt ("ATSINSmove_tlcal", ATSINSmove_tlcal)
val-~None_vt() = $KW.insert_opt ("ATSINSargmove_tlcal", ATSINSargmove_tlcal)
//
val-~None_vt() = $KW.insert_opt ("ATSPMVi0nt", ATSPMVi0nt)
val-~None_vt() = $KW.insert_opt ("ATSPMVf0loat", ATSPMVf0loat)
//
val-~None_vt() = $KW.insert_opt ("ATSinline", ATSinline)
val-~None_vt() = $KW.insert_opt ("ATSglobaldec", ATSglobaldec)
val-~None_vt() = $KW.insert_opt ("ATSstaticdec", ATSstaticdec)
//
val-~None_vt() = $KW.insert_opt ("ATSdyncst_mac", ATSdyncst_mac)
val-~None_vt() = $KW.insert_opt ("ATSdyncst_extfun", ATSdyncst_extfun)
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
