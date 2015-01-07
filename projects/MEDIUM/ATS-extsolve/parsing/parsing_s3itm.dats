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
//
extern
fun{} parse_S3ITMsvar (jsonval): s3itm
extern
fun{} parse_S3ITMhypo (jsonval): s3itm
extern
fun{} parse_S3ITMsVar (jsonval): s3itm
extern
fun{} parse_S3ITMcnstr (jsonval): s3itm
extern
fun{} parse_S3ITMcnstr_ref (jsonval): s3itm
extern
fun{} parse_S3ITMdisj (jsonval): s3itm
//
extern
fun{} parse_S3ITMignored (jsonval): s3itm
//
(* ****** ****** *)

implement{}
parse_s3itm
  (jsv0) = let
(*
val (
) = fprintln!
  (stdout_ref, "parse_s3itm: jsv0 = ", jsv0)
*)
in
    if jsv0.has_key ("S3ITMsvar") then
        parse_S3ITMsvar (jsv0["S3ITMsvar"])
    else if jsv0.has_key ("S3ITMhypo") then
        parse_S3ITMhypo (jsv0["S3ITMhypo"])
    else if jsv0.has_key ("S3ITMsVar") then
        parse_S3ITMsVar (jsv0["S3ITMsVar"])
    else if jsv0.has_key ( "S3ITMcnstr") then
        parse_S3ITMcnstr (jsv0["S3ITMcnstr"])
    else if jsv0.has_key ("S3ITMcnstr_ref") then
        parse_S3ITMcnstr_ref (jsv0["S3ITMcnstr_ref"])
    else if jsv0.has_key ("S3ITMdisj") then
        parse_S3ITMdisj (jsv0["S3ITMdisj"])
    else
         parse_S3ITMignored (jsv0)
end // end of [parse_s3itm]

(* ****** ****** *)

implement{}
parse_s3itmlst
  (jsv0) = let
  
  implement
  parse_list$fwork<s3itm> (jsv) = parse_s3itm (jsv)
in
  parse_list<s3itm> (jsv0)
end // end of [parse_s3itmlst]

(* ****** ****** *)

implement{}
parse_s3itmlstlst
  (jsv0) = let
  
  implement
  parse_list$fwork<s3itmlst> (jsv) = parse_s3itmlst (jsv)
in
  parse_list<s3itmlst> (jsv0)
end // end of [parse_s3itmlstlst]

(* ****** ****** *)

implement{}
parse_S3ITMsvar
  (jsv0) = let
  
val () = assertloc (jsv0.size >= 1)
val s2v = parse_s2var (jsv0[0])

in
  S3ITMsvar (s2v)
end // end of [parse_S3ITMsvar]

(* ****** ****** *)

implement{}
parse_S3ITMhypo
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)
val h3p = parse_h3ypo (jsv0[0])

in
  S3ITMhypo (h3p)
end // end of [parse_S3ITMhypo]

(* ****** ****** *)

implement{}
parse_S3ITMsVar
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)
val s2V = parse_s2Var (jsv0[0])
//
in
  S3ITMsVar (s2V)
end // end of [parse_S3ITMsVar]

(* ****** ****** *)

implement{}
parse_S3ITMcnstr
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)
val c3t = parse_c3nstr (jsv0[0])

in
  S3ITMcnstr (c3t)
end // end of [parse_S3ITMcnstr]

(* ****** ****** *)

implement{}
parse_S3ITMcnstr_ref
  (jsv0) = let

val () = assertloc (jsv0.size >= 2)
val loc = parse_location (jsv0[0])
val opt = parse_c3nstropt (jsv0[1])

in
  S3ITMcnstr_ref (loc, opt)
end // end of [parse_S3ITMcnstr_ref]

(* ****** ****** *)

implement{}
parse_S3ITMdisj
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)
val s3iss = parse_s3itmlstlst (jsv0[0])

in
  S3ITMdisj (s3iss)
end // end of [parse_S3ITMdisj]

(* ****** ****** *)
//
implement{}
parse_S3ITMignored (jsv0) =
  let val () = assertloc (false) in exit(1) end
//
(* ****** ****** *)

(* end of [parsing_s3itm.dats] *)
