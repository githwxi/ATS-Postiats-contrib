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
#include
"{$LIBATSCC2PHP}/staloadall.hats"
//
(* ****** ****** *)
//
staload "./libtutoriats0/PHP/SATS/basics.sats"
//
staload _ = "./libtutoriats0/PHP/DATS/pats2xhtml.dats"
//
(* ****** ****** *)
//
extern
fun
pats2xhtml_code_0_
  (stadyn: int, code: string): compres = "mac#"
//
//
(* ****** ****** *)
//
implement
pats2xhtml_get<> () =
  "/home/project-web/ats-lang/ATS-Postiats/bin/pats2xhtml"
//
(* ****** ****** *)
//
implement
pats2xhtml_code_0_
  (stadyn, code) = pats2xhtml_code<> (stadyn, code)
//
(* ****** ****** *)

(* end of [inputform_process_php.dats] *)
