(*
** Parsing constraints in JSON format
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload "constraint/constraint.sats"
//
(* ****** ****** *)

staload "parsing/jsonval.sats"

(* ****** ****** *)

staload "./parsing.sats"

(* ****** ****** *)

extern
fun{}
parse_c3nstr_node (jsonval): c3nstr_node

(* ****** ****** *)

implement{}
parse_c3nstr
  (jsv0) = let

val jsv =jsv0["c3nstr_loc"]
val loc = parse_location (jsv)
val jsv =jsv0["c3nstr_node"]
val node = parse_c3nstr_node (jsv)

in
  c3nstr_make_node (loc, node)
end // end of [parse_c3nstr]

(* ****** ****** *)

implement{}
parse_c3nstropt
  (jsv0) = let
  
  implement
  jsonval_parse<c3nstr> (jsv) = parse_c3nstr (jsv)
in
  parse_option<c3nstr> (jsv0)
end // end of [parse_c3nstropt]

(* ****** ****** *)

extern
fun{} parse_C3NSTRprop (jsonval): c3nstr_node
extern
fun{} parse_C3NSTRitmlst (jsonval): c3nstr_node

(* ****** ****** *)

implement{}
parse_c3nstr_node
  (jsv0) = let
(*
val (
) = fprintln!
  (stdout_ref, "parse_c3nstr_node: jsv0 = ", jsv0)
*)
//
in
    if jsv0.has_key ("C3NSTRprop") then
        parse_C3NSTRprop (jsv0["C3NSTRprop"])
    else if jsv0.has_key ("C3NSTRitmlst") then
        parse_C3NSTRitmlst (jsv0["C3NSTRitmlst"])
    else let
        val () = assertloc (false)
    in
        exit (1)
    end
end where { 

fun
parse_C3NSTRprop
  (jsv0: jsonval): c3nstr_node = let
    val () = assertloc (jsv0.size() >= 1)
    val s2e = parse_s2exp (jsv0[0])
in
  C3NSTRprop (s2e)
end // end of [parse_C3NSTRprop]

fun
parse_C3NSTRitmlst
  (jsv0: jsonval): c3nstr_node = let
    val () = assertloc (jsv0.size() >= 1)
    val s3is = parse_s3itmlst (jsv0[0])
in
  C3NSTRitmlst (s3is)
end // end of [parse_C3NSTRitmlst]

} // end of [parse_c3nstr_node]

(* ****** ****** *)

(* end of [parsing_c3nstr] *)
