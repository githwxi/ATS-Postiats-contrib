(* ****** ****** *)
//
// For testing libatscc2js
//
(* ****** ****** *)
//
#include
"./../staloadall.hats"
//
staload "./../SATS/print.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "test01_dynload"
#define
ATS_STATIC_PREFIX "test01__"
//
(* ****** ****** *)

val () = repeat(3, $delay(println!("Hello, world!")))
val () = foreach(3, lam(i) =<cloref1> println!(i, ": Hello, world!"))

(* ****** ****** *)

%{^
//
// file inclusion
//
var fs = require('fs');
eval(fs.readFileSync('./../libatscc2js_all.js').toString());
eval(fs.readFileSync('./../CATS/PRINT/print_store_cats.js').toString());
%} // end of [%{^]

(* ****** ****** *)

%{$
test01_dynload();
process.stdout.write(ats2jspre_the_print_store_join());
%} // end of [%{$]

(* ****** ****** *)

(* end of [test01.dats] *)