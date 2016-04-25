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
//
#include
"share/atspre_define.hats"
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

staload "./Wormlike.sats"

(* ****** ****** *)
//
implement
theWormlike_scene1
  ((*void*)) = let
//
val G = theGamebd_get()
//
in
//
G.foreach
(
lam(i, j) =>
if (i = j) then
(
  if i >= NCOL/8 then if i < 7*NCOL/8 then G[i,j] := XN1(~1)
) (* end of [if] *)
)
//
;
//
G.foreach
(
lam(i, j) =>
if (i = j) then
(
  if i >= NCOL/8 then if i < 7*NCOL/8 then G[i,NROW-1-j] := XN1(~1)
) (* end of [if] *)
)
//
end // end of [theWormlike_scene1]
//
(* ****** ****** *)
//
implement
theWormlike_scene2
  ((*void*)) = let
//
val G = theGamebd_get()
//
in
//
G.foreach
(
lam(i, j) =>
(
  if i >= NCOL/8 then if i < 7*NCOL/8 then
  if j >= NROW/8 then if j < 7*NROW/8 then G[i,j] := XN1(~1)  
) (* end of [lam] *)
)
//
end // end of [theWormlike_scene2]
//
(* ****** ****** *)

(* end of [Wormlist_config.dats] *)
