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
fun
rtfind (f: int -> int): int = "mac#"
//
implement
rtfind (f) = let
//
fun loop
  (i: int): int =
  if f (i) = 0 then i else loop (i+1)
//
in
  loop (0(*i*))
end // end of [rtfind]

(* ****** ****** *)

%{^
//
// file inclusion
//
var fs = require('fs');
eval(fs.readFileSync('./../prelude/CATS/basics_cats.js').toString());
eval(fs.readFileSync('./../prelude/CATS/integer_cats.js').toString());
%} // end of [%{^]

(* ****** ****** *)

%{$
//
poly1 = function(x) { return x*x - x - 6 ; }
console.log('rtfind(lambda x: x*x - x - 6) = %d', rtfind(poly1))
//
poly2 = function(x) { return x*x + 2*x - 99 ; }
console.log('rtfind(lambda x: x*x - 2*x - 99) = %d', rtfind(poly2))
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [rtfind2.dats] *)
