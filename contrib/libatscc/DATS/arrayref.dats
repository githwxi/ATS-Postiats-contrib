(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/arrayref.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)

implement
arrayref_forall_cloref
  (A, n, f) = let
//
fun
loop
{i:nat}
(i: int(i)) : bool =
(
//
if i < n
  then (
    if f(i) then loop(i+1) else false
  ) else true
// end of [if]
//
) (* end of [loop] *)
//
in
  loop(0)
end // end of [arrayref_forall_cloref]

(* ****** ****** *)

implement
arrayref_foreach_cloref
  (A, n, f) = let
//
fun
loop
{i:nat}
(i: int(i)) : void =
(
  if i < n
    then (f(i); loop(i+1)) else ((*void*))
  // end of [if]
) (* end of [loop] *)
//
in
  loop(0)
end // end of [arrayref_foreach_cloref]

(* ****** ****** *)

implement
arrszref_foreach_cloref
  {a}(A, f) = let
//
val [n:int] n = arrszref_size(A)
//
fun
loop
{ i:nat
| i <= n
} .<n-i>.
(
  i: int(i)
) : void =
(
  if i < n
    then (f(i); loop(i+1)) else ()
  // end of [if]
) (* end of [loop] *)
//
in
  loop(0)
end // end of [arrszref_foreach_cloref]

(* ****** ****** *)

(* end of [arrayref.dats] *)
