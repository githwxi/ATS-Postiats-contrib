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
matrixref_forall_cloref
  {a}{m,n}(A, m, n, f) = let
//
fnx
loop
{i:nat}
(i: int(i)): bool =
(
  if i < m then loop2(i, 0) else true
) (* end of [loop] *)
//
and
loop2
{i,j:nat | i < m}
(i: int(i), j: int(j)): bool =
(
if j < n
  then (if f(i, j) then loop2(i, j+1) else false)
  else loop(i+1)
) (* end of [loop2] *)
//
in
  loop(0)
end // end of [matrixref_forall_cloref]

(* ****** ****** *)

implement
matrixref_exists_cloref
  {a}{m,n}(A, m, n, f) = let
//
fnx
loop
{i:nat}
(i: int(i)): bool =
(
  if i < m then loop2(i, 0) else false
) (* end of [loop] *)
//
and
loop2
{i,j:nat | i < m}
(i: int(i), j: int(j)): bool =
(
if j < n
  then (if f(i, j) then true else loop2(i, j+1))
  else loop(i+1)
) (* end of [loop2] *)
//
in
  loop(0)
end // end of [matrixref_exists_cloref]

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
) (* end of [loop2] *)
//
in
  loop(0)
end // end of [matrixref_foreach_cloref]

(* ****** ****** *)

(* end of [matrixref.dats] *)
