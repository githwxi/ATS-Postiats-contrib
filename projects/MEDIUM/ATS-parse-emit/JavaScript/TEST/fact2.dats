(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
"./../prelude/SATS/integer.sats"
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
//
// file inclusion
//
var fs = require('fs');
eval(fs.readFileSync('./../prelude/CATS/integer_cats.js').toString());
%}

(* ****** ****** *)

%{$
console.log("fact(12) = %d", fact(12))
%} // end of [%{$]

(* ****** ****** *)

(* end of [fact2.dats] *)
