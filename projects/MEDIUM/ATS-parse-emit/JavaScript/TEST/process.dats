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
"{$LIBATSCC2JS}/basics_js.sats"
staload
"{$LIBATSCC2JS}/SATS/integer.sats"
staload
"{$LIBATSCC2JS}/SATS/string.sats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/node/process.sats"
//
(* ****** ****** *)
//
extern
fun
test (): void = "mac#"
implement
test () =
{
  val () = print ("argv = ")
  val () = print_obj (argv)
  val () = print_newline ((*void*))
}
//
(* ****** ****** *)

%{^
//
// file inclusion
//
var fs = require('fs');
eval(fs.readFileSync('./libatscc2js/CATS/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/node/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/node/integer_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/node/string_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/node/process_cats.js').toString());
%} // end of [%{^]

(* ****** ****** *)

%{$
test()
%} // end of [%{$]
  
(* ****** ****** *)

(* end of [process.dats] *)
