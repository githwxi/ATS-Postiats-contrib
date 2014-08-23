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
extern
fun isodd
  : (int) -> bool = "mac#isodd"
//
implement isevn (n) = isevn_(n)
implement isodd (n) =
  if n > 0 then isevn_(n-1) else false
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
console.log("isevn(100) =", isevn(100))
console.log("isodd(101) =", isodd(101))
%} // end of [%{$]


(* ****** ****** *)

(* end of [isevn.dats] *)
