(*
** For writing ATS code
** that translates into Javascript
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_"
#define
ATS_STATIC_PREFIX "_ats2jspre_arrayref_"
//
(* ****** ****** *)
//
staload UN =
  "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../basics_js.sats"
//
staload "./../SATS/integer.sats"
//
staload "./../SATS/JSarray.sats"
//
(* ****** ****** *)
//
staload "./../SATS/arrayref.sats"
//
(* ****** ****** *)
//
(*
assume
arrayref_vt0ype_type(a, n) = JSarray(a)
*)
//
(* ****** ****** *)

%{^
//
function
ats2jspre_arrayref_make_elt
  (n, x)
{
  var A, i;
  A = new Array(n);
  for (i = 0; i < n; i += 1) A[i] = x;
  return A;
}
//
%} // end of [%{^]

(* ****** ****** *)

implement
arrayref_get_at
  {a}(A, i) = let
  val A = $UN.cast{JSarray(a)}(A) in JSarray_get_at(A, i)
end // end of [arrayref_get_at]

(* ****** ****** *)

implement
arrayref_set_at
  {a}(A, i, x) = let
  val A = $UN.cast{JSarray(a)}(A) in JSarray_set_at(A, i, x)
end // end of [arrayref_set_at]

(* ****** ****** *)

implement
arrayref_foreach_cloref
  {a}(A, n, f) = let
//
fun
loop
{i:nat}
(
  i: int(i)
) : void =
(
  if i < n
    then (f(i); loop(i+1)) else ()
  // end of [if]
) (* end of [loop] *)
in
  loop(0)
end // end of [arrayref_foreach_cloref]

(* ****** ****** *)

(* end of [arrayref.dats] *)
