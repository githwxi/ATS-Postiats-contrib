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
patsopt_atscc2js
  (code: string): void = "mac#"
//
extern
fun
patsopt_waiting(msg: string): void = "mac#"
extern
fun
patsopt_atscc2js_do_response(resp: string): void = "mac#"
//
/* ****** ****** */

implement
patsopt_atscc2js
  (code) = let
//
val () = patsopt_waiting("Waiting for the server ...")
//
val xmlhttp =
  XMLHttpRequest_new()
val ((*void*)) =
xmlhttp.onreadystatechange
(
  lam((*void*)) =>
    if xmlhttp.is_ready_okay()
      then patsopt_atscc2js_do_response (xmlhttp.responseText)
  // end of [lam]
)
//
val ((*void*)) =
  xmlhttp.open("POST","patsopt-atscc2js.php", true)
val ((*void*)) =
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
//
val () = xmlhttp.send("program_input=" + encodeURIComponent(code))
//
in
  // nothing
end // end of [patsopt_atscc2js]

/* ****** ****** */

/* end of [inputform_process.dats] */
