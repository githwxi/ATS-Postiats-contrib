(* ****** ****** *)
//
// HX-2014-08:
// A running example
// from ATS2 to Python3
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PY}/basics_py.sats"
staload
"{$LIBATSCC2PY}/SATS/integer.sats"
staload
"{$LIBATSCC2PY}/SATS/string.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "fact_dynload"
//
(* ****** ****** *)
//
extern
fun fact : int -> int = "mac#fact"
//
implement
fact (n) = if n > 0 then n * fact(n-1) else 1
//
(* ****** ****** *)
//
val N = 10
val () = println! ("fact(", N, ") = ", fact(N))
//
(* ****** ****** *)

%{^
import sys
######
from basics_cats import *
from integer_cats import *
from string_cats import *
######
sys.setrecursionlimit(1000000)
%} // end of [%{^]

(* ****** ****** *)

%{$
fact_dynload()
%} // end of [%{$]

(* ****** ****** *)

(* end of [fact.dats] *)
