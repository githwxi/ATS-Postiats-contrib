(* ****** ****** *)
//
// HX: lib-support for gtkcairotimer
//
(* ****** ****** *)
//
#define
ATS_PACKNAME
"ATSCNTRB.libats-hwxi\
.teaching.gtkcairotimer_toplevel"
//
(* ****** ****** *)
//
(*
#include "share/atspre_define.hats"
*)
//
#include "share/atspre_staload.hats"
//
(* ****** ****** *)

#define
LIBATSHWXI_targetloc
"$PATSCONTRIB/contrib/libats-hwxi"

(* ****** ****** *)

local
#include
"{$LIBATSHWXI}\
/teaching/myGTK/DATS\
/gtkcairotimer/gtkcairotimer_toplevel.dats"
in (*nothing*) end

(* ****** ****** *)

staload
PATHLST = {
//
#define
HX_GLOBALS_targetloc
"$PATSHOME/contrib\
/atscntrb/atscntrb-hx-globals"
//
#staload
DF = "./../depth-first.sats"
//
typedef T = $DF.nodelst
//
#include "share/atspre_define.hats"
#include "{$HX_GLOBALS}/HATS/gstacklst.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

(* end of [gtkcairotimer_toplevel.dats] *)
