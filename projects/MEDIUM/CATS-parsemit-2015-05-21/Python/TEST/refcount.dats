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
#include
"{$LIBATSCC2PY}/staloadall.hats"
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
sys.setrecursionlimit(1000000)
######
#
from ats2pypre_basics_cats import *
#
from ats2pypre_integer_cats import *
#
from ats2pypre_string_cats import *
#
from ats2pypre_print_cats import *
#
from ats2pypre_PYlist_cats import *
#
from ats2pypre_reference_dats import *
#
######
%} // end of [%{^]

(* ****** ****** *)

%{$
refcount_dynload()
%} // end of [%{$]

(* ****** ****** *)

(* end of [refcount.dats] *)
