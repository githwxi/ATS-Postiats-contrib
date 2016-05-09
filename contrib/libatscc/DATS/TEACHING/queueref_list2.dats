(* ****** ****** *)
(*
//
// for teaching purpose
//
*)
(* ****** ****** *)
//
staload
"./../../basics.sats"
//
staload "./../ML/list0.sats"
//
(* ****** ****** *)
//
datatype
queueref(a:t@ype) =
QUEUEREF of
  (ref(list0(a)), ref(list0(a)))
//
(* ****** ****** *)

extern
fun
{a:t@ype}
queueref_make_nil(): queueref(a)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
queueref_enqueue
  (que: queueref(a), x0: a): void
//
extern
fun
{a:t@ype}
queueref_enqueue_list
  (que: queueref(a), xs: list0(a)): void
//
(* ****** ****** *)

extern
fun
{a:t@ype}
queueref_dequeue_opt(que: queueref(a)): Option(a)

(* ****** ****** *)

implement
{a}
queueref_make_nil
  () = let
//
val left = ref<list0(a)>(list0_nil)
val right = ref<list0(a)>(list0_nil)
//
in
  QUEUEREF(left, right)
end // end of [queueref_make_nil]

(* ****** ****** *)

implement
{a}(*tmp*)
queueref_enqueue
  (que, x0) = let
//
val QUEUEREF(left, right) = que
//
in
  !left := list0_cons(x0, !left)
end // end of [queueref_enqueue]

(* ****** ****** *)

implement
{a}(*tmp*)
queueref_enqueue_list
  (que, xs) = let
//
val QUEUEREF(left, right) = que
//
in
  !left := list0_reverse_append(xs, !left)
end // end of [queueref_enqueue_list]

(* ****** ****** *)

implement
{a}(*tmp*)
queueref_dequeue_opt
  (que) = let
//
val QUEUEREF(left, right) = que
//
in
//
case+ !right of
| list0_nil() => let
    val ys = !left
    val () = !left := list0_nil()
    val ys = list0_reverse(ys)
  in
    case+ ys of
    | list0_nil() => None()
    | list0_cons
        (y, ys) => (!right := ys; Some(y))
      // list0_cons
  end // end of [list0_nil]
| list0_cons(y, ys) => (!right := ys; Some(y))
//
end // end of [queueref_dequeue_opt]

(* ****** ****** *)

(* end of [queueref.dats] *)
