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
//
(* ****** ****** *)
//
val thePageLeft =
  webox_make_name ("thePageLeft")
val thePageRight =
  webox_make_name ("thePageRight")
val () =
  thePage.tabstyle(TShbox)
val () =
  thePage.pcntlst
    ($list(PCNThard(15), PCNTnone()))
val () =
  thePage.children(thePageLeft, thePageRight)
//
(* ****** ****** *)
//
val thePageRHeader =
  webox_make_name ("thePageRHeader")
val thePageRHeaderTop =
  webox_make_name ("thePageRHeaderTop")
val thePageRHeaderSep =
  webox_make_name ("thePageRHeaderSep")
//
val () =
  thePageRHeader.children (thePageRHeaderTop, thePageRHeaderSep)
//
(* ****** ****** *)

val () =
thePageRHeaderTop.content
("\
<theHeaderLine1>The ATS Programming Language</theHeaderLine1><br>
<theHeaderLine2>Unleashing the Potentials of Types and Templates</theHeaderLine2><br>
") (* end of [val] *)

(* ****** ****** *)

val thePageRBody =
  webox_make_name ("thePageRBody")
val thePageRBodyLeft =
  webox_make_name ("thePageRBodyLeft")
val thePageRBodyRight =
  webox_make_name ("thePageRBodyRight")
//
val () =
  thePageRBodyLeft.height (600)
val () =
  thePageRBodyRight.height (600)
//
val () =
  thePageRBody.tabstyle(TShbox)
val () =
  thePageRBody.pcntlst
    ($list(PCNThard(75), PCNThard(25)))
val () =
  thePageRBody.children(thePageRBodyLeft, thePageRBodyRight)
//
(* ****** ****** *)
//
val thePageRBodyLHeader =
 webox_make_name ("thePageRBodyLHeader")
val thePageRBodyLContent =
 webox_make_name ("thePageRBodyLContent")
val () =
  thePageRBodyLeft.children (thePageRBodyLHeader, thePageRBodyLContent)
//
(* ****** ****** *)
//
val thePageRFooter =
  webox_make_name ("thePageRFooter")
val thePageRFooterSep =
  webox_make_name ("thePageRFooterSep")
val thePageRFooterRest =
  webox_make_name ("thePageRFooterRest")
//
val () =
thePageRFooterRest.content
  ("This page is created with help from ATS/weboxy")
//
val () =
  thePageRFooter.children (thePageRFooterSep, thePageRFooterRest)
//      
(* ****** ****** *)
//
val () =
  thePageRight.children (thePageRHeader, thePageRBody, thePageRFooter)
//
(* ****** ****** *)
//
val theBodyProp =
  webox_make_name ("theBodyProp")
//
val () = theBodyProp.bgcolor("")
//
val () = theBodyProp.children(thePage)
//
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
  width: 85%;\n\
  margin-left: auto;\n\
  margin-right: auto;\n\
}\n\
") (* end of [fprint] *)
//
val () =
fprint (out, "\
#thePageRHeader {\n\
  text-align: center;
}\n\
") (* end of [fprint] *)
//
val () =
fprint (out, "\
#thePageRBodyLHeader\n\
{\n\
  text-align: center;\n\
}\n\
") (* end of [fprint] *)
//
val () =
fprint (out, "\
#thePageRFooter {\n\
  text-align: center;\n\
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

(* end of [layout_ats2lang.dats] *)
