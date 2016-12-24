(*
** Testing weboxy
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
staload "./../SATS/weboxy.sats"
staload _ = "./../DATS/weboxy.dats"
//
(* ****** ****** *)

#include "./params.hats"

(* ****** ****** *)

local

val webox_make_ = webox_make<>

in (* in-of-local *)

implement
{}(*tmp*)
webox_make
  () = wbx where
{
  val wbx = webox_make_ ()
  val () = wbx.bgcolor(randcolor())
} (* end of [webox_make] *)

end // end of [local]

(* ****** ****** *)
//
val () =
  randcolor_initize ()
//
(* ****** ****** *)
//
val thePage =
  webox_make_name ("thePage")
// end of [thePage]

(* ****** ****** *)
//
val thePageHeader =
  webox_make_name ("thePageHeader")
val thePageHeaderTop =
  webox_make_name ("thePageHeaderTop")
val thePageHeaderSep =
  webox_make_name ("thePageHeaderSep")
//
val () =
  thePageHeader.children (thePageHeaderTop, thePageHeaderSep)
//
(* ****** ****** *)

val () =
thePageHeaderTop.content
("\
<theHeaderLine1>BU CAS CS320</theHeaderLine1><br>
<theHeaderLine1>Concepts of Programming Languages</theHeaderLine1><br>
<theHeaderLine2>Semester</theHeaderLine2><br>
") (* end of [val] *)

(* ****** ****** *)

val thePageBody =
  webox_make_name ("thePagebody")
val thePageBodyL =
  webox_make_name ("thePagebodyL")
val thePageBodyR =
  webox_make_name ("thePagebodyR")
//
val () =
  thePageBodyL.height(600)
val () =
  thePageBodyR.height(600)
//
val () =
  thePageBody.tabstyle(TShbox)
val () =
  thePageBody.pcntlst
    ($list(PCNThard(80), PCNThard(20)))
val () =
  thePageBody.children(thePageBodyL, thePageBodyR)
//
(* ****** ****** *)
//
val thePageFooter =
  webox_make_name ("thePageFooter")
val thePageFooterSep =
  webox_make_name ("thePageFooterSep")
val thePageFooterRest =
  webox_make_name ("thePageFooterRest")
//
val () =
thePageFooterRest.content
  ("This page is created with help from ATS/weboxy")
//
val () =
  thePageFooter.children (thePageFooterSep, thePageFooterRest)
//      
(* ****** ****** *)
//
val thePage =
  webox_make_name ("thePage")
val () =
  thePage.children (thePageHeader, thePageBody, thePageFooter)
//
(* ****** ****** *)
    
val theBodyProp =
  webox_make_name ("theBodyProp")
// end of [theBodyProp]
      
val () = theBodyProp.children(thePage)
      
(* ****** ****** *)

implement
fprint_css_preamble<>
  (out) = let
//
val () =
fprint (out, "\
.center {\n\
  margin-left: auto;\n\
  margin-right: auto;\n\
}\n\
") (* end of [fprint] *)
//
in
  // nothing
end // end of [fprint_css_preamble]

(* ****** ****** *)

implement
fprint_css_postamble<>
  (out) = let
//
val () =
fprint (out, "\
body {
font-family: sans-serif;
background-color: #213449; /* dark blue */
}\n\
") (* end of [fprint] *)
// 
val () =
fprint (out, "\
#thePage {\n\
  width: 72%;\n\
  margin-left: auto;\n\
  margin-right: auto;\n\
}\n\
") (* end of [fprint] *)
//
val () =
fprint (out, "\
#thePageHeader {\n\
  text-align: center;
}\n\
") (* end of [fprint] *)
//
val () =
fprint (out, "\
#thePageFooter {\n\
  text-align: center;
}\n\
") (* end of [fprint] *)
//
val () =
fprint (out, "\
theHeaderLine1 {\n\
  font-size: 225%;\n\
  font-weight: bold;\n\
}\n\
theHeaderLine2 {\n\
  font-size: 150%;\n\
  font-weight: bold;\n\
}\n\
") (* end of [fprint] *)
//
in
  // nothing
end // end of [fprint_css_postamble]

(* ****** ****** *)

implement
main0 () =
{
//
val out = stdout_ref
//
val () =
  fprint_webox_html_all (out, theBodyProp)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [layout_cs320.dats] *)
