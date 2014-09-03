(* ****** ****** *)
//
// HX-2014-08:
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
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "process_test_dynload"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/basics_js.sats"
staload
"{$LIBATSCC2JS}/SATS/integer.sats"
staload
"{$LIBATSCC2JS}/SATS/string.sats"
staload
"{$LIBATSCC2JS}/SATS/node/basics.sats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/node/process.sats"
//
(* ****** ****** *)
//
val () = print ("argv = ")
val () = print_obj (process_argv)
val () = print_newline ((*void*))
//
(* ****** ****** *)

val () = print ("uptime = ")
val () = print_obj (process_uptime())
val () = print_newline ((*void*))

(* ****** ****** *)

val () = print ("version = ")
val () = print_obj (process_version)
val () = print_newline ((*void*))

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
process_test_dynload()
%} // end of [%{$]
  
(* ****** ****** *)

(* end of [process.dats] *)
