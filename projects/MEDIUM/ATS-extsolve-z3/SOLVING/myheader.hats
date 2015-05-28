(*
##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
##
*)

(* ****** ****** *)
//
#define
PATSOLVE_targetloc
"./../.ATS-extsolve"
//
staload
"{$PATSOLVE}/patsolve_cnstrnt.sats"
//
(* ****** ****** *)
//
staload "./../patsolve_z3_solving.sats"
//
(* ****** ****** *)

(* end of [myheader.hats] *)
