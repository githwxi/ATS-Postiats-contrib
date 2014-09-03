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
"{$LIBATSCC2PY}/SATS/integer.sats"
//
(* ****** ****** *)
//
extern fun f91 : int -> int = "mac#f91"
//
implement
f91 (x) = if x >= 101 then x - 10 else f91(f91(x+11))
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
  print(f91(int(sys.argv[1])))
else:
  print('Usage: f91 <integer>')
#endif
%} // end of [%{$]

(* ****** ****** *)

(* end of [f91.dats] *)
