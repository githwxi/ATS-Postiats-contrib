(* ****** ****** *)
(*
** Decision trees:
** DecisionTree$train
*)
(* ****** ****** *)
//
#staload
"./DecisionTree.dats"
//
(* ****** ****** *)

implement
{}(*tmp*)
DecisionTree$train
  (xs, fs) =
  train(xs, fs) where
{
//
fun
train
(
xs: points, fs: features
) : dtree = let
//
val
opt =
DecisionTree$choose_max(xs, fs)
//
in
//
case+ opt of
| ~None_vt() =>
  dtree_leaf
    (DecisionTree$guess(xs))
  // end of [None_vt]
| ~Some_vt(f0) => let
    val fs =
    DecisionTree$features_remove<>
        (fs, f0)
    // end of [val]
    val
    (xs_neg, xs_pos) =
    DecisionTree$data_split_at<>(xs, f0)
//
    val dt_neg = train(xs_neg, fs)
    val dt_pos = train(xs_pos, fs)
//
  in
    dtree_node(f0, dt_neg, dt_pos)
  end // end of [Some_vt]
//
end // end of [train]
//
} (* end of [DecisionTree$train] *)

(* ****** ****** *)

(* end of [DecisionTree_train.dats] *)
