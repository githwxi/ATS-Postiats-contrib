/*
** For sending code over to the server
** and then receiving the output from the server
*/

/* ****** ****** */
//
#include
"share/atspre_define.hats"
//
/* ****** ****** */
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
/* ****** ****** */
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
staload
"{$LIBATSCC2JS}/SATS/Ajax/Ajax.sats"
//
/* ****** ****** */
//
extern
fun
pats2xhtml_eval
(
  srcitm: XMLDOC, code: string
) : void = "mac#" // end-of-fun
//
extern
fun
pats2xhtml_waiting(msg: string): void = "mac#"
extern
fun
pats2xhtml_do_response
  (srcitm: XMLDOC, resp: string): void = "mac#"
//
/* ****** ****** */

implement
pats2xhtml_eval
  (srcitm, code) = let
//
val () =
pats2xhtml_waiting("Waiting for the server...")
//
val
xmlhttp =
XMLHttpRequest_new()
//
val ((*void*)) =
xmlhttp.onreadystatechange
(
  lam((*void*)) =>
    if xmlhttp.is_ready_okay() then
      pats2xhtml_do_response(srcitm, xmlhttp.responseText())
    // end of [if]
  // end of [lam]
) (* xmlhttp.onreadystatechange *)
//
val ((*void*)) =
xmlhttp.open("POST","pats2xhtml.php", true)
//
val ((*void*)) =
xmlhttp.setRequestHeader
  ("Content-type", "application/x-www-form-urlencoded")
//
val () = xmlhttp.send("program_input=" + encodeURIComponent(code))
//
in
  // nothing
end // end of [pats2xhtml_eval]

/* ****** ****** */

/* end of [inputform_process_js.dats] */
