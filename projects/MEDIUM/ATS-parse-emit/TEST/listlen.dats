(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

implement
list_length<int>
  (xs) = let
//
prval () = lemma_list_param (xs)
//
fun
loop{i,j:nat} .<i>.
(
  xs: list (int, i), res: int(j)
) :<> int(i+j) = let
in
//
case+ xs of
| list_nil () => res | list_cons (_, xs) => loop (xs, res+1)
//
end // end of [loop]
//
in
  loop (xs, 0)
end // end of [list_length]

(* ****** ****** *)

implement
main0 () = () where
{
  val () = assertloc (list_length($list{int}(1,2,3)) = 3)
} (* end of [main0] *)

(* ****** ****** *)

(* end of [listlen.dats] *)
