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
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

#define NROW 64
#define NCOL 64

(* ****** ****** *)

abstype worm = ptr

(* ****** ****** *)
//
datatype
wnode =
  | WN of (int(*i*), int(*j*))
//
(* ****** ****** *)
//
datatype
xnode =
  | XN0 of () | XN1 of (int(*kind*))
//
(* ****** ****** *)
//
typedef
gamebd = mtrxszref(xnode)
//
typedef
printbd = mtrxszref(string)
//
(* ****** ****** *)

fun theWorm_get(): worm

(* ****** ****** *)

fun theGamebd_get(): gamebd

(* ****** ****** *)

fun thePrintbd_get(): printbd

(* ****** ****** *)

(* end of [Wormlike.sats] *)
