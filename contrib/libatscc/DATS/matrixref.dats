(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/matrixref.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)

implement
matrixref_foreach_cloref
  {a}{m,n}(A, m, n, f) = let
//
fnx
loop
{i:nat}
(i: int(i)): void =
(
  if i < m then loop2(i, 0) else ()
) (* end of [loop] *)
//
and
loop2
{i,j:nat | i < m}
(i: int(i), j: int(j)): void =
(
  if j < n then (f(i, j); loop2(i, j+1)) else loop(i+1)
)
//
in
  loop(0)
end // end of [matrixref_foreach_cloref]

(* ****** ****** *)

(* end of [matrixref.dats] *)
