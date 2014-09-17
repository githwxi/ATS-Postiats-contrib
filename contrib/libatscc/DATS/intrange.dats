(*
** libatscc-common
*)

(* ****** ****** *)

(*
staload "./../basics.sats"
staload "./../SATS/intrange.sats"
*)

(* ****** ****** *)
//
implement
int_repeat_lazy
  (n, f) =
  int_repeat_cloref (n, lazy2cloref(f))
//
(* ****** ****** *)

implement
int_repeat_cloref
  (n, f) = let
//
fun
loop
(
  n: int, f: cfun0(void)
) : void = (
//
if n > 0
  then let val () = f () in loop (n-1, f) end
  else ()
//
) (* end of [loop] *)
//
in
  loop (n, f)
end // end of [int_repeat_cloref]

(* ****** ****** *)
//
implement
int_foreach_cloref
  (n, f) = intrange_foreach_cloref (0, n, f)
//
(* ****** ****** *)

implement
intrange_foreach_cloref
  (l, r, f) = let
//
fun
loop
(
  l: int, r: int, f: cfun1(int, void)
) : void = (
//
if l < r
  then let val () = f (l) in loop (l+1, r, f) end
  else ()
//
) (* end of [loop] *)
//
in
  loop (l, r, f)
end // end of [intrange_foreach_cloref]

(* ****** ****** *)

(* end of [intrange.dats] *)
