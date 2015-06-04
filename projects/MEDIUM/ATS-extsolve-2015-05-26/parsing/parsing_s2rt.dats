(*
** Parsing constraints in JSON format
*)

(* ****** ****** *)

#include
"share/atspre_define.hats"

(* ****** ****** *)

staload "constraint/constraint.sats"

(* ****** ****** *)

staload "parsing/jsonval.sats"

(* ****** ****** *)

staload "parsing/parsing.sats"

(* ****** ****** *)

implement{}
parse_s2rtlst
  (jsv0) = let
  
    implement
    jsonval_parse<s2rt> (jsv) = parse_s2rt (jsv)
    
in
    parse_list<s2rt> (jsv0)
end

(* ****** ****** *)

implement{}
parse_s2rt
  (jsv0) = let
in
    if jsv0.has_key ("S2RTbas") then
        parse_S2RTbas (jsv0["S2RTbas"])
    else if jsv0.has_key ("S2RTfun") then
        parse_S2RTfun (jsv0["S2RTfun"])
    else 
        S2RTignored ()
end where {

fun
parse_S2RTbas
  (jsv0: jsonval): s2rt = let

val () = assertloc (jsv0.size() >= 1)
//
// val () = println! ("Trying to parse base sort!")
val srt = parse_string (jsv0[0])
// val () = println! ("Parsed base sort!")
in
    case+ srt of
      | "int" => S2RTint ()
      | "addr" => S2RTaddr ()
      | "bool" => S2RTbool ()
      | "cls" => S2RTcls ()
      | "rat" => S2RTrat ()
      //
      | "array" => S2RTarray ()
      | "stampseq" => S2RTarray ()
      | "infseq" => S2RTarray ()
      | "bv8" => S2RTbitvec (8)
      | "bv16" => S2RTbitvec (16)
      | "bv32" => S2RTbitvec (32)
      | "bv64" => S2RTbitvec (64)
      //
      (** 
         As far as the constraint solver is concerned, there
         shouldn't be any difference between a non-linear and
         linear unboxed type. 
      *)
      | "t@ype" => S2RTt0ype ()
      (**
        patsopt doesn't seem consistent with the different flat type
        names.
      *)
      | "viewt0ype" => S2RTt0ype ()
      //
      (**
        There really should be a distinction here between flat types
        and boxed types if only because
        
          \forall t,s:type sizeof(t) == sizeof(s)
      *)
      | "type" => S2RTt0ype ()
      | "viewtype" =>  S2RTt0ype ()
      | _ => S2RTuninterp (srt)
   
end // end of [parse_S2RTbas]

fun
parse_S2RTfun
  (jsv0:jsonval): s2rt = let

val () = assertloc (jsv0.size() >= 2)
val args = parse_s2rtlst (jsv0[0])
//
val ret = parse_s2rt (jsv0[1])
//
in
  S2RTfun (args, ret)
end // end of [parse_S2RTfun]

} // end of [parse_s2rt]

(* ****** ****** *)

(* end of [parsing_s2rt] *)
