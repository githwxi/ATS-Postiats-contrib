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

local

fun
aux_S3ITMsvar
(
  x0: jsonval
) : s3itm = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S3ITMsvar(parse_s2var(x))
end (* end of [aux_S3ITMsvar] *)

fun
aux_S3ITMsVar
(
  x0: jsonval
) : s3itm = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S3ITMsVar(parse_s2Var(x))
end (* end of [aux_S3ITMsVar] *)

fun
aux_S3ITMhypo
(
  x0: jsonval
) : s3itm = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S3ITMhypo(parse_h3ypo(x))
end (* end of [aux_S3ITMhypo] *)

fun
aux_S3ITMcnstr
(
  x0: jsonval
) : s3itm = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S3ITMcnstr(parse_c3nstr(x))
end (* end of [aux_S3ITMcnstr] *)

fun
aux_S3ITMcnstr_ref
(
  x0: jsonval
) : s3itm = let
//
val-JSONarray(xs) = x0
val-list_cons (x_loc, xs) = xs
val-list_cons (x_opt, xs) = xs
//
in
  S3ITMcnstr_ref(parse_location(x_loc), parse_c3nstropt(x_opt))
end (* end of [aux_S3ITMcnstropt] *)

(* ****** ****** *)

fun
aux_S3ITMdisj
(
  x0: jsonval
) : s3itm = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S3ITMdisj(parse_s3itmlstlst(x))
end // end of [aux_S3ITMdisj]

in (* in-of-local *)

implement
parse_s3itm
  (jsnv0) = let
//
(*
val () =
println!
  ("parse_s3itm: jsnv0 = ", jsnv0)
*)
//
val-JSONobject(lxs) = jsnv0
val () = assertloc(length(lxs) >= 1)
val+list_cons (lx, lxs) = lxs
//
val name = lx.0 and jsnv2 = lx.1
//
in
//
case+ name of
//
| "S3ITMsvar" => aux_S3ITMsvar(jsnv2)
//
| "S3ITMsVar" => aux_S3ITMsVar(jsnv2)
//
| "S3ITMhypo" => aux_S3ITMhypo(jsnv2)
//
| "S3ITMcnstr" => aux_S3ITMcnstr(jsnv2)
//
| "S3ITMcnstr_ref" => aux_S3ITMcnstr_ref(jsnv2)
//
| "S3ITMdisj" => aux_S3ITMdisj(jsnv2)
//
| _(*unrecognized*) =>
  let
    val () =
    prerrln!
      ("parse_s3itm: ", name)
    // end of [val]
    val ((*exit*)) = assertloc(false)
  in
    exit(1)
  end // end of [unrecognized]
//
end // end of [parse_s3itm]

end // end of [local]

(* ****** ****** *)

(* end of [patsolve_parsing_s3itm.dats] *)
