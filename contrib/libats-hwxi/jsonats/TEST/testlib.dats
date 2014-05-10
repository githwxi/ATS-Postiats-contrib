(*
** stream of characters
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
//
(* ****** ****** *)

local
#include
"{$LIBATSHWXI}/cstream/DATS/cstream.dats"
in (*in-of-local *)
end // end of [local]

(* ****** ****** *)

local
#include
"{$LIBATSHWXI}/cstream/DATS/cstream_fileref.dats"
in (*in-of-local *)
end // end of [local]

(* ****** ****** *)

local
#include
"{$LIBATSHWXI}/cstream/DATS/cstream_tokener.dats"
in (*in-of-local *)
end // end of [local]

(* ****** ****** *)

local
#include"{$LIBATSHWXI}/jsonats/DATS/jsonats.dats"
in (*in-of-local *)
end // end of [local]

(* ****** ****** *)

(* end of [testlib.dats] *)
