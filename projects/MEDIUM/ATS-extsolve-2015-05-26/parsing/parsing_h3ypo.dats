(*
** Parsing constraints in JSON format
*)

(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "constraint/constraint.sats"

(* ****** ****** *)

staload "parsing/jsonval.sats"

(* ****** ****** *)

staload "parsing/parsing.sats"

(* ****** ****** *)

extern
fun{}
parse_h3ypo_node (jsonval): h3ypo_node

(* ****** ****** *)

implement{}
parse_h3ypo
  (jsv0) = let
//
val jsv= jsv0["h3ypo_loc"]
val loc = parse_location (jsv)
val jsv = jsv0["h3ypo_node"]
val node = parse_h3ypo_node (jsv)
//
in
  h3ypo_make_node (loc, node)
end // end of [parse_h3ypo]

(* ****** ****** *)

implement{}
parse_h3ypo_node
  (jsv0:jsonval): h3ypo_node = let
(*
val (
) = fprintln!
  (stdout_ref, "parse_h3ypo_node: jsv0 = ", jsv0)
*)
in
    if jsv0.has_key ( "H3YPOprop") then
        parse_H3YPOprop (jsv0["H3YPOprop"])
    else if jsv0.has_key ( "H3YPObind") then
        parse_H3YPObind (jsv0["H3YPObind"])
    else if jsv0.has_key ("H3YPOeqeq" ) then
        parse_H3YPOeqeq (jsv0["H3YPOeqeq"])
    else let
         val () = assertloc (false) 
     in 
          exit (1)
     end
end where {

fun
parse_H3YPOprop
  (jsv0:jsonval): h3ypo_node = let

val () = assertloc (jsv0.size() >= 1)
val s2e = parse_s2exp (jsv0[0])

in
  H3YPOprop (s2e)
end // end of [parse_H3YPOprop]

fun
parse_H3YPObind
  (jsv0:jsonval): h3ypo_node = let

val () = assertloc (jsv0.size() >= 2)
val s2v = parse_s2var (jsv0[0])
val s2e = parse_s2exp (jsv0[1])

in
  H3YPObind (s2v, s2e)
end // end of [parse_H3YPObind]

fun
parse_H3YPOeqeq
  (jsv0:jsonval): h3ypo_node = let
  
val () = assertloc (jsv0.size() >= 2)

val s2e1 = parse_s2exp (jsv0[0])
val s2e2 = parse_s2exp (jsv0[1])

in
  H3YPOeqeq (s2e1, s2e2)
end // end of [parse_H3YPOeqeq]

} // end of [parse_h3ypo_node]

(* ****** ****** *)

(* end of [parsing_h3ypo.dats] *)
