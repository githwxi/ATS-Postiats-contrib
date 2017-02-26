(*
** Training:
** Building decision trees
*)

(* ****** ****** *)
//
abstype point_type
typedef point = point_type
//
abstype points_type
typedef points = points_type
//
(* ****** ****** *)
//
typedef guess = bool
//
abstype feature_type = ptr
typedef feature = feature_type
//
abstype features_type = ptr
typedef features = features_type
//
(* ****** ****** *)
//
datatype dtree =
  | dtree_leaf of (guess)
  | dtree_node of (feature, dtree, dtree)
//
(* ****** ****** *)
//
extern
fun{}
DecisionTree$test
  (dt: dtree, x0: point): guess
//
(* ****** ****** *)
//
extern
fun{}
DecisionTree$train
  (xs: points, fs: features): dtree
//
(* ****** ****** *)
//
extern
fun{}
DecisionTree$guess
  (xs: points): guess
extern
fun{}
DecisionTree$data_split_at
  (xs: points, f: feature): (points, points)
//
(* ****** ****** *)
//
extern
fun{}
DecisionTree$score
  (xs: points, f: feature): intGte(0)
//
extern
fun{}
DecisionTree$choose_max
  (xs: points, fs: features): Option_vt(feature)
//
(* ****** ****** *)
//
extern
fun{}
DecisionTree$features_remove
  (fs: features, f: feature): features
//
(* ****** ****** *)

(* end of [DecisionTree.dats] *)
