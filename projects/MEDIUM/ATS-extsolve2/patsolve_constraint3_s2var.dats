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
staload UN =
"prelude/SATS/unsafe.sats"
//
staload
"./patsolve_constraint3.sats"
//
(* ****** ****** *)

typedef
s2var_struct = @{
  s2var_srt= s2rt
, s2var_name= symbol
, s2var_stamp= stamp
} (* end of [s2var_struct] *)

(* ****** ****** *)

local
//
assume
s2var_type =
  ref (s2var_struct)
//
in (* in of [local] *)

implement
s2var_make
  (srt, name, stamp) = let
//
val [l:addr] (
  pfat, pfgc | p
) = ptr_alloc<s2var_struct> ()
//
val () = p->s2var_srt := srt
val () = p->s2var_name := name
val () = p->s2var_stamp := stamp
//
in
  $UN.castvwtp0{s2var}((pfat, pfgc | p))
end // end of [s2var_make]

end // end of [local]

(* ****** ****** *)

(* end of [patsolve_constraint3_s2var.dats] *)
