(* ****** ****** *)
//
// HX: 2016-08-03:
// Some PAGEN-functions
// for creating assignments  
// 
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
staload
"{$LIBATSCC2PY3}/SATS/PYLIBC/random.sats"
staload
"{$LIBATSCC2PY3}/SATS/PYLIBC/datetime.sats"
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
extern
fun{}
PAGENmidterm_head(): void
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENmidterm_head() =
{
//
val () =
gprintln! ("<head>")
//
val () =
gprintln! ("\
<title>BUCASCS320-midterm-1</title>\
") (* gprintln! *)
//
val () =
gprintln! ("\
<meta content=\"text/html; charset=UTF-8\" />\
") (* end of [val] *)
//
val () =
gprintln! ("\
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\
") (* end of [val] *)
//
val () =
gprintln! ("\
<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">
") (* end of [val] *)
//
val () =
gprintln! ("\
<style type=\"text/css\">
  .patsyntax {width:100%;margin:auto;}
  .patsyntax {color:#808080;background-color:#E0E0E0;}
  .patsyntax span.keyword {color:#000000;font-weight:bold;}
  .patsyntax span.comment {color:#787878;font-style:italic;}
  .patsyntax span.extcode {color:#A52A2A;}
  .patsyntax span.neuexp  {color:#800080;}
  .patsyntax span.staexp  {color:#0000F0;}
  .patsyntax span.prfexp  {color:#603030;}
  .patsyntax span.dynexp  {color:#F00000;}
  .patsyntax span.stalab  {color:#0000F0;font-style:italic}
  .patsyntax span.dynlab  {color:#F00000;font-style:italic}
  .patsyntax span.dynstr  {color:#008000;font-style:normal}
  .patsyntax span.stacstdec  {text-decoration:none;}
  .patsyntax span.stacstuse  {color:#0000CF;text-decoration:underline;}
  .patsyntax span.dyncstdec  {text-decoration:none;}
  .patsyntax span.dyncstuse  {color:#B80000;text-decoration:underline;}
  .patsyntax span.dyncst_implement  {color:#B80000;text-decoration:underline;}
</style>\
") (* gprintln! *)
//
val () =
gprintln! ("\
<script
 src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js\">
</script>
<script
 src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\">
</script>
<script
 src=\"https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2014-11-29/FileSaver.min.js\">
</script>
<script
 src=\"https://ats-lang.github.io/LIBRARY/libatscc2js/libatscc2js_all.js\">
</script>
<script
 src=\"https://ats-lang.github.io/LIBRARY/libatscc2js/libatscc2js_print_store_cats.js\">
</script>
<script
 src=\"https://ats-lang.github.io/LIBRARY/ats2langweb/pats2xhtmlize_dats.js\">
</script>\
") (* gprintln! *)
//
val () =
gprintln! ("</head>")
//
} (* end of [PAGENmidterm_head] *)
//
(* ****** ****** *)

(* end of [PAGEN-midterm.dats] *)
