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

(*
implement
stream_nth_exn
  {a}(xs, n) = let
//
fun
loop
(
  xs: stream(a), n: intGte(0)
) : a =
(
case+ !xs of
| stream_cons
    (x, xs) =>
  (
    if n > 0 then loop (xs, pred(n)) else (x)
  )
| stream_nil () => $raise StreamSubscriptExn()
) (* end of [loop] *)
//
in
  loop (xs, n)
end // end of [stream_nth_exn]
*)

(* ****** ****** *)

implement
stream_map_cloref
  (xs, f) = $delay
(
//
case+ !xs of
| stream_nil () => stream_nil ()
| stream_cons (x, xs) =>
    stream_cons (f(x), stream_map_cloref(xs, f))
  // end of [stream_cons]
//
) (* end of [stream_map_cloref] *)

(* ****** ****** *)

implement
stream_filter_cloref
  (xs, pred) = $delay
(
//
case+ !xs of
| stream_nil
    ((*void*)) => stream_nil ()
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

(* ****** ****** *)

implement
stream_tabulate_cloref
  {a}(f) = let
//
fun
aux
(
  n: intGte(0)
) : stream(a) =
(
  $delay(stream_cons(f(n), aux(n+1)))
) (* end of [aux] *)
//
in
  aux(0)
end // end of [stream_tabulate_cloref]

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
