(*
##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
##
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#define
PATSOLVE_targetloc "./.ATS-extsolve"
//
(* ****** ****** *)
//
staload
"{$PATSOLVE}/patsolve_cnstrnt.sats"
staload
"{$PATSOLVE}/patsolve_parsing.sats"
//
(* ****** ****** *)
//
staload "./patsolve_z3_solving.sats"
//
(* ****** ****** *)

(* end of [patsolve_z3_solving.dats] *)
