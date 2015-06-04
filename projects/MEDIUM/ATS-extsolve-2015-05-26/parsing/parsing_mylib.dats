(*
** Parsing constraints in JSON format
*)

(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

#define
ATS_DYNLOADFLAG 0 (* no dynloading *)

(* ****** ****** *)

%{^
//
#define \
JSMN_STRICT 1
//
#include "./jsmn.c"
//
%} // end of [%{^]

(* ****** ****** *)

local
#include "libats-/wdblair/jsmn/DATS/jsmn.dats"
in (*nothing*) end

(* ****** ****** *)

(* end of [parsing_mylib.dats] *)
