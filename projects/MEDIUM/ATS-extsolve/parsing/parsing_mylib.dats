(*
** Parsing constraints in JSON format
*)

(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0 (* no run-time dynloading *)

(* ****** ****** *)

local
in
%{
#define JSMN_STRICT 1

#include "jsmn.c"
%}
end


local
in
#include "contrib/libats-/wdblair/jsmn/DATS/jsmn.dats"
end

(* ****** ****** *)

(* end of [parsing_mylib.dats] *)
