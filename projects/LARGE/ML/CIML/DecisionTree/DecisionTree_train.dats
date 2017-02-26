(*
** Training:
** Building decision trees
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

abstype data_type
typedef data = data_type

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
DecisionTree$guess
  (xs: data): guess
extern
fun{}
DecisionTree$data_split_at
  (xs: data, f: feature): (data, data)
//
(* ****** ****** *)
//
extern
fun{}
DecisionTree$score
  (data, feature): intGte(0)
//
extern
fun{}
DecisionTree$choose_max
  (data, features): Option_vt(feature)
//
(* ****** ****** *)
//
extern
fun{}
DecisionTree$features_remove
  (fs: features, f: feature): features
//
(* ****** ****** *)
//
extern
fun{}
DecisionTree$train(data, features): dtree
//
(* ****** ****** *)

implement
{}(*tmp*)
DecisionTree$train
  (data, fs) = let
//
val opt = DecisionTree$choose_max(data, fs)
//
in
//
case+ opt of
| ~None_vt() =>
  dtree_leaf
  (
    DecisionTree$guess(data)
  ) // end of [None_vt]
| ~Some_vt(f) => let
    val fs =
      DecisionTree$features_remove(fs, f)
    // end of [val]
    val (
      data_neg, data_pos
    ) = DecisionTree$data_split_at(data, f)
    val dtree_neg =
      DecisionTree$train(data_neg, fs)
    val dtree_pos =
      DecisionTree$train(data_pos, fs)
  in
    dtree_node(f, dtree_neg, dtree_pos)
  end // end of [Some_vt]
//
end // end of [DecisionTree$train]

(* ****** ****** *)

(* end of [DecisionTree_train.dats] *)
