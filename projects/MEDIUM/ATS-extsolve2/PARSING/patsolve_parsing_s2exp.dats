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
extern
fun
parse_s2exp_node (jsonval): s2exp_node
//
(* ****** ****** *)

implement
parse_s2exp
  (jsnv0) = let
//
val () =
println!
(
  "parse_s2exp: jsnv0 = ", jsnv0
) (* end of [val] *)
//
val-JSONobject(lxs) = jsnv0
val () = assertloc(length(lxs) >= 2)
//
val+list_cons(lx, lxs) = lxs
val s2t = parse_s2rt (lx.1)
//
val+list_cons(lx, lxs) = lxs
val s2en = parse_s2exp_node (lx.1)
//
in
//
  s2exp_make_node (s2t, s2en)
//
end // end of [parse_s2exp]

(* ****** ****** *)

local

fun
aux_S2Eint
(
  x0: jsonval
) : s2exp_node = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S2Eint(parse_int(x))
end (* end of [aux_S2Eint] *)

fun
aux_S2Eintinf
(
  x0: jsonval
) : s2exp_node = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S2Eintinf(parse_string(x))
end (* end of [aux_S2Eintinf] *)

fun
aux_S2Ecst
(
  x0: jsonval
) : s2exp_node = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S2Ecst(parse_s2cst(x))
end (* end of [aux_S2Ecst] *)

fun
aux_S2Evar
(
  x0: jsonval
) : s2exp_node = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S2Evar(parse_s2var(x))
end (* end of [aux_S2Evar] *)

fun
aux_S2EVar
(
  x0: jsonval
) : s2exp_node = let
//
val-JSONarray(xs) = x0
val-list_cons (x, xs) = xs
//
in
  S2EVar(parse_s2Var(x))
end (* end of [aux_S2EVar] *)

in (* in-of-local *)

implement
parse_s2exp_node
  (jsnv0) = let
//
val-JSONobject(lxs) = jsnv0
//
val-list_cons (lx, lxs) = lxs
val name = lx.0 and jsnv2 = lx.1
//
in
//
case+ name of
//
| "S2Eint" => aux_S2Eint(jsnv2)
| "S2Eintinf" => aux_S2Eintinf(jsnv2)
//
| "S2Ecst" => aux_S2Ecst(jsnv2)
//
| "S2Evar" => aux_S2Evar(jsnv2)
//
| "S2EVar" => aux_S2EVar(jsnv2)
//
| _(*unrecognized*) => S2Eignored()
//
end // end of [parse_s2exp_node]

end // end of [local]

(* ****** ****** *)

(* end of [patsolve_parsing_s2exp.dats] *)
