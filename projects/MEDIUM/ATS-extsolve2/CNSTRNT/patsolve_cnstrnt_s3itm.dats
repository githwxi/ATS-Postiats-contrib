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

implement
fprint_s3itm
  (out, s3i) =
(
//
case s3i of
| S3ITMsvar(s2v) => fprintln! (out, "S3ITMsvar(", s2v, ")")
| S3ITMhypo(h3p) => fprintln! (out, "S3ITMhypo(", h3p, ")")
| S3ITMsVar(s2V) => fprintln! (out, "S3ITMsVar(", s2V, ")")
| S3ITMcnstr(c3t) => fprintln! (out, "S3ITMcnstr(", c3t, ")")
| S3ITMcnstr_ref(loc, opt) => fprintln! (out, "S3ITMcnstr_ref(", opt, ")")
| S3ITMdisj (s3iss) => fprintln! (out, "S3ITMdisj(", s3iss, ")")
//
) (* end of [fprint_s3itm] *)

(* ****** ****** *)
//
implement
fprint_s3itmlst
  (out, xs) = fprint_list_sep (out, xs, ", ")
//
(* ****** ****** *)
//
implement
fprint_s3itmlstlst
  (out, xss) = fprint_listlist_sep (out, xss, "; ", ", ")
//
(* ****** ****** *)

(* end of [patsolve_cnstrnt_s3itm.dats] *)
