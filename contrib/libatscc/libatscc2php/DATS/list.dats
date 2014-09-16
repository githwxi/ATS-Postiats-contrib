(*
** For writing ATS code
** that translates into PHP
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2phppre_"
#define
ATS_STATIC_PREFIX "_ats2phppre_list_"
//
(* ****** ****** *)
//
staload "./../basics_php.sats"
staload "./../SATS/integer.sats"
//
(* ****** ****** *)

staload "./../SATS/list.sats"

(* ****** ****** *)

implement
list_length{a}(xs) = let
//
prval () = lemma_list_param (xs)
//
fun loop
  {i,j:nat} .<i>.
(
  xs: list (a, i), j: int j
) : int (i+j) = (
  case+ xs of
  | list_cons (_, xs) => loop (xs, j+1) | _ =>> j
) (* end of [loop] *)
//
in
  loop (xs, 0)
end // end of [list_length]

(* ****** ****** *)

implement
list_append
  (xs, ys) = let
//
prval () = lemma_list_param (xs)
prval () = lemma_list_param (ys)
//
in
//
case+ xs of
| list_nil () =>  ys
| list_cons (x, xs) =>
    list_cons (x, list_append (xs, ys))
  // end of [list_cons]
//
end // end of [list_append]

(* ****** ****** *)

implement
list_reverse{a}(xs) =
(
  list_reverse_append{a}(xs, list_nil(*void*))
) (* end of [list_reverse] *)

(* ****** ****** *)

implement
list_reverse_append
  {a}(xs, ys) = let
//
prval () = lemma_list_param (xs)
prval () = lemma_list_param (ys)
//
fun
loop{i,j:nat}
(
  xs: list(a, i), ys: list(a, j)
) : list(a, i+j) =
(
case+ xs of
| list_nil () => ys
| list_cons (x, xs) => loop (xs, list_cons (x, ys))
) (* end of [loop] *)
//
in
  loop (xs, ys)
end // end of [list_reverse_append]

(* ****** ****** *)

implement
list_map (xs, f) =
(
case+ xs of
| list_nil () => list_nil ()
| list_cons (x, xs) => list_cons (f(x), list_map (xs, f))
) (* end of [list_map] *)

(* ****** ****** *)

(* end of [list.dats] *)
