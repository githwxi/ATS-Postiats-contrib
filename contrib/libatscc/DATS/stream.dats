(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/stream.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)
//
implement
stream_make_nil() =
  $delay(stream_nil())
//
implement
stream_make_sing(x0) =
  $delay(stream_cons(x0, stream_make_nil()))
//
(* ****** ****** *)

implement
stream_nth_opt
  {a}(xs, n) = let
//
fun
loop
(
  xs: stream(a), n: intGte(0)
) : Option_vt(a) =
(
case+ !xs of
| stream_nil
    () => None_vt()
  // stream_nil
| stream_cons
    (x, xs) =>
  (
    if n > 0
      then loop(xs, pred(n)) else Some_vt(x)
    // end of [if]
  )
) (* end of [loop] *)
//
in
  loop (xs, n)
end // end of [stream_nth_opt]

(* ****** ****** *)
//
implement
stream_takeLte
  (xs, n) = $delay
(
//
if
(n > 0)
then (
case+ !xs of
| stream_nil() =>
    stream_nil(*void*)
  // end of [stream_nil]
| stream_cons(x, xs) =>
    stream_cons(x, stream_takeLte(xs, n-1))
  // end of [stream_cons]
) (* end of [then] *)
else stream_nil() // else
//
) (* end of [stream_takeLte] *)
//
(* ****** ****** *)
//
implement
stream_dropLte
  (xs, n) = $delay
(
//
if
(n > 0)
then (
case+ !xs of
| stream_nil() => stream_nil(*void*)
| stream_cons(x, xs) => !(stream_dropLte(xs, n-1))
) (* end of [then] *)
else (!xs) // end of [else]
//
) (* end of [stream_dropLte] *)
//
(* ****** ****** *)

implement
stream_take_opt
  {a}{n}(xs, n) = let
//
fun
auxmain
{i:nat | i <= n}
(
  xs: stream(a), i: int(i), res: list(a, i)
) : Option_vt(list(a, n)) =
(
//
if
(i < n)
then (
  case+ !xs of
  | stream_nil() => None_vt()
  | stream_cons(x, xs) => auxmain(xs, i+1, list_cons(x, res))
) (* end of [then] *)
else Some_vt(list_reverse(res))
//
) (* end of [auxmain] *)
//
in
  auxmain(xs, 0, list_nil())
end // end of [stream_take_opt]

(* ****** ****** *)

implement
stream_drop_opt
  {a}{n}(xs, n) = let
//
fun
auxmain
{i:nat | i <= n}
(
  xs: stream(a), i: int(i)
) : Option_vt(stream(a)) =
(
//
if
(i < n)
then (
case+ !xs of
| stream_nil() => None_vt()
| stream_cons(x, xs) => auxmain(xs, i+1)
) (* end of [then] *)
else Some_vt(xs) // end of [else]
//
) (* end of [auxmain] *)
//
in
  auxmain(xs, 0(*i*))
end // end of [stream_drop_opt]

(* ****** ****** *)
//
implement
stream_map_cloref
  {a}(xs, fopr) = $delay
(
//
case+ !xs of
| stream_nil() => stream_nil()
| stream_cons(x, xs) =>
    stream_cons(fopr(x), stream_map_cloref(xs, fopr))
  // end of [stream_cons]
//
) (* end of [stream_map_cloref] *)
//
implement
stream_map_method
  {a}(xs, _) =
(
  lam(fopr) => stream_map_cloref{a}(xs, fopr)
)
//
(* ****** ****** *)
//
implement
stream_filter_cloref
  {a}(xs, pred) = $delay
(
//
case+ !xs of
| stream_nil
    ((*void*)) => stream_nil()
  // end of [stream_nil]
| stream_cons
    (x, xs) =>
  (
    if pred(x)
      then
      stream_cons (
        x, stream_filter_cloref(xs, pred)
      ) (* end of [then] *)
      else !(stream_filter_cloref(xs, pred))
    // end of [if]
  ) (* end of [stream_cons] *)
//
) (* end of [stream_filter_cloref] *)
//
implement
stream_filter_method
  {a}(xs) =
(
lam(pred) => stream_filter_cloref{a}(xs, pred)
) (* end of [stream_filter_method] *)
//
(* ****** ****** *)
//
implement
stream_foreach_cloref
  {a}(xs, fwork) =
(
case+ !xs of
| stream_nil() => ()
| stream_cons(x, xs) =>
  (
    fwork(x); stream_foreach_cloref(xs, fwork)
  ) (* end of [stream_cons] *)
) (* end of [stream_foreach_cloref] *)
//
implement
stream_foreach_method
  {a}(xs) =
(
  lam(fwork) => stream_foreach_cloref{a}(xs, fwork)
) (* end of [stream_foreach_method] *)
//
(* ****** ****** *)

implement
stream_tabulate_cloref
  {a}(fopr) = auxmain(0) where
{
//
fun
auxmain
(
  n: intGte(0)
) : stream(a) =
(
  $delay(stream_cons(fopr(n), auxmain(n+1)))
) (* end of [auxmain] *)
//
} (* end of [stream_tabulate_cloref] *)

(* ****** ****** *)

implement
cross_stream_list
  {a,b}(xs, ys) = let
//
fun
auxmain
(
  x0: a, xs: stream(a)
, ys: List0(b), zs: List0(b)
) : stream($tup(a, b)) = $delay
(
  case+ zs of
  | list_nil() =>
      !(cross_stream_list(xs, ys))
  | list_cons(z0, zs) =>
      stream_cons(
        $tup(x0, z0), auxmain(x0, xs, ys, zs)
      ) (* stream_cons *)
) (* end of [auxmain] *)
//
in
//
$delay(
case !xs of
| stream_nil() => stream_nil()
| stream_cons(x, xs) => !(auxmain(x, xs, ys, ys))
) (* $delay *)
//
end // end of [cross_stream_list]

(* ****** ****** *)
//
implement
cross_stream_list0
  (xs, ys) =
  cross_stream_list(xs, g1ofg0(ys))
//
(* ****** ****** *)

implement
stream2cloref_exn
  {a}(xs) = let
//
val rxs =
  ref{stream(a)}(xs)
//
in
//
lam() => let
//
val xs = rxs[]
val-stream_cons(x, xs) = !xs
//
in
  rxs[] := xs; x
end // end of [lam]
//
end // end of [stream2cloref_exn]

(* ****** ****** *)

implement
stream2cloref_opt
  {a}(xs) = let
//
val rxs =
  ref{stream(a)}(xs)
//
in
//
lam() => let
  val xs = rxs[]
in
  case+ !xs of
  | stream_nil() => None_vt()
  | stream_cons(x, xs) => (rxs[] := xs; Some_vt(x))
end // end of [lam]
//
end // end of [stream2cloref_opt]

(* ****** ****** *)

implement
stream2cloref_last
  {a}(xs, x0) = let
//
val rxs =
  ref{stream(a)}(xs)
//
val rx0 = ref{a}(x0)
//
in
//
lam() => let
  val xs = rxs[]
in
  case+ !xs of
  | stream_nil
      () => rx0[]
    // end of [stream_nil]
  | stream_cons
      (x1, xs2) => (rxs[] := xs2; rx0[] := x1; x1)
    // end of [stream_cons]
end // end of [lam]
//
end // end of [stream2cloref]

(* ****** ****** *)

(* end of [stream.dats] *)
