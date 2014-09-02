(*
** Parsing constraints in JSON format
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "./../constraint.sats"
//
(* ****** ****** *)

staload "{$JSONC}/SATS/json_ML.sats"

(* ****** ****** *)

staload "./parsing.sats"
staload "./parsing.dats"

(* ****** ****** *)

extern
fun parse_S2ZEvar (jsonval): s2zexp

(* ****** ****** *)

implement
parse_S2ZEvar 
  (jsv0) = let
//
val-JSONarray(jsvs) = jsv0
val () = assertloc (length(jsvs) >= 1)
val s2v = parse_s2var (jsvs[0])
//
in
  S2ZEvar (s2v)
end // end of [parse_S2ZEvar]

(* ****** ****** *)

implement 
parse_s2zexp 
  (jsv0) = let
val-JSONobject(lxs) = jsv0
val-list_cons (lx, lxs) = lxs
//
val name = lx.0 and jsv2 = lx.1
//
in
//
  case+ name of
  | "S2ZEvar" => parse_S2ZEvar (jsv2)
  | _ => S2ZEbot ()
//
end