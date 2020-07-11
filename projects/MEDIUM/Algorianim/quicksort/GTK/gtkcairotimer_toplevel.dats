(* ****** ****** *)
//
// HX: lib-support for gtkcairotimer
//
(* ****** ****** *)
//
#define ATS_PACKNAME
"ATSCNTRB.libats-hwxi\
.teaching.gtkcairotimer_toplevel"
//
(* ****** ****** *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* ****** ****** *)

local
#define
LIBATSHWXI_targetloc
"$PATSCONTRIB/contrib/libats-hwxi"
#include
"\
{$LIBATSHWXI}\
/teaching/myGTK/DATS/gtkcairotimer/gtkcairotimer_toplevel.dats"
in (*nothing*) end

(* ****** ****** *)

(* end of [gtkcairotimer_toplevel.dats] *)
