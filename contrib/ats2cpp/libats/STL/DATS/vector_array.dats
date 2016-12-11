(* ****** ****** *)

(*
** A linear array
** implementation based on STL:vector
*)

(* ****** ****** *)
(*
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremal: gmhwxiATgmailDOTcom
// Start Time: December, 2016
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

%{#
//
#ifndef \
ATS2CPP_LIBATS_STL_VECTOR_ARRAY_DATS
#define \
ATS2CPP_LIBATS_STL_VECTOR_ARRAY_DATS
//
#include \
"ats2cpp/libats/STL/CATS/vector.cats"
//
#endif // end of ifndef(ATS2CPP_LIBATS_STL_VECTOR_ARRAY_DATS)
//
%} // end of [%{#]

(* ****** ****** *)
//
absvtype
array_vtype
(a:vt@ype+, n:int) =
$extype"ats2cpp_STL_vectorptr"(a)
//
stadef array = array_vtype
//
vtypedef
array(a:vt@ype) = [n:int] array_vtype(a, n)
//
(* ****** ****** *)
//
extern
prfun
lemma_array_param
  {a:vt0p}{n:int}
  (A0: !array(INV(a), n)): [n >= 0] void
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
array_free
  {n:int}(A0: array(a, n)): void = "mac#%"
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
array_make_elt
  {n:int}
  (n: size_t(n), x0: a): array(a, n) = "mac#%"
//
(* ****** ****** *)
//
extern
fun
{a:vt0p}
array_length
  {n:int}
  (A0: !array(INV(a), n)): size_t(n) = "mac#%"
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
array_get_at
  {n:int}
(
  A0: !array(INV(a), n), i: sizeLt(n)
) : (a) = "mac#%" // end of [array_get_at]
//
extern
fun
{a:t@ype}
array_set_at
  {n:int}
(
  A0: !array(INV(a), n), i: sizeLt(n), x: a
) : void = "mac#%" // end of [array_set_at]
//
(* ****** ****** *)
//
overload [] with array_get_at
//
overload length with array_length
//
overload .size with array_length
overload .length with array_length
//
(* ****** ****** *)
//
// HX-2016-12:
// externally template-based implmentation
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_free
(
  A0
) = let
//
val p0 = $UN.castvwtp0{ptr}(A0)
//
in
//
$extfcall
  (void, "ats2cpp_STL_vectorptr_free", $tyrep(a), p0)
//
end // end of [array_free]
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
array_get_at
(
  A0, i
) = let
//
val p0 = $UN.castvwtp1{ptr}(A0)
//
in
//
$extfcall
  (a, "ats2cpp_STL_vectorptr_get_at", $tyrep(a), p0, i)
//
end // end of [array_get_at]
//
implement
{a}(*tmp*)
array_set_at
(
  A0, i, x
) = let
//
val p0 = $UN.castvwtp1{ptr}(A0)
//
in
//
$extfcall
  (void, "ats2cpp_STL_vectorptr_get_at", $tyrep(a), p0, i, x)
//
end // end of [array_set_at]
//
(* ****** ****** *)

(* end of [vector_array.dats] *)
