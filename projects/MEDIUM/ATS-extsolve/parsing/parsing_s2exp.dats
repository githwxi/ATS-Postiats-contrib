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

extern
fun{}
parse_s2exp_node (jsonval): s2exp_node

(* ****** ****** *)

implement{}
parse_s2exp
  (jsv0) = let
//
val jsv = jsv0["s2exp_srt"]
val s2t = parse_s2rt (jsv)
val jsv = jsv0["s2exp_node"]
val node = parse_s2exp_node (jsv)
//
in
  s2exp_make_node (s2t, node)
end // end of [parse_s2exp]

(* ****** ****** *)

implement{}
parse_s2explst 
  (jsv0) = let
  
  implement
  parse_list$fwork<s2exp> (jsv) = parse_s2exp (jsv)
  
in
  parse_list<s2exp> (jsv0)
end

(* ****** ****** *)

extern
fun{} parse_S2Eint (jsonval): s2exp_node
extern
fun{} parse_S2Eintinf (jsonval): s2exp_node

extern
fun{} parse_S2Ecst (jsonval): s2exp_node
extern
fun{} parse_S2Evar (jsonval): s2exp_node
extern
fun{} parse_S2EVar (jsonval): s2exp_node
extern
fun{} parse_S2Esizeof (jsonval): s2exp_node
extern
fun{} parse_S2Eeqeq (jsonval): s2exp_node
extern
fun{} parse_S2Etop (jsonval): s2exp_node

(* ****** ****** *)

extern
fun{} parse_S2Eapp (jsonval): s2exp_node

(* ****** ****** *)

extern
fun{} parse_S2Emetdec (jsonval): s2exp_node

(* ****** ****** *)

extern
fun{} parse_S2Esizeof (jsonval): s2exp_node

(* ****** ****** *)

extern
fun{} parse_S2Eignored (jsonval): s2exp_node

(* ****** ****** *)

implement{}
parse_s2exp_node
  (jsv0) = let
(*
val (
) = fprintln!
  (stdout_ref, "parse_s2exp_node: jsv0 = ", jsv0)
*)
in
    if jsv0.has_key("S2Eint") then
        parse_S2Eint (jsv0["S2Eint"])
        
    else if jsv0.has_key("S2Eintinf") then
        parse_S2Eintinf (jsv0["S2Eintinf"])
        
    else if jsv0.has_key("S2Ecst") then
        parse_S2Ecst (jsv0["S2Ecst"])
        
    else if jsv0.has_key("S2Evar") then
        parse_S2Ecst (jsv0["S2Evar"])
    
    else if jsv0.has_key("S2EVar") then
        parse_S2EVar (jsv0["S2Evar"])
    
    else if jsv0.has_key("S2Eeqeq") then
        parse_S2Eeqeq (jsv0["S2Eeqeq"])
    
    else if jsv0.has_key("S2Eapp") then
        parse_S2Eapp (jsv0["S2Eapp"])
    
    else if jsv0.has_key("S2Emetdec") then
        parse_S2Emetdec (jsv0["S2Emetdec"])
    
    else if jsv0.has_key( "S2Esizeof" ) then
        parse_S2Esizeof (jsv0["S2Esizeof" ])
    
    else if jsv0.has_key("S2Etop") then
        parse_S2Etop (jsv0["S2Etop"])
     
    else let
      (**
          val () =
              prerrln! ("warning(ATS): [parse_s2exp]: name = ", name)
      *)
    in
        parse_S2Eignored (jsv0)
    end
end // end of [parse_s2exp_node]


(* ****** ****** *)

implement{}
parse_S2Eint
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)

in
  S2Eint (parse_int (jsv0[0]))
end // end of [parse_S2Eint]

(* ****** ****** *)

implement{}
parse_S2Eintinf
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)

in
  S2Eintinf (parse_string (jsv0[0]))
end // end of [parse_S2Eintinf]

(* ****** ****** *)

implement{}
parse_S2Ecst
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)
val s2c = parse_s2cst (jsv0[0])

in
  S2Ecst (s2c)
end // end of [parse_S2Ecst]

(* ****** ****** *)

implement{}
parse_S2Evar
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)
val s2v = parse_s2var (jsv0[0])

in
  S2Evar (s2v)
end // end of [parse_S2Evar]

(* ****** ****** *)

implement{}
parse_S2EVar
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)
val s2V = parse_s2Var (jsv0[0])

in
  S2EVar (s2V)
end // end of [parse_S2EVar]

(* ****** ****** *)

implement{}
parse_S2Eeqeq
  (jsv0) = let

val () = assertloc (jsv0.size >= 2)
val l = parse_s2exp (jsv0[0])
val r = parse_s2exp (jsv0[1])

in
  S2Eeqeq (l, r)
end // end of [parse_S2EVar]

(* ****** ****** *)

implement{}
parse_S2Eapp
  (jsv0) = let

val () = assertloc (jsv0.size >= 2)
val s2e_fun = parse_s2exp (jsv0[0])
val s2es_arg = parse_s2explst (jsv0[1])

in
  S2Eapp (s2e_fun, s2es_arg)
end // end of [parse_S2Eapp]

(* ****** ****** *)

implement{}
parse_S2Emetdec
  (jsv0) = let

val () = assertloc (jsv0.size >= 2)
val met = parse_s2explst (jsv0[0])
val bound = parse_s2explst (jsv0[1])

in
  S2Emetdec (met, bound)
end // end of [parse_S2Emetdec]

(* ****** ****** *)

implement{}
parse_S2Esizeof
  (jsv0) = let

val () = assertloc (jsv0.size >= 1)
val s2e = parse_s2exp (jsv0[0])

in
  S2Esizeof (s2e)
end // end of [parse_S2Esizeof]

(* ****** ****** *)

implement{}
parse_S2Etop
  (jsv0) = let

val () = assertloc (jsv0.size >= 2)
val knd = parse_int (jsv0[0])
val s2e = parse_s2exp (jsv0[1])

in
  S2Etop (knd, s2e)
end // end of [parse_S2Esizeof]

(* ****** ****** *)

implement{}
parse_S2Eignored (jsv) = S2Eignored ((*void*))

(* ****** ****** *)

(* end of [parsing_s2exp] *)
