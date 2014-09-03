(* ****** ****** *)
//
// HX-2014-09:
// A running example
// from ATS2 to Node.js
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/basics_js.sats"
staload
"{$LIBATSCC2JS}/SATS/node/basics.sats"
staload
"{$LIBATSCC2JS}/SATS/node/process.sats"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "hello_dynload"

(* ****** ****** *)

val out = process_stdout
val ((*void*)) = fprintln! (out, "Hello world!")

(* ****** ****** *)

%{^
//
// file inclusion
//
var fs = require('fs');
eval(fs.readFileSync('./libatscc2js/CATS/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/node/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/node/process_cats.js').toString());
%} // end of [%{^]

(* ****** ****** *)

%{$
hello_dynload()
%} // end of [%{$]

(* ****** ****** *)

(* end of [hello.dats] *)
