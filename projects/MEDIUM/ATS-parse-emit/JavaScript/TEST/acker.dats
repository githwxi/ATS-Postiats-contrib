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
extern
fun acker : (int, int) -> int = "mac#acker"
//
implement
acker (m, n) =
(
case+
  (m, n) of 
| (0, _) => n + 1
| (_, 0) => acker(m-1, 1)
| (_, _) => acker(m-1, acker(m, n-1)) 
)
//
(* ****** ****** *)

%{^
//
// file inclusion
//
var fs = require('fs');
eval(fs.readFileSync('./../prelude/CATS/basics_cats.js').toString());
eval(fs.readFileSync('./../prelude/CATS/integer_cats.js').toString());
%}

(* ****** ****** *)

%{$
console.log("acker(3, 3) =", acker(3, 3))
%} // end of [%{$]

(* ****** ****** *)

(* end of [acker.dats] *)
