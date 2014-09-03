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

staload
"{$LIBATSCC2PY}/SATS/integer.sats"

(* ****** ****** *)
//
fnx isevn_ (n: int): bool =
  if n > 0 then isodd_(n-1) else true
and isodd_ (n: int): bool =
  if n > 0 then isevn_(n-1) else false
//
(* ****** ****** *)
//
extern
fun isevn
  : (int) -> bool = "mac#isevn"
extern
fun isodd
  : (int) -> bool = "mac#isodd"
//
implement isevn (x) = isevn_(x)
implement isodd (x) = if x > 0 then isevn_(x-1) else false
//
(* ****** ****** *)

%{^
import sys
sys.setrecursionlimit(1000000)
######
from ats2pypre_basics_cats import *
from ats2pypre_integer_cats import *
######
%} // end of [%{^]

(* ****** ****** *)

%{$
if (len(sys.argv) >= 2):
  print(isevn(int(sys.argv[1])))
  print(isodd(int(sys.argv[1])))
else:
  print('Usage: isevn <integer>')
#endif
%} // end of [%{$]

(* ****** ****** *)

(* end of [isevn.dats] *)
