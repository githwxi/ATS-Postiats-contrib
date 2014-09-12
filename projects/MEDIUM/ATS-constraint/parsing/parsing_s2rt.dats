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
fun parse_S2RTbas (jsonval) : s2rt

extern
fun parse_S2RTfun (jsonval) : s2rt

(* ****** ****** *)

implement 
parse_S2RTbas
  (jsv0) = let
//  
val-JSONarray(jsvs) = jsv0
val () = assertloc (length(jsvs) >= 1)
//
val srt = parse_string (jsvs[0])
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
      | "bit8" => S2RTbitvec (8)
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
      | _ => let
        (*
        val () = fprintln! (stderr_ref, "Could not understand sort :", srt)
        *)
      in
        S2RTignored ()
      end
end // end of [parse_S2RTbas]

(* ****** ****** *)

implement
parse_S2RTfun
  (jsv0) = let
//
val-JSONarray(jsvs) = jsv0
val () = assertloc (length(jsvs) >= 2)
val-JSONarray(args) = jsvs[0]
implement list_map$fopr<jsonval><s2rt> (x) =
  parse_s2rt (x)
//
val arguments = list_of_list_vt {s2rt} (
  list_map<jsonval><s2rt> (args)
)
//
val ret = parse_s2rt (jsvs[1])
//
in
  S2RTfun (arguments, ret)
end // end of [parse_S2RTfun]

(* ****** ****** *)

implement
parse_s2rt
  (jsv0) = let
  val-JSONobject(lxs) = jsv0
  val-list_cons (lx, lxs) = lxs
  val name = lx.0 and jsv2 = lx.1
in
//
case+ name of
//
| "S2RTbas" => parse_S2RTbas (jsv2)
| "S2RTfun" => parse_S2RTfun (jsv2)
| _(*rest*) => S2RTignored ()
//
end // end of [parse_s2rt]

(* ****** ****** *)

(* end of [parsing_s2rt] *)
