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
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PY}/basics_py.sats"
staload
"{$LIBATSCC2PY}/SATS/integer.sats"
staload
"{$LIBATSCC2PY}/SATS/string.sats"
staload
"{$LIBATSCC2PY}/SATS/reference.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "refcount_dynload"
//
(* ****** ****** *)
//
extern
fun
refcount : () -> int = "mac#refcount"
//
local
//
val theCount = ref{int}(0)
//
in
//
implement
refcount () = let
  val n = theCount[]; val () = theCount[] := n+1 in n
end // end of [refcount]
//
end // end of [local]

(* ****** ****** *)

val () = println! ("refcount() = ", refcount())
val () = println! ("refcount() = ", refcount())
val () = println! ("refcount() = ", refcount())
val () = println! ("refcount() = ", refcount())
val () = println! ("refcount() = ", refcount())

(* ****** ****** *)

%{^
import sys
######
#
from prelude_basics_cats import *
#
from prelude_integer_cats import *
from prelude_string_cats import *
#
from prelude_PYlist_cats import *
#
from prelude_reference_dats import *
#
######
sys.setrecursionlimit(1000000)
%} // end of [%{^]

(* ****** ****** *)

%{$
refcount_dynload()
%} // end of [%{$]

(* ****** ****** *)

(* end of [fib.dats] *)
