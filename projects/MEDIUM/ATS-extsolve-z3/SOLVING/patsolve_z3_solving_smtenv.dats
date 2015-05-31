(*
##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
##
*)

(* ****** ****** *)
//
#ifndef
PATSOLVE_Z3_SOLVING
#include "./myheader.hats"
#endif // end of [ifndef]
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

datavtype
smtenv =
SMTENV of (smtenv_struct)

where
smtenv_struct = @{
//
smtenv_solver= Z3_solver
,
smtenv_s2varlst = s2varlst_vt
,
smtenv_s2varlstlst = List0_vt(s2varlst_vt)
//
} (* end of [smtenv_struct] *)

(* ****** ****** *)

assume smtenv_vtype = smtenv
assume smtenv_push_v = unit_v

(* ****** ****** *)

extern
fun s2varlst_vt_free(s2varlst_vt): void

(* ****** ****** *)

implement
smtenv_pop
  (pf | env) = let
//
prval unit_v() = pf
//
val+@SMTENV(env_s) = env
//
val s2vs = env_s.smtenv_s2varlst
val ((*void*)) = s2varlst_vt_free(s2vs)
val-~list_vt_cons(s2vs, s2vss) = env_s.smtenv_s2varlstlst
//
val ((*void*)) = env_s.smtenv_s2varlst := s2vs
val ((*void*)) = env_s.smtenv_s2varlstlst := s2vss
//
prval ((*folded*)) = fold@(env)
//
in
  // nothing
end // end of [smtenv_pop]

(* ****** ****** *)

implement
smtenv_push
  (env) = let
//
val+@SMTENV(env_s) = env
//
val s2vs = env_s.smtenv_s2varlst
val s2vss = env_s.smtenv_s2varlstlst
//
val ((*void*)) = env_s.smtenv_s2varlst := nil_vt
val ((*void*)) = env_s.smtenv_s2varlstlst := cons_vt(s2vs, s2vss)
//
prval ((*folded*)) = fold@(env)
//
in
  (unit_v() | ())
end // end of [smtenv_push]

(* ****** ****** *)

(* end of [patsolve_z3_solving_smtenv.dats] *)
