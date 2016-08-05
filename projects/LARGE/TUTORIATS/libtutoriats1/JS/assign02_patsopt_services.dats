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

#define TEXT 0
#define HTML 1

(* ****** ****** *)
//
extern
fun
assign02_pats_key2source
  (key: string): string = "mac#"
extern
fun
assign02_pats_key2output_set
  (key: string, msg: string): void = "mac#"
//
%{^
//
function
assign02_pats_key2source(key)
{
//
var
source =
document.getElementById(key+"_source");
//
if(source.cdata !== undefined)
  return source.cdata; else return source.value;
//
} /* end of [assign02_pats_key2source] */
function
assign02_pats_key2output_set(key, msg)
{
//
return document.getElementById(key+"_output").value = msg;
//
} /* end of [assign02_pats_key2output_set] */
//
%} (* end of [%{^] *)
//
(* ****** ****** *)
//
extern
fun
assign02_patsopt_services_initize
  (key: string): void = "mac#"
//
%{^
//
function
assign02_patsopt_services_initize
  (key)
{
//
var
source = 
document.getElementById(key+"_source");
var
output = 
document.getElementById(key+"_output");
//
output.rows = source.rows;
output.cols = source.cols;
//
var
source2 = 
document.getElementById(key+"_source2");
source2.style.overflow = "auto";
source2.style.maxWidth = String(source.clientWidth)+"px";
source2.style.maxHeight = String(source.clientHeight)+"px";
//
var
output2 = 
document.getElementById(key+"_output2");
output2.style.overflow = "auto";
output2.style.maxWidth = String(source.clientWidth)+"px";
output2.style.maxHeight = String(source.clientHeight)+"px";
//
} /* end of [patsopt_services_initize] */
//
%} // end of [%{^]

(* ****** ****** *)
//
extern
fun
assign02_pats_code_lncmnt
(
  flag: int, code: string, nskip: int
) : string = "mac#"
//
implement
assign02_pats_code_lncmnt
  (flag, code, nskip) = let
//
val A0 =
  JSarray_nil{string}()
//
implement
gprint_string<>
  (x0) = ignoret(A0.push(x0))
//
implement
gprint_newline<>
  ((*void*)) = gprint_string("\n")
//
val
[n:int] code = g1ofg0(code)
//
val n0 = string_length(code)
val EOL = ("\n").charCodeAt(0)
//
fun
loop
{ i:nat
| i <= n
} (
  i0: int(i)
, j0: intGte(0)
, ln: intGte(0)
) : intGte(0) = (
//
if (
i0 < n0
) then (
//
if (
code[i0] = EOL
) then loop(i0+1, 0, ln+1)
  else loop(i0+1, j0+1, ln)
//
) else (if j0 = 0 then ln else ln+1)
//
) (* end of [loop] *)
//
val nd =
f0 (ln, 0) where
{
val ln = loop(0, 0, 1)
fun f0
(
  x: int, nd: intGte(0)
) : intGte(0) = if x > 0 then f0(x/10, nd+1) else nd
} (* end of [val] *)
//
fn
prline
(
  ln: int
) : void =
prline(ln, nd) where
{
fun
prline
(
  ln: int, nd: intGte(0)
) : void =
(
if nd > 0
  then (prline(ln/10, nd-1); gprint_int(ln%10)) else ()
) (* end of [prline] *)
//
}
//
fnx
loop0
{ i:nat
| i <= n
} (
  i0: int(i), ln: int
) : natLte(n) = (
//
if (
i0 < n0
) then (
//
if
ln < nskip
then let
  val c0 = code.charCodeAt(i0)
  val () = gprint_string(string_fromCharCode(c0))
in
  if c0 != EOL then loop0(i0+1, ln) else loop0(i0+1, ln+1)
end // end of [then]
else (i0) // end of [else]
//
) else (i0) // end of [else]
//
) (* end of [loop0] *)
//
fnx
loop1
{ i:nat
| i <= n
} (
  i0: int(i), ln: int
) : void =
(
if (
i0 < n0
) then (
  if(flag=TEXT) then gprint!("(*");
  if(flag=HTML) then
    gprint!("<span class=\"comment\">");
  // end of [if]
  prline(ln);
  if(flag=TEXT) then gprint!("*) ");
  if(flag=HTML) then gprint!(": </span>");
  loop2(i0, ln+1)
) else ((*else*))
// end of [if]
)
//
and
loop2
{ i:nat
| i <= n
} (
  i0: int(i), ln: int
) : void =
if
(i0 < n0)
then let
//
val c0 = code.charCodeAt(i0)
//
in
//
if c0 = EOL
  then (gprint_newline(); loop1(i0+1, ln))
  else (gprint_string(string_fromCharCode(c0)); loop2(i0+1, ln))
// end of [if]
//
end // end of [loop2]
//
in
  let val i0 = loop0(0, 0) in loop1(i0, 1); JSarray_join(A0) end
end // assign02_pats_code_lncmnt
//
(* ****** ****** *)
//
implement
service_trigger_getval<>
  (key) = source where
{
//
val
source =
assign02_pats_key2source(key)
//
(*
val () = alert("source = " + source)
*)
//
} (* service_trigger_getval *)
//
(* ****** ****** *)
//
implement
service_trigger_prompt<>
  (key, msg) =
  assign02_pats_key2output_set(key, msg)
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
//
extern
fun
pats2xhtml_eval_onclick
  (key: string): void = "mac#"
//
extern
fun
pats2xhtml_eval_do_reply
(
  key: string, reply: string
) : int = "mac#" (* end-of-fun *)
//
implement
pats2xhtml_eval_onclick
  (key) = let
//
implement
service_trigger_do_reply<>
  (key, reply) = ignoret
(
  pats2xhtml_eval_do_reply(key, reply)
) (* ignoret *)
//
in
//
service_trigger_pats2xhtml_eval<>(key)
//
end (* end of [pats2xhtml_eval_onclick] *)
//
(* ****** ****** *)
//
extern
fun
pats2xhtml_toggle_onclick
  (key: string): void = "mac#"
//
%{^
function
pats2xhtml_toggle_onclick
  (key)
{
//
var
toggle =
document.getElementById(key+"_table_tr1").hidden
//
if
(toggle)
{
//
document.getElementById
  (key+"_table_tr1").hidden = false;
document.getElementById
  (key+"_table_tr2").hidden = (true);
return (0) ; // indicating success
//
} else {
//
var
source =
document.getElementById(key+"_source");
if(source.cdata===undefined)
{
  return pats2xhtml_eval_onclick(key);
} else {
  source.readOnly = false;
  source.value = source.cdata; source.cdata = undefined;
} /* end of [if] */
//
} /* end of [if] */
//
} /* end of [pats2xhtml_toggle_onclick] */
%} // end of [%{^]
//
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
//
var comparr0 = comparr[0];
var comparr1 = comparr[1];
//
document.getElementById(key+"_output").value = comparr1;
document.getElementById(key+"_table_tr1").hidden = false;
document.getElementById(key+"_table_tr2").hidden = (true);
//
/*
if(comparr0===0)
{
  alert("Patsopt_tc passed!");
}
*/
if(comparr0 > 0)
{
//
var
source =
document.getElementById(key+"_source");
//
if
(source.cdata===undefined)
{
  source.cdata = source.value;
  source.value =
  assign02_pats_code_lncmnt
    (0/*TEXT*/, source.cdata, 0/*nskip*/)
  source.readOnly = true; // HX: disabling editing
}
//
} /* end of [if] */
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
//
var comparr0 = comparr[0];
var comparr1 = comparr[1];
//
document.getElementById(key+"_output").value = comparr1;
document.getElementById(key+"_table_tr1").hidden = false;
document.getElementById(key+"_table_tr2").hidden = (true);
//
if(comparr0 > 0)
{
//
var
source =
document.getElementById(key+"_source");
//
if
(source.cdata===undefined)
{
  source.cdata = source.value;
  source.value =
  assign02_pats_code_lncmnt
    (0/*TEXT*/, source.cdata, 0/*nskip*/)
  source.readOnly = true; // HX: disabling editing
}
//
} /* end of [if] */
//
return comparr0;
//
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
//
var comparr0 = comparr[0];
var comparr1 = comparr[1];
//
document.getElementById(key+"_output").value = comparr1;
document.getElementById(key+"_table_tr1").hidden = false;
document.getElementById(key+"_table_tr2").hidden = (true);
//
if(comparr0===0)
{
  eval(comparr1);
}
if(comparr0 > 0)
{
//
var
source =
document.getElementById(key+"_source");
//
if
(source.cdata===undefined)
{
  source.cdata = source.value;
  source.value =
  assign02_pats_code_lncmnt
    (0/*TEXT*/, source.cdata, 0/*nskip*/)
  source.readOnly = true; // HX: disabling editing
}
//
} /* end of [if] */
//
return comparr0;
} /* patsopt_cc2js_do_reply */
%} // %{^
//
%{^
function
pats2xhtml_eval_do_reply
  (key, reply)
{
//
var
comparr =
JSON.parse
(
decodeURIComponent(reply)
);
//
var comparr0 = comparr[0];
var comparr1 = comparr[1];
//
if(comparr0===0)
{
//
document.getElementById
(
  key+"_source2"
).textContent =
  assign02_pats_key2source(key);
//
// alert(comparr1);
//
document.getElementById
  (key+"_output2").innerHTML =
  assign02_pats_code_lncmnt
  (
    1/*HTML*/, comparr1, 1/*nskip*/
  ); // assign02_pats_code_lncmnt
//
document.getElementById
  (key+"_table_tr1").hidden = true;
document.getElementById
  (key+"_table_tr2").hidden = false;
//
} /* end of [if] */
//
if(comparr0 > 0) {
//
var
source =
document.getElementById(key+"_source");
//
source.cdata = source.value;
source.value =
assign02_pats_code_lncmnt
  (0/*TEXT*/, source.cdata, 0/*nskip*/)
//
source.readOnly = true; // HX: disabling editing
//
var
output =
document.getElementById(key+"_output");
output.value = "Pats2xhtml failed!\n\n" + comparr1;
//
} /* end of [if] */
//
return comparr0;
} /* pats2xhtml_eval_do_reply */
%} // %{^
//
(* ****** ****** *)

%{^
//
function
patssrc_saveAs_onclick
  (key)
{
//
var
code =
assign02_pats_key2source(key);
//
var
blob =
new
Blob([code], {type: 'text/plain'});
//
var
fname =
document.getElementById
  (key+"_patssrc_saveAs_input").value;
//
if(!fname)
{
  fname = key+"_sol.dats";
}
return saveAs(blob, fname);
} /* end of [patssrc_saveAs_onclick] */
//
%} // %{^

(* ****** ****** *)

(* end of [assign02_patsopt_services.dats] *)
