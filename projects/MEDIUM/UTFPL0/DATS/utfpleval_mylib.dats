//
// Library code for UTFPL
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#define
LIBJSONC_targetloc
"\
$PATSHOME/contrib\
/atscntrb/atscntrb-hx-libjson-c"
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

local
//
#include "{$LIBJSONC}/DATS/json.dats"
#include "{$LIBJSONC}/DATS/json_ML.dats"
//
in (* in of [local] *)
//
// HX: it is intentionally left to be empty
//
end // end of [local]

(* ****** ****** *)

(* end of [utfpl_mylib.dats] *)
