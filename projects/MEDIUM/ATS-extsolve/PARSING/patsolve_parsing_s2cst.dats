(*
** ATS-extsolve:
** For solving ATS-constraints
** with external SMT-solvers
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** Start time: May, 2015
*)

(* ****** ****** *)

local

typedef
key = stamp and itm = s2cst

in (* in-of-local *)

#include "libats/ML/HATS/myhashtblref.hats"

end // end of [local]

(* ****** ****** *)

local

val
the_s2cstmap =
myhashtbl_make_nil(1024)

in (* in-of-local *)
//
implement
the_s2cstmap_search(key) =
  myhashtbl_search(the_s2cstmap, key)
//
implement
the_s2cstmap_insert(s2c) =
{
//
val-
~None_vt() =
myhashtbl_insert(the_s2cstmap, s2c.stamp(), s2c)
//
} (* end of [the_s2cstmap_insert] *)
//
end // end of [local]

(* ****** ****** *)

implement
parse_s2cst
  (jsnv0) = let
//
(*
val () =
println!
(
  "parse_s2cst: jsnv0 = ", jsnv0
) (* end of [val] *)
*)
//
val-
~Some_vt
  (jsnv) = jsnv0["s2cst_stamp"]
//
val stamp = parse_stamp (jsnv)
//
val s2copt = the_s2cstmap_search (stamp)
//
in
//
case+ s2copt of
| ~Some_vt(s2c) => s2c
| ~None_vt((*void*)) => s2c where
  {
    val-JSONobject(lxs) = jsnv0
    val () = assertloc(length(lxs) >= 5)
//
    val+list_cons(lx, lxs) = lxs
    val sym = parse_symbol (lx.1)
//
    val+list_cons(lx, lxs) = lxs
    val s2t = parse_s2rt (lx.1)
//
    val+list_cons(lx, lxs) = lxs
    val () = the_stamp_update (stamp)
//
    val+list_cons(lx, lxs) = lxs
    val supcls = parse_s2explst (lx.1)
//
    val s2c = s2cst_make (sym, s2t, stamp)
//
(*
    val ((*void*)) =
      println! ("parse_s2cst: s2c = ", s2c)
    // end of [val]
*)
//
    val ((*void*)) = the_s2cstmap_insert (s2c)
//
  } (* end of [None_vt] *)
//
end // end of [parse_s2cst]

(* ****** ****** *)

(* end of [patsolve_parsing_s2cst.dats] *)
