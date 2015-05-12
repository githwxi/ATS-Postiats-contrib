(*
** ATS-extsolve:
** For solving ATS-constraints
** with external SMT-solvers
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "./patsolve_cnstrnt.sats"
//
(* ****** ****** *)

assume location_type = string

(* ****** ****** *)

implement
location_make (rep) = rep

(* ****** ****** *)

implement
fprint_location
  (out, loc) = fprint_string (out, loc)
// end of [fprint_location]

(* ****** ****** *)

(* end of [patsolve_cnstrnt_location.dats] *)
