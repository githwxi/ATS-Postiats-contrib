(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
"./../prelude/SATS/integer.sats"

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
//
implement isevn (x) = isevn_(x)
//
(* ****** ****** *)

%{^
import sys
######
from basics_cats import *
from integer_cats import *
######
sys.setrecursionlimit(1000000)
%}

(* ****** ****** *)

%{$
if (len(sys.argv) >= 2):
  print(isevn(int(sys.argv[1])))
else:
  print('Usage: isevn <integer>')
#endif
%} // end of [%{$]

(* ****** ****** *)

(* end of [isevn.dats] *)
