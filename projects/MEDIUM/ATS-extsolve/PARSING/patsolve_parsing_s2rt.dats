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
aux_S2RTbas
(
  x0: jsonval
) : s2rt = let
//
val-JSONarray(xs) = x0
val () = assertloc(length(xs) >= 1)
//
val-JSONstring(name) = xs[0]
//
in
//
case+ name of
| "int" => S2RTint()
| "addr" => S2RTaddr()
| "bool" => S2RTbool()
//
| "type" => S2RTtype()
| "t@ype" => S2RTt0ype()
| "t0ype" => S2RTt0ype()
//
| "viewtype" => S2RTvtype()
| "viewt@ype" => S2RTvt0ype()
| "viewt0ype" => S2RTvt0ype()
//
| _(*rest*) => S2RTnamed(symbol_make_name(name))
//
end // end of [aux_S2RTbas]

fun
aux_S2RTfun
(
  x0: jsonval
) : s2rt = let
//
val-JSONarray(xs) = x0
val () = assertloc (length(xs) >= 2)
//
val arg =
  parse_s2rtlst (xs[0])
//
val res = parse_s2rt (xs[1])
//
in
  S2RTfun (arg, res)
end // end of [aux_S2RTfun]

in (* in-of-local *)

implement
parse_s2rt
  (jsnv0) = let
//
val-
JSONobject(lxs) = jsnv0
//
val-
list_cons (lx, lxs) = lxs
//
in
//
case+ lx.0 of
//
| "S2RTbas" => aux_S2RTbas (lx.1)
//
| "S2RTfun" => aux_S2RTfun (lx.1)
//
| _(*rest-of-S2RT*) => S2RTignored((*void*))
//
end // end of [parse_s2rt]

end // end of [local]

(* ****** ****** *)

(* end of [patsolve_parsing_s2rt.dats] *)
