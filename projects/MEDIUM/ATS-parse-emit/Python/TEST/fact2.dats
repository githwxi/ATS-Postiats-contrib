(* ****** ****** *)
//
// HX-2014-08:
// A running example
// from ATS2 to Python3
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
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
"{$LIBATSCC2PY}/SATS/integer.sats"
//
(* ****** ****** *)
//
extern
fun fact : int -> int = "mac#fact"
//
implement
fact (n) = let
//
fun loop (n: int, res: int): int =
  if n > 0 then loop (n-1, n*res) else res
//
in
  loop (n, 1)
end // end of [fact]

(* ****** ****** *)

%{^
import sys
######
from basics_cats import *
from integer_cats import *
######
sys.setrecursionlimit(1000000)
%} // end of [%{^]

(* ****** ****** *)

%{$
if (len(sys.argv) >= 2):
  print(fact(int(sys.argv[1])))
else:
  print('Usage: fact <integer>')
#endif
%} // end of [%{$]

(* ****** ****** *)

(* end of [fact2.dats] *)
