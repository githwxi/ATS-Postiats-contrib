(*
** Parsing: ATS/JSON -> UTFPL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#define
LIBJSONC_targetloc
"\
$PATSHOME/contrib\
/atscntrb/atscntrb-hx-libjson-c"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
staload
"./../../SATS/utfpl.sats"
staload
"./../../SATS/PARSING/parsing.sats"
//
(* ****** ****** *)
  
staload "{$LIBJSONC}/SATS/json_ML.sats"

(* ****** ****** *)

implement
parse_d2eclist_export
  (jsv0) = let
//
val-~Some_vt(jsv1) =
  jsonval_get_field (jsv0, "d2cstmap")
val-~Some_vt(jsv2) =
  jsonval_get_field (jsv0, "d2varmap")
val-~Some_vt(jsv3) =
  jsonval_get_field (jsv0, "d2eclist")
//
val () = parse_d2cstmap (jsv1)
val () = parse_d2varmap (jsv2)
//
in
  parse_d2eclist (jsv3)
end // end of [parse_d2eclist_export]
  
(* ****** ****** *)

(* end of [parsing_export.dats] *)
