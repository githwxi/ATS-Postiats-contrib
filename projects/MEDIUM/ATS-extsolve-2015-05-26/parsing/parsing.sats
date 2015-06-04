(*
** Parsing constraints in JSON format
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "constraint/constraint.sats"

staload "parsing/jsonval.sats"

(* ****** ****** *)

fun{} parse_int (jsv: jsonval): int
fun{} parse_string (jsv: jsonval): string

(* ****** ****** *)

fun{} parse_stamp (jsv: jsonval): stamp
fun{} parse_symbol (jsv: jsonval): symbol
fun{} parse_location (jsv: jsonval): loc_t

(* ****** ****** *)

fun {
a:t@ype
} parse_list
  (jsv: jsonval): List0 (a)
// end of [parse_list]

(* ****** ****** *)

fun {
a:t@ype
} parse_option
  (jsv: jsonval): Option (a)
// end of [parse_option]

(* ****** ****** *)
  
fun{} parse_s2rt (jsv: jsonval): s2rt
fun{} parse_s2rtlst (jsv: jsonval): s2rtlst
 
(* ****** ****** *)

fun{} parse_s2cst (jsv: jsonval): s2cst
fun{} parse_s2var (jsv: jsonval): s2var
fun{} parse_s2Var (jsv: jsonval): s2Var

(* ****** ****** *)

fun{} parse_s2zexp (jsv: jsonval): s2zexp

(* ****** ****** *)

fun{} parse_s2exp (jsv: jsonval): s2exp
fun{} parse_s2explst (jsv: jsonval): s2explst

(* ****** ****** *)

fun{} parse_s3itm (jsv: jsonval): s3itm
fun{} parse_s3itmlst (jsv: jsonval): s3itmlst
fun{} parse_s3itmlstlst (jsv: jsonval): s3itmlstlst

(* ****** ****** *)

fun{} parse_h3ypo (jsv: jsonval): h3ypo

(* ****** ****** *)

fun{} parse_c3nstr (jsv: jsonval): c3nstr
fun{} parse_c3nstropt (jsv: jsonval): c3nstropt

(* ****** ****** *)

fun parse_c3nstr_from_stdin (): c3nstr

(* ****** ****** *)

fun{} parse_s2cstmap (jsv: jsonval): void

fun{} parse_s2varmap (jsv: jsonval): void

(* ****** ****** *)

fun the_s2cstmap_listize (): List (s2cst)

(* ****** ****** *)

(* end of [parsing.sats] *)
