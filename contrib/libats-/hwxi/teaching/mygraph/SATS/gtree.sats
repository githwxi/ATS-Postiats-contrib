(*
** HX-2014-06:
** for implementing tree-based algorithms
*)

(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)
//
abstype node_type = ptr
typedef node = node_type
//
abstype nodeset_type = ptr
typedef nodeset = nodeset_type
//
(* ****** ****** *)

typedef nodelst = list0 (node)

(* ****** ****** *)

fun{}
node_get_children (node): nodelst

(* ****** ****** *)

(* end of [gtree.sats] *)
