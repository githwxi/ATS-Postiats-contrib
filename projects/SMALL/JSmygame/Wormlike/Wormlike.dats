(* ****** ****** *)
//
// Title:
// Concepts of Programming Languages
// Number: CAS CS 320
// Semester: Spring 2016
// Class Time: TR 12:30-2:00
// Instructor: Hongwei Xi (hwxiATbuDOTedu)
// Teaching Fellow: Hanwen Wu (hwwuATbuDOTedu)
//
(* ****** ****** *)

(*
** A worm-like game!
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
#define
ATS_MAINATSFLAG 1
//
#define
ATS_DYNLOADNAME
"Wormlike__dynload"
//
#define
ATS_STATIC_PREFIX "Wormlike__"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/print.sats"
//
staload
_ = "{$LIBATSCC2JS}/DATS/print.dats"
//
(* ****** ****** *)

%{$
//
function
clear_print_board(xs)
{
//
ats2jspre_the_print_store_clear();
//
print_board(xs);
//
document.getElementById("Wormlike_board").innerHTML = ats2jspre_the_print_store_join();
//
} /* end of [clear_print_board] */
//
function
Wormlike_anim()
{
//
return; // from [Wormlike_anim]
//
} // end of [Wormlike_anim]
//
jQuery(document).ready(function(){Wormlike__dynload(); Wormlike_anim();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Wormlike.dats] *)
