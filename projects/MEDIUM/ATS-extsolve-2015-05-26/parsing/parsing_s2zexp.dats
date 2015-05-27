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
staload "constraint/constraint.sats"
//
(* ****** ****** *)

staload "parsing/jsonval.sats"

(* ****** ****** *)

staload "parsing/parsing.sats"

(* ****** ****** *)

implement{}
parse_s2zexp 
  (jsv0) = let
in
    if jsv0.has_key ("S2ZEvar") then
        parse_S2ZEvar (jsv0["S2ZEvar"])
    else
        S2ZEbot ()
end where {

fun
parse_S2ZEvar 
  (jsv0: jsonval): s2zexp = let
    val () = assertloc (jsv0.size() >= 1)
    val s2v = parse_s2var (jsv0[0])
//
in
  S2ZEvar (s2v)
end // end of [parse_S2ZEvar]

} // end of [parse_s2zexp]