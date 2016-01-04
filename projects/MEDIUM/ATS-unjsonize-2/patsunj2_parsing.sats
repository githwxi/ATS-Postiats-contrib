(* ****** ****** *)
//
// ATS-unjsonize-2
//
(* ****** ****** *)
//
(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** HX-2015-08-06: start
*)
//
(* ****** ****** *)
//
#define
ATS_PACKNAME "PATSUNJ2"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$JSONC}/SATS/json_ML.sats"
//
(* ****** ****** *)
//
typedef
jsnvlst = List0(jsonval)
typedef
jsnvopt = Option(jsonval)
vtypedef
jsnvopt_vt = Option_vt(jsonval)
//
(* ****** ****** *)
//
fun
jsonval_get_field
  (jsonval, string): jsnvopt_vt
//
overload [] with jsonval_get_field
//
(* ****** ****** *)
//
staload
"./patsunj2_synent2.sats"
//
(* ****** ****** *)

fun hash_stamp(stamp):<> ulint

(* ****** ****** *)

fun parse_int (jsnv: jsonval): int
fun parse_string (jsnv: jsonval): string

(* ****** ****** *)

fun parse_stamp (jsnv: jsonval): stamp
fun parse_symbol (jsnv: jsonval): symbol
fun parse_location (jsnv: jsonval): loc_t

(* ****** ****** *)

fun parse_label (jsnv: jsonval): label

(* ****** ****** *)

fun{
a:t@ype
} parse_list
  (jsnv: jsonval, f: jsonval -> a): List0(a)
// end of [parse_list]

(* ****** ****** *)

fun{
a:t@ype
} parse_option
  (jsnv: jsonval, f: jsonval -> a): Option(a)
// end of [parse_option]

(* ****** ****** *)

fun parse_s2rt (jsnv: jsonval): s2rt
fun parse_s2rtlst (jsnv: jsonval): s2rtlst

(* ****** ****** *)

fun parse_s2exp (jsnv: jsonval): s2exp
fun parse_s2explst (jsnv: jsonval): s2explst

(* ****** ****** *)

fun parse_d2exp (jsnv: jsonval): d2exp
fun parse_d2explst (jsnv: jsonval): d2explst

(* ****** ****** *)

fun parse_d2ecl (jsnv: jsonval): d2ecl
fun parse_d2eclist (jsnv: jsonval): d2eclist

(* ****** ****** *)

fun parse_fileref_d2eclist (filr: FILEref): d2eclist

(* ****** ****** *)

(* end of [patsunj2_parsing.sats] *)
