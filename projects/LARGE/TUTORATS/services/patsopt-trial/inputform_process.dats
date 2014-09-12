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
staload "./libtutorats0/PHP/SATS/basics.sats"
//
staload _ = "./libtutorats0/PHP/DATS/patsopt.dats"
//
(* ****** ****** *)
//
extern
fun
patsopt_code_0_ (string): compres = "mac#"
//
(* ****** ****** *)
//
implement
patsopt_get<> () =
  "/home/project-web/ats-lang/ATS-Postiats/bin/patsopt"
//
(* ****** ****** *)
//
implement
patsopt_code_0_ (code) = patsopt_code<> (code)
//
(* ****** ****** *)

(* end of [inputform_process.dats] *)
