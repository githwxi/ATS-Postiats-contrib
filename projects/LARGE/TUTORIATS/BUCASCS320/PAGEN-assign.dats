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
patsopt_tc_button(key: string): void
extern
fun{}
patsopt_cc_button(key: string): void
extern
fun{}
patsopt_cc2js_button(key: string): void
//
extern
fun{} pats2xhtml_button(key: string): void
//
(* ****** ****** *)
//
implement
{}(*tmp*)
patsopt_tc_button(key) =
{
//
val () =
gprintln!("\
<button
 type=\"button\"
 ID=\"")(key)("_patsopt_tc_button\"
 onclick=\"patsopt_tc_onclick('")(key)("')\"
>patsopt_tc</button>\
") (* gprintln! *)
//
} (* end of [patsopt_tc_button] *)
//
implement
{}(*tmp*)
patsopt_cc_button(key) =
{
//
val () =
gprintln!("\
<button
 type=\"button\"
 ID=\"")(key)("_patsopt_cc_button\"
 onclick=\"patsopt_cc_onclick('")(key)("')\"
>patsopt_cc</button>\
") (* gprintln! *)
//
} (* end of [patsopt_cc_button] *)
//
implement
{}(*tmp*)
patsopt_cc2js_button(key) =
{
//
val () =
gprintln!("\
<button
 type=\"button\"
 ID=\"")(key)("_patsopt_cc2js_button\"
 onclick=\"patsopt_cc2js_onclick('")(key)("')\"
>patsopt_cc2js</button>\
") (* gprintln! *)
//
} (* end of [patsopt_cc2js_button] *)
//
implement
{}(*tmp*)
pats2xhtml_button(key) =
{
//
val () =
gprintln! ("\
<button
 type=\"button\"
 ID=\"")(key)("_pats2xhtml_button\"
 onclick=\"pats2xhtml_eval_onclick('")(key)("')\"
>pats2xhtml</button>\
") (* gprintln! *)
//
} (* pats2xhtml_button *)
//
(* ****** ****** *)
//
extern
fun{}
PAGENassign_html(): void
//
extern
fun{}
PAGENassign_head(): void
//
extern
fun{}
PAGENassign_body(): void
//
extern
fun{}
PAGENassign_title(): void
//
(* ****** ****** *)
//
extern
fun{}
PAGENassign_descript(): void
extern
fun{}
PAGENassign_descript2(): void
//
(* ****** ****** *)
//
extern
fun{}
PAGENassign_body_top(): void
extern
fun{}
PAGENassign_body_bottom(): void
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENassign_html() =
{
//
val () =
gprintln!
(
"<!DOCTYPE html>"
) (* gprintln! *)
//
val () =
gprintln! ("<html>")
//
val () =
PAGENassign_head()
//
val () =
PAGENassign_body()
//
val () =
gprintln! ("</html>")
//
} (* end of [PAGENassign_html] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENassign_head() =
{
//
val () =
gprintln! ("<head>")
//
val () =
PAGENassign_title((*void*))
//
val () =
gprintln! ("\
<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\" />\
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
} (* end of [PAGENassign_head] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENassign_body() =
{
//
val () =
gprintln! ("<body>")
//
val () =
PAGENassign_body_top()
//
val () =
PAGENassign_descript()
val () =
PAGENassign_descript2()
//
val () =
PAGENassign_body_bottom()
//
val () =
gprintln! ("</body>")
//
} (* end of [PAGENassign_body] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENassign_title() =
{
//
val () =
gprintln! ("<title>")
val () =
gprintln! ("</title>")
//
} (* end of [PAGENassign_title] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENassign_descript() =
{
//
val () =
gprintln! ("<descript>")
val () =
gprintln! ("</descript>")
//
} (* end of [PAGENassign_descript] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENassign_descript2() =
{
//
val () =
gprintln! ("<descript2>")
val () =
gprintln! ("</descript2>")
//
} (* end of [PAGENassign_descript2] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENassign_body_top() =
{
//
val () =
gprintln!("<h1>Assignment</h1>")
//
} (* end of [PAGENassign_body_top] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENassign_body_bottom() =
{
//
val () =
gprintln!("<hr></hr>")
//
val () =
gprintln!("\
<p>
The JavaScript code loaded by this page is prepared with atscc2js.
</p>
<script
 src=\"https://ats-lang.github.io/LIBRARY/libtutoriats/libtutoriats_patsopt_services_dats.js\">
</script>
<script>
function
pats_key2source(key)
{
//
return document.getElementById(key+\"_source\").value;
//
} /* end of [pats_key2source] */
</script>
<script>
$(document).ready(function(){pats2xhtmlize_process_all();return;});
</script>\
") (* gprintln! *)
//
} (* end of [PAGENassign_body_bottom] *)
//
(* ****** ****** *)
//
extern
fun{}
PAGENassign_source_table
(
  key: string, source: string
) : void // end-of-function
//
implement
{}(*tmp*)
PAGENassign_source_table
  (key, source) = let
//
val () =
gprintln! ("<table>")
//
val () =
gprintln! ("\
<tr>
<th width=\"50%\"></th>
<th width=\"50%\"></th>
</tr>\
") (* gprintln! *)
//
val () =
gprintln!
("\
<tr>
<td align=\"center\">
<textarea
 ID=\"")(key)("_source\" rows=24 cols=80>\
") (* gprintln! *)
//
val () = gprint_string(source)
//
val () =
gprintln!
("\
</textarea>
</td>
<td align=\"center\">
<textarea
 ID=\"")(key)("_output\" rows=24 cols=80
 placeholder=\"The output goes here...\">
</textarea>
</td>
</tr>\
") (* gprintln! *)
//
val () =
gprintln! ("\
<tr>
<td align=\"center\">\
")
//
val () = patsopt_tc_button(key)
val () = patsopt_cc_button(key)
val () = patsopt_cc2js_button(key)
val () = pats2xhtml_button(key)
//
val () =
gprintln! ("\
</td>
<td></td>
</tr>\
") (* gprintln! *)
//
val () =
gprintln! ("</table>")
//
in
  // nothing
end // end of [PAGENassign_code_table]
//
(* ****** ****** *)

(* end of [PAGEN-assign.dats] *)
