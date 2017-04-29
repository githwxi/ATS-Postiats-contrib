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
#define
LIBATSCC2PHP_targetloc
"$PATSHOME/contrib/libatscc2php/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2PHP}/staloadall.hats"
//
(* ****** ****** *)
//
staload "./libtutoriats0/PHP/SATS/basics.sats"
//
staload _ = "./libtutoriats0/PHP/DATS/patsopt.dats"
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
