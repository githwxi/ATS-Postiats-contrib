(*
** Training:
** Building decision trees
*)

(* ****** ****** *)
//
#staload
"./DecisionTree.dats"
//
(* ****** ****** *)
//
extern
fun{}
DecisionTree$point_guess_at
  (x0: point, f0: feature): guess
//
(* ****** ****** *)

implement
{}(*tmp*)
DecisionTree$test
  (dt, x0) =
  test(dt) where
{
//
fun
test
(
dt: dtree
) : guess =
(
case+ dt of
| dtree_leaf
    (g0) => g0
| dtree_node
    (f0, dt_neg, dt_pos) => let
    val g0 =
      DecisionTree$point_guess_at<>(x0, f0)
    // end of [val]
  in
    if g0 then test(dt_pos) else test(dt_neg)
  end // end of [dtree_node]
)
//
} (* end of [DecisionTree$test] *)

(* ****** ****** *)

(* end of [DecisionTree_test.dats] *)
