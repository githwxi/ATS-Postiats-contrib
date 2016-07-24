(*
//
// For processing inputform
//
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PHP}/basics_php.sats"
staload
"{$LIBATSCC2PHP}/SATS/integer.sats"
staload
"{$LIBATSCC2PHP}/SATS/float.sats"
staload
"{$LIBATSCC2PHP}/SATS/string.sats"
staload
"{$LIBATSCC2PHP}/SATS/filebas.sats"
//
(* ****** ****** *)
//
staload "./libtutoriats0/PHP/SATS/basics.sats"
//
staload _ = "./libtutoriats0/PHP/DATS/patsopt.dats"
staload _ = "./libtutoriats0/PHP/DATS/atscc2js.dats"
staload _ = "./libtutoriats0/PHP/DATS/patsopt_continue.dats"
//
(* ****** ****** *)
//
extern
fun
patsopt_atscc2js_code_0_ (string): compres = "mac#"
//
(* ****** ****** *)
//
implement
patsopt_get<> () =
  "/home/project-web/ats-lang/ATS-Postiats/bin/patsopt"
//
implement
atscc2js_get<> () =
  "/home/project-web/ats-lang/ATS-Postiats/bin/atscc2js"
//
(* ****** ****** *)
//
implement
patsopt_atscc2js_code_0_ (code) = patsopt_atscc2js_code<> (code)
//
(* ****** ****** *)

(* end of [inputform_process.dats] *)
