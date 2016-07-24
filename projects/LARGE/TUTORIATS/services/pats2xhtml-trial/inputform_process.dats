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
staload
"./libtutoriats0/PHP/SATS/basics.sats"
//
staload _ =
"./libtutoriats0/PHP/DATS/pats2xhtml.dats"
//
(* ****** ****** *)
//
extern
fun
pats2xhtml_dyncode_0_ 
  (code: string): compres = "mac#"
//
(* ****** ****** *)
//
implement
pats2xhtml_get<> () =
(
  "/home/project-web/ats-lang/ATS-Postiats/bin/pats2xhtml"
) (* end of [pats2xhtml_get] *)
//
(* ****** ****** *)
//
implement
pats2xhtml_dyncode_0_ (code) = pats2xhtml_code<> (1(*dyn*), code)
//
(* ****** ****** *)

(* end of [inputform_process.dats] *)
