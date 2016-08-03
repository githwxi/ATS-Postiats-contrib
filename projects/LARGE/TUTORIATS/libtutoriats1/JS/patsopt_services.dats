(*
** HX-2016-08-01:
** For supporting
** patsopt services:
**   patsopt_tc, patsopt_cc, patsopt_cc2js
** pats2xhtml service
*)

(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
#define
ATS2LANGWEB_targetloc
"$PATSHOME\
/doc/PROJECT/MEDIUM/ats2langweb/CLIENT"
//
staload"{$ATS2LANGWEB}/SATS/atslangweb.sats"
//
(* ****** ****** *)
//
staload"{$ATS2LANGWEB}/DATS/patsopt_tcats.dats"
staload"{$ATS2LANGWEB}/DATS/patsopt_ccats.dats"
staload"{$ATS2LANGWEB}/DATS/patsopt_atscc2js.dats"
//
staload"{$ATS2LANGWEB}/DATS/pats2xhtml_eval.dats"
//
staload"{$ATS2LANGWEB}/DATS/service_trigger.dats"
//
(* ****** ****** *)
//
extern
fun
pats_key2source
  (string): string = "mac#"
//
(* ****** ****** *)
//
implement
service_trigger_getval<>
  (key) = source where
{
//
val source = pats_key2source(key)
(*
val ((*void*)) = alert("source = " + source)
*)
//
} (* service_trigger_getval *)
//
(* ****** ****** *)
//
extern
fun
patsopt_tc_onclick
  (key: string): void = "mac#"
extern
fun
patsopt_tc_do_reply
(
  key: string, reply: string
) : int = "mac#" (* end-of-fun *)
//
implement
patsopt_tc_onclick
  (key) = let
//
implement
service_trigger_do_reply<>
  (key, reply) = ignoret
(
  patsopt_tc_do_reply(key, reply)
) (* ignoret *)
//
in
//
service_trigger_patsopt_tcats<>(key)
//
end (* end of [patsopt_tc_onclick] *)
//
(* ****** ****** *)

extern
fun
patsopt_cc_onclick
  (key: string): void = "mac#"
extern
fun
patsopt_cc_do_reply
(
  key: string, reply: string
) : int = "mac#" (* end-of-fun *)
//
implement
patsopt_cc_onclick
  (key) = let
//
implement
service_trigger_do_reply<>
  (key, reply) = ignoret
(
  patsopt_cc_do_reply(key, reply)
) (* ignoret *)
//
in
//
service_trigger_patsopt_ccats<>(key)
//
end (* end of [patsopt_cc_onclick] *)

(* ****** ****** *)
//
extern
fun
patsopt_cc2js_onclick
  (key: string): void = "mac#"
extern
fun
patsopt_cc2js_do_reply
(
  key: string, reply: string
) : int = "mac#" (* end-of-fun *)
//
implement
patsopt_cc2js_onclick
  (key) = let
//
implement
service_trigger_do_reply<>
  (key, reply) = ignoret
(
  patsopt_cc2js_do_reply(key, reply)
) (* ignoret *)
//
in
//
service_trigger_patsopt_cc2js<>(key)
//
end (* end of [patsopt_cc2js_onclick] *)

(* ****** ****** *)

extern
fun
pats2xhtml_eval_onclick
  (key: string): void = "mac#"
//
implement
pats2xhtml_eval_onclick
  (key) = let
//
(*
implement
service_trigger_getval<>
  (key) = pats_key2source(key)
*)
//
in
//
service_trigger_pats2xhtml_eval<>(key)
//
end (* end of [pats2xhtml_eval_onclick] *)

(* ****** ****** *)
//
%{^
function
patsopt_tc_do_reply
  (key, reply)
{
//
var
comparr =
JSON.parse(decodeURIComponent(reply));
var
comparr0 = comparr[0];
var
comparr1 = comparr[1];
//
document.getElementById
  (key+"_output").value = comparr1;
//
/*
if(comparr0---0) { alert("Patsopt_tc passed!"); }
*/
if(comparr0 > 0) { alert("Patsopt_tc failed!"); }
//
return comparr0;
} /* patsopt_tc_do_reply */
%} // %{^
//
%{^
function
patsopt_cc_do_reply
  (key, reply)
{
//
var
comparr =
JSON.parse(decodeURIComponent(reply));
var
comparr0 = comparr[0];
var
comparr1 = comparr[1];
//
document.getElementById
  (key+"_output").value = comparr1;
//
if(comparr0 > 0) { alert("Patsopt_cc failed!"); }
//
return comparr0;
} /* patsopt_cc_do_reply */
%} // %{^
//
%{^
function
patsopt_cc2js_do_reply
  (key, reply)
{
//
var
comparr =
JSON.parse(decodeURIComponent(reply));
var
comparr0 = comparr[0];
var
comparr1 = comparr[1];
//
document.getElementById
  (key+"_output").value = comparr1;
//
if(comparr0===0) { eval(comparr1); }
if(comparr0 > 0) { alert("Patsopt_cc2js failed!"); }
//
return comparr0;
} /* patsopt_cc2js_do_reply */
%} // %{^
//
(* ****** ****** *)

(* end of [patsopt_services.dats] *)
