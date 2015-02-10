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
ATS_STATIC_PREFIX "_ats2jspre_matrixref_"
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
staload "./../SATS/matrixref.sats"
//
(* ****** ****** *)
//
(*
assume
matrixref_vt0ype_type(a, n) = JSarray(a)
*)
//
(* ****** ****** *)

%{^
//
function
ats2jspre_matrixref_make_elt
  (m, n, x)
{
  var A, i, j;
  A = new Array(m*n);
  for (i = 0; i < m; i += 1)
  {
    for (j = 0; j < n; j += 1) A[i*n+j] = x;
  }
  return A;
}
//
%} // end of [%{^]

(* ****** ****** *)

implement
matrixref_get_at
  {a}(A, i, n, j) = let
  val A = $UN.cast{JSarray(a)}(A) in JSarray_get_at(A, i*n+j)
end // end of [matrixref_get_at]

(* ****** ****** *)

implement
matrixref_set_at
  {a}(A, i, n, j, x) = let
  val A = $UN.cast{JSarray(a)}(A) in JSarray_set_at(A, i*n+j, x)
end // end of [matrixref_set_at]

(* ****** ****** *)

(* end of [matrixref.dats] *)
