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
patsopt_file2string (fname: string): string
fun{}
patsopt_string2string (code: string): string
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
atscc2js_file2string (fname: string): string
//
(* ****** ****** *)
//
fun{}
patsopt_continue (fname: string): string
fun{}
patsopt_continue_file2string (code: string): string
fun{}
patsopt_continue_string2string (code: string): string
//
(* ****** ****** *)
//
fun{}
patsopt_atscc2js_string2string (code: string): string
//
(* ****** ****** *)

(* end of [basics.sats] *)
