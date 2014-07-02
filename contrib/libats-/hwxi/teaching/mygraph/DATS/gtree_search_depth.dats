(*
** HX-2014-07:
** A generic implementation of
** tree-based depth-first search
*)

(* ****** ****** *)

staload
"libats/ML/SATS/basis.sats"
staload
"libats/ML/SATS/list0.sats"
//
staload
_ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)
//
staload "./../SATS/gtree.sats"
//
(* ****** ****** *)

extern
fun{}
search_depth (node): void

extern
fun{}
searchlst_depth (nodelst): void

(* ****** ****** *)

extern
fun{}
search_process (node): bool

(* ****** ****** *)
//
implement
{}(*tmp*)
search_depth (nx) = let
  val cont = search_process (nx)
in
  if cont then searchlst_depth (node_get_children (nx)) else ()
end // end of [search_depth]
//
(* ****** ****** *)

implement
{}(*tmp*)
searchlst_depth
  (nxs) = let
in
//
case+ nxs of
| nil0 () => ()
| cons0 (nx, nxs) => let
    val cont = search_process (nx)
  in
    searchlst_depth (if cont then node_get_children(nx)+nxs else nxs)
  end // end of [cons2]
//
end // end of [searchlst_depth]

(* ****** ****** *)

(* end of [gtree_search_depth.sats] *)
