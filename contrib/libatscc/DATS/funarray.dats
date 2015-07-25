(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/funarray.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)

datatype
brauntree
  (a:t@ype+, int) =
  | E (a, 0) of ()
  | {n1,n2:nat | n2 <= n1; n1 <= n2+1}
    B (a, n1+n2+1) of (a, brauntree (a, n1), brauntree (a, n2))
// end of [brauntree]

stadef bt = brauntree

(* ****** ****** *)
//
assume
funarray_t0ype_int_type
  (a:t@ype, n:int) = brauntree(a, n)
//
(* ****** ****** *)

implement
funarray_make_nil((*void*)) = E(*void*)

(* ****** ****** *)

implement
funarray_size
  {a}(A) = let
//
fun
diff
{ nl,nr:nat
| nr <= nl && nl <= nr+1
} .<nr>. 
(
  nr: int(nr), t0: bt (a, nl)
) : int (nl-nr) =
(
case+ t0 of
| E () => 0
| B (_, tl, tr) =>
   if nr > 0
     then let
       val nr2 = nr / 2
     in
       if nr > nr2 + nr2 then diff (nr2, tl) else diff (nr2-1, tr)
     end // end of [then]
     else 1 // end of [else]
  // end of [diff]
) (* end of [diff] *)
//
fun
size
{n:nat} .<n>.
(
  t0: bt (a, n)
) : int(n) =
(
case+ t0 of
| E () => 0
| B (_, tl, tr) => let
    val nr = size(tr)
    val d1 = 1 + diff(nr, tl)
  in
    2 * nr + d1
  end // end of [B]
  // end of [size]
) (* end of [size] *)
//
val () = lemma_funarray_param(A)
//
in
  size(A)
end // end of [funarray_size]
//
(* ****** ****** *)

implement
funarray_get_at
  {a}{n}(A, i) = let
//
fun
get_at
{
n,i:nat| i < n
} .<n>.
(
  t0: bt (a, n), i: int i
) : a =
(
if
i > 0
then let
  val i2 = i / 2
in
  if i > i2 + i2
    then let
      val+B(_, tl, _) = t0 in get_at (tl, i2)
    end // end of [then]
    else let
      val+B(_, _, tr) = t0 in get_at (tr, i2-1)
    end // end of [else]
end // end of [then]
else let
  val+B(x, _, _) = t0 in x
end // end of [else]
) (* end of [get_at] *)
//
in
  get_at(A, i)
end // end of [funarray_get_at]

(* ****** ****** *)

implement
funarray_set_at
  {a}{n}(A, i, x0) = let
//
fun
set_at
{
  n,i:nat | i < n
} .<n>.
(
  t0: bt (a, n), i: int i, x0: a
) : bt (a, n) =
(
if
i > 0
then let
  val i2 = i / 2
  val+B(x, tl, tr) = t0
in
  if i > i2 + i2
    then B(x, set_at (tl, i2, x0), tr)
    else B(x, tl, set_at (tr, i2-1, x0))
  // end of [if]
end // end of [then]
else let
  val+B(_, t1, t2) = t0 in B(x0, t1, t2)
end // end of [else]
//
) (* end of [set_at] *)
//
in
  set_at(A, i, x0)
end // end of [funarray_set_at]

(* ****** ****** *)

(* end of [funarray.dats] *)
