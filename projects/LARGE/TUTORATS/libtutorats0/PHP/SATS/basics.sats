(*
//
// For invoking [patsopt]
//
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#define
ATS_EXTERN_PREFIX "tutorats_"
//
(* ****** ****** *)
//
// HX: implemented in CATS/basics_cats.php
//
fun fname_dats_c (fname: string): string = "mac#%"
fun fname_dats_js (fname: string): string = "mac#%"
fun fname_dats_php (fname: string): string = "mac#%"
//
(* ****** ****** *)
//
fun exec_retval (command: string): int(*ret*) = "mac#%"
//
(* ****** ****** *)
//
datatype compres =
//
// HX-2014-09:
// the order must be maintained!!!
//
  | COMPRES1 of (string(*target*)) // success
  | COMPRES2 of (string(*source*), string(*errmsg*)) // failue
//
(* ****** ****** *)
//
fun{}
patsopt_get (): string
//
fun{}
patsopt_format_command
  (string, string, string): string
//
(* ****** ****** *)
//
fun{}
patsopt_file (fname: string): compres
fun{}
patsopt_code (ptext: string): compres
//
(* ****** ****** *)
//
fun{}
atscc2js_get (): string
//
fun{}
atscc2js_format_command
  (string, string, string): string
//
fun{}
atscc2js_file (fname: string): compres
//
(* ****** ****** *)
//
fun{}
patsopt_continue (fname: string): compres
fun{}
patsopt_continue_file (fname: string): compres
fun{}
patsopt_continue_code (ptext: string): compres
//
(* ****** ****** *)
//
fun{}
patsopt_atscc2js_code (ptext: string): compres
//
(* ****** ****** *)

(* end of [basics.sats] *)
