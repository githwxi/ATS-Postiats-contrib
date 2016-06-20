(*
** For writing ATS code
** that translates into Python3
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2pypre_"
#define
ATS_STATIC_PREFIX "_ats2pypre_matrixref_"
//
(* ****** ****** *)

%{^
######
from ats2pypre_basics_cats import *
######
from ats2pypre_bool_cats import *
from ats2pypre_integer_cats import *
######
from ats2pypre_PYlist_cats import *
######
from ats2pypre_intrange_dats import *
######
%} // end of [%{^]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../basics_py.sats"
//
staload "./../SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./../SATS/PYlist.sats"
staload "./../SATS/intrange.sats"
//
(* ****** ****** *)
//
staload "./../SATS/matrixref.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/matrixref.dats"
//
(* ****** ****** *)
//
(*
assume
matrixref_vt0ype_type(a, m, n) = PYlist(a)
*)
//
(* ****** ****** *)

%{^
######
def ats2pypre_matrixref_make_elt(m, n, x0):
  M = []
  i0 = 0
  mn = m * n
  while (i0 < mn): i0 = i0 + 1; M.append(x0)
  return M
######
%} // end of [%{^]

(* ****** ****** *)

implement
matrixref_get_at
  {a}(A, i, n, j) = let
  val A = $UN.cast{PYlist(a)}(A) in PYlist_get_at(A, i*n+j)
end // end of [matrixref_get_at]

(* ****** ****** *)

implement
matrixref_set_at
  {a}(A, i, n, j, x) = let
  val A = $UN.cast{PYlist(a)}(A) in PYlist_set_at(A, i*n+j, x)
end // end of [matrixref_set_at]

(* ****** ****** *)

%{^
######
def ats2pypre_mtrxszref_make_matrixref(M, m, n):
  return { 'matrix' : M, 'nrow' : m, 'ncol' : n }
######
def ats2pypre_mtrxszref_get_nrow(MSZ): return MSZ['nrow']
def ats2pypre_mtrxszref_get_ncol(MSZ): return MSZ['ncol']
######
def ats2pypre_mtrxszref_get_at(MSZ, i, j):
  nrow = MSZ['nrow']
  ncol = MSZ['ncol']
  if (i < 0): raise IndexError('mtrxszref_get_at')
  if (j < 0): raise IndexError('mtrxszref_get_at')
  if (i >= nrow): raise IndexError('mtrxszref_get_at')
  if (j >= ncol): raise IndexError('mtrxszref_get_at')
  return MSZ['matrix'][i*ncol+j]
######
def ats2pypre_mtrxszref_set_at(MSZ, i, j, x0):
  nrow = MSZ['nrow']
  ncol = MSZ['ncol']
  if (i < 0): raise IndexError('mtrxszref_set_at')
  if (j < 0): raise IndexError('mtrxszref_set_at')
  if (i >= nrow): raise IndexError('mtrxszref_set_at')
  if (j >= ncol): raise IndexError('mtrxszref_set_at')
  MSZ['matrix'][i*ncol+j] = x0; return#_void
######
%} // end of [%{^]

(* ****** ****** *)

(* end of [matrixref.dats] *)
