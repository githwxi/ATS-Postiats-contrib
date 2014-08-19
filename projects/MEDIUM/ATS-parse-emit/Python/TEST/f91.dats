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
extern fun f91 : int -> int = "mac#f91"
//
implement
f91 (x) = if x >= 101 then x - 10 else f91(f91(x+11))
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
  print(f91(int(sys.argv[1])))
else:
  print('Usage: f91 <integer>')
#endif
%} // end of [%{$]

(* ****** ****** *)

(* end of [f91.dats] *)
