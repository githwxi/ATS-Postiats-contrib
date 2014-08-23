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
fun fact : int -> int = "mac#fact"
//
implement
fact (n) = if n > 0 then n * fact(n-1) else 1
//
(* ****** ****** *)

%{^
//
// file is included here:
//
var fs = require('fs');
eval(fs.readFileSync('./../prelude/CATS/integer_cats.js').toString());
%}

(* ****** ****** *)

%{$
console.log("fact(10) =", fact(10))
%} // end of [%{$]

(* ****** ****** *)

(* end of [fact.dats] *)
