(*
** mylib for [FALCON]
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#define
HX_CSTREAM_targetloc
"\
$PATSHOME/contrib\
/atscntrb/atscntrb-hx-cstream"
//
(* ****** ****** *)

%{^
#define \
atstyarr_field_undef(fname) fname[]
%} // end of [%{]

(* ****** ****** *)

local
#include
"{$HX_CSTREAM}/DATS/cstream.dats"
in (* in-of-local *)
end // end of [local]

(* ****** ****** *)

local
#include
"{$HX_CSTREAM}/DATS/cstream_fun.dats"
in (* in-of-local *)
end // end of [local]

(* ****** ****** *)

local
#include
"{$HX_CSTREAM}/DATS/cstream_cloref.dats"
in (* in-of-local *)
end // end of [local]

(* ****** ****** *)

local
#include
"{$HX_CSTREAM}/DATS/cstream_string.dats"
in (* in-of-local *)
end // end of [local]
local
#include
"{$HX_CSTREAM}/DATS/cstream_strptr.dats"
in (* in-of-local *)
end // end of [local]

(* ****** ****** *)

local
#include
"{$HX_CSTREAM}/DATS/cstream_fileref.dats"
in (* in-of-local *)
end // end of [local]
local
#include
"{$HX_CSTREAM}/DATS/cstream_fileptr.dats"
in (* in-of-local *)
end // end of [local]

(* ****** ****** *)

local
//
#include
"{$HX_CSTREAM}/DATS/cstream_tokener.dats"
//
in (* in-of-local *)
end // end of [local]

(* ****** ****** *)

(* end of [falcon_mylib.dats] *)
