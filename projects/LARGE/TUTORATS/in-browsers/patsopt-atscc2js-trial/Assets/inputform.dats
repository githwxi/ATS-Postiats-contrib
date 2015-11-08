(*
** Patsopt-atscc2js-eval
*)

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
ATS_DYNLOADNAME "inputform_dynload"
//
(* ****** ****** *)

#include "{$LIBATSCC2JS}/staloadall.hats"

(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/Worker/channel.sats"
staload
"{$LIBATSCC2JS}/DATS/Worker/channel.dats"
#include
"{$LIBATSCC2JS}/DATS/Worker/channeg.dats"
//
(* ****** ****** *)
//
staload
"{$PATSHOME}\
/utils/libatsopt/SATS/libatsopt_ext.sats"
staload
"{$PATSHOMERELOC}\
/projects/MEDIUM/CATS-atsccomp/CATS-atscc2js/libatscc2js_ext.sats"
//
(* ****** ****** *)

abstype button
abstype checkbox

(* ****** ****** *)
//
extern
fun
document_button : string -> button = "mac#"
extern
fun
document_checkbox : string -> checkbox = "mac#"
//
%{^
function
document_button(name)
{
  return document.getElementById(name);
}
function
document_checkbox(name)
{
  return document.getElementById(name);
}
%} // end of [%{^]
//
(* ****** ****** *)
//
datatype
outstring =
| outstring$stdout of (string)
| outstring$stderr of (string)
//
fun
outstring2string
(
  out: outstring
) : string = (
//
case+ out of
| outstring$stdout(x) => x | outstring$stderr(x) => x
//
) (* end of [outstring2string] *)
//
(* ****** ****** *)
//
extern
fun
checkbox_test(checkbox): bool = "mac#"
extern
fun
checkbox_turn_on(checkbox): void = "mac#"
extern
fun
checkbox_turn_off(checkbox): void = "mac#"
//
%{^
function
checkbox_test(box) { return box.checked; }
function
checkbox_turn_on(box) { return (box.checked = true); }
function
checkbox_turn_off(box) { return (box.checked = false); }
%} // end of [%{^]
//
(* ****** ****** *)
//
extern
fun
Patsopt_input_get(): string = "mac#"
extern
fun
Patsopt_output_get(): outstring = "mac#"
extern
fun
Patsopt_output_set(outstring): void = "mac#"
//
(* ****** ****** *)
//
extern
fun
Atscc2js_input_get(): outstring = "mac#"
extern
fun
Atscc2js_output_get(): outstring = "mac#"
extern
fun
Atscc2js_output_set(outstring): void = "mac#"
//
(* ****** ****** *)
//
extern
fun
Evaluate_input_get(): outstring = "mac#"
//
(* ****** ****** *)
//
extern
fun
Patsopt_output_text_set(string): void = "mac#"
extern
fun
Patsopt_output_text_reset((*void*)): void = "mac#"
//
%{^
function
Patsopt_output_text_set(value)
{
  return document.getElementById("Patsopt_output_text").value = value
}
%} // end of [%{^]
//
implement
Patsopt_output_text_reset() = Patsopt_output_text_set("")
//
(* ****** ****** *)
//
extern
fun
Patsopt_getarg((*void*)): comarglst1
//
extern
fun
Patsopt_arglst
(
  arglst: comarglst1, fpost: (int, outstring) -<cloref1> void
) : void // end-of-function
//
(* ****** ****** *)
//
extern
fun
Atscc2js_getarg((*void*)): comarglst1
//
extern
fun
Atscc2js_arglst
(
  arglst: comarglst1, fpost: (int, outstring) -<cloref1> void
) : void // end-of-function
//
(* ****** ****** *)
//
extern
fun
Patsopt_button_onclick(): void = "mac#"
extern
fun
Atscc2js_button_onclick(): void = "mac#"
extern
fun
Evaluate_button_onclick(): void = "mac#"
//
(* ****** ****** *)
//
extern
fun
Patsopt_output_box_onclick(): void = "mac#"
extern
fun
Atscc2js_output_box_onclick(): void = "mac#"
//
(* ****** ****** *)
//
val Patsopt_button = document_button"Patsopt_button"
//
val Atscc2js_box = document_checkbox"Atscc2js_box"
val Atscc2js_button = document_button"Atscc2js_button"
//
val Evaluate_box = document_checkbox"Evaluate_box"
val Evaluate_button = document_button"Evaluate_button"
//
(* ****** ****** *)
//
extern
fun
Patsopt_optstr_get(): string = "mac#"
//
%{^
//
function
Patsopt_optstr_get()
{
  return document.getElementById("Patsopt_optstr").value;
}
//
%} // end of [%{^]
//
(* ****** ****** *)
//
extern
fun
Atscc2js_optstr_get(): string = "mac#"
//
implement
Atscc2js_optstr_get((*void*)) = "--input"
//
(* ****** ****** *)
//
val
Patsopt_output_ref =
  ref{outstring}(outstring$stderr(""))
val
Atscc2js_output_ref =
  ref{outstring}(outstring$stderr(""))
//
(* ****** ****** *)
//
val
Patsopt_output_box = document_checkbox"Patsopt_output_box"
val
Atscc2js_output_box = document_checkbox"Atscc2js_output_box"
//
(* ****** ****** *)
//
%{^
function
Patsopt_input_get()
{
  return document.getElementById("Patsopt_input_text").value;
}
%} // end of [%{^]
//
implement
Patsopt_output_get() = Patsopt_output_ref[]
implement
Patsopt_output_set(out) =
{
  val () =
    Patsopt_output_ref[] := out
  // end of [val]
  val () =
  if checkbox_test(Patsopt_output_box)
    then Patsopt_output_text_set(outstring2string(out))
  // end of [if]
}
//
(* ****** ****** *)
//
implement
Atscc2js_input_get() = Patsopt_output_get()
implement
Atscc2js_output_get() = Atscc2js_output_ref[]
implement
Atscc2js_output_set(out) =
{
  val () =
    Atscc2js_output_ref[] := out
  // end of [val]
  val () =
  if checkbox_test(Atscc2js_output_box)
    then Patsopt_output_text_set(outstring2string(out))
  // end of [if]
}
//
(* ****** ****** *)

implement
Evaluate_input_get() = Atscc2js_output_get()

(* ****** ****** *)

implement
Patsopt_button_onclick
  ((*void*)) = let
//
(*
val () =
  alert("Patsopt_button_onclick")
*)
//
val () =
  Patsopt_output_text_set("Patsopt is being called...")
//
fun
fpost
(
  nerr: int, output: outstring
) : void = let
  val () =
    Patsopt_output_text_reset()
  // end of [val]
  val () = Patsopt_output_set(output)
in
  if checkbox_test(Atscc2js_box) then Atscc2js_button_onclick()
end // end of [fpost]
//
val arglst = Patsopt_getarg((*void*))
//
in
  Patsopt_arglst(arglst, lam(nerr, output) => fpost(nerr, output))
end // end of [Patsopt_button_onclick]

(* ****** ****** *)

implement
Atscc2js_button_onclick
  ((*void*)) = let
//
(*
val () =
  alert("Atscc2js_button_onclick")
*)
//
val () =
  Patsopt_output_text_set("Atscc2js is being called...")
//
fun
fpost
(
  nerr: int, output: outstring
) : void = let
  val () =
    Patsopt_output_text_reset()
  // end of [val]
  val () = Atscc2js_output_set(output)
in
  if checkbox_test(Evaluate_box) then Evaluate_button_onclick()
end // end of [fpost]
//
val arglst = Atscc2js_getarg((*void*))
//
in
  Atscc2js_arglst(arglst, lam(nerr, output) => fpost(nerr, output))  
end // end of [Atscc2js_button_onclick]

(* ****** ****** *)

implement
Evaluate_button_onclick
  ((*void*)) = let
//
val
input = Evaluate_input_get()
val
input = outstring2string(input)
//
in
  $extfcall(void, "eval", input)
end // end of [Evaluate_button_onclick]

(* ****** ****** *)

implement
Patsopt_output_box_onclick
  ((*void*)) = let
//
val test =
  checkbox_test(Patsopt_output_box)
//
val ((*void*)) =
  if test then
    checkbox_turn_off(Atscc2js_output_box)
  // end of [if]
//
val ((*void*)) =
  if test then
    Patsopt_output_text_set
      (outstring2string(Patsopt_output_get()))
    // Patsopt_output_text_set
  // end of [if]
//
val ((*void*)) =
  if not(test) then Patsopt_output_text_set("")
//
in
  // nothing
end // end of [Patsopt_output_box_onclick]

implement
Atscc2js_output_box_onclick
  ((*void*)) = let
//
val test =
  checkbox_test(Atscc2js_output_box)
//
val ((*void*)) =
  if test then
    checkbox_turn_off(Patsopt_output_box)
//
val ((*void*)) =
  if test then
    Patsopt_output_text_set
      (outstring2string(Atscc2js_output_get()))
    // Patsopt_output_text_set
  // end of [if]
//
val ((*void*)) =
  if not(test) then Patsopt_output_text_set("")
//
in
  // nothing
end // end of [Atscc2js_output_box_onclick]

(* ****** ****** *)

datatype
patsoptres_ =
PATSOPTRES_ of
(
  chmsg(int)(*nerr*)
, chmsg(string)(*stdout*), chmsg(string)(*stderr*)
)

(* ****** ****** *)

implement
chmsg_parse<patsoptres>
  (arg) = let
//
  val
  arg_ =
  $UN.cast{patsoptres_}(arg)
//
  val+
  PATSOPTRES_
    (nerr, stdout, stderr) = arg_
//
  val nerr = chmsg_parse<int>(nerr)
  val stdout = chmsg_parse<string>(stdout)
  val stderr = chmsg_parse<string>(stderr)
in
  PATSOPTRES(nerr, stdout, stderr)
end // end of [chmsg_parse<patsoptres>]

(* ****** ****** *)
//
implement
Patsopt_getarg
  ((*void*)) = let
//
val
arglst = list_nil((*void*))
//
val
comarg =
COMARGstrinp(Patsopt_input_get())
val
arglst = list_cons(comarg, arglst)
//
val
comarg =
COMARGprefil"\
#define ATS_MAINATSFLAG 1\n\
#define ATS_DYNLOADNAME \
\"dynload_for_patsopt_atscc2js_eval\"\n\
#include \
\"share/atspre_define.hats\"\n\
#include \
\"{$LIBATSCC2JS}/staloadall.hats\"\n\
staload \"{$LIBATSCC2JS}/SATS/print.sats\"\n\
" // end of [val]
val
arglst = list_cons(comarg, arglst)
//
val
comarg =
COMARGpostfil"\
//\n\
%{$\n\
//\n\
ats2jspre_the_print_store_clear();\n\
dynload_for_patsopt_atscc2js_eval();\n\
alert(ats2jspre_the_print_store_join());\n\
//\n\
%}(*[%{$]*)\n\
//\n\
" // end of [val]
val
arglst = list_cons(comarg, arglst)
//
val
delim = " "
val
optstr = Patsopt_optstr_get()
val
optarr =
$extmcall(JSarray(string), optstr, "split", delim)
//
typedef res = comarglst1
//
fun
aux(n: int, xs: res): res =
(
//
if
n > 0
then let
  val n = n - 1
  val x =
    COMARGstrlit(optarr[n])
  // end of [val]
in
  aux(n, list_cons{comarg}(x, xs))
end // end of [then]
else xs // end of [else]
//
) (* end of [aux] *)
//
in
  aux(length(optarr), arglst)
end // end of [Patsopt_getarg]
//
(* ****** ****** *)
//
implement
Patsopt_arglst
  (args, fpost) = () where
{
//
val
chn =
channeg_new_file
(
  "./Assets/libatsopt_ext_worker.js"
) (* end of [val] *)
//
(*
val () = alert("Worker is ready!")
*)
//
val () =
channeg_send{int}
(
chn
,
lam(chn, res) =>
// theWorker is ready
channeg_recv{comarglst1}
(
chn
,
args
,
lam(chn) =>
channeg_send{patsoptres}
(
chn
,
lam(chn, res) => let
//
val
res =
chmsg_parse<patsoptres>(res)
//
val () = channeg_close(chn)
//
val+
PATSOPTRES
  (nerr, stdout, stderr) = res
// end of [val]
(*
val () = alert("nerr = " + String(nerr))
*)
val res =
(
  if (nerr = 0)
    then outstring$stdout(stdout) else outstring$stderr(stderr)
  // end of [if]
)
//
in
  fpost(nerr, res) // for the post action
end // end of [lam]
) (* send{patsoptres} *)
) (* recv{comarglst1} *)
) (* channeg_send{int} *)
//
} (* end of [Patsopt_arglst] *)
//
(* ****** ****** *)

datatype
atscc2jsres_ =
ATSCC2JSRES_ of
(
  chmsg(int)(*nerr*)
, chmsg(string)(*stdout*), chmsg(string)(*stderr*)
)

(* ****** ****** *)

implement
chmsg_parse<atscc2jsres>
  (arg) = let
//
  val
  arg_ =
  $UN.cast{atscc2jsres_}(arg)
//
  val+
  ATSCC2JSRES_
    (nerr, stdout, stderr) = arg_
//
  val nerr = chmsg_parse<int>(nerr)
  val stdout = chmsg_parse<string>(stdout)
  val stderr = chmsg_parse<string>(stderr)
in
  ATSCC2JSRES(nerr, stdout, stderr)
end // end of [chmsg_parse<atscc2jsres>]

(* ****** ****** *)
//
implement
Atscc2js_getarg
  ((*void*)) = let
//
val
arglst = list_nil((*void*))
//
val
input = Atscc2js_input_get()
val
input = outstring2string(input)
//
val
comarg = COMARGstrinp(input)
val
arglst = list_cons(comarg, arglst)
//
val
delim = " "
val
optstr =
Atscc2js_optstr_get()
val
optarr =
$extmcall(JSarray(string), optstr, "split", delim)
//
typedef res = comarglst1
//
fun
aux(n: int, xs: res): res =
(
//
if
n > 0
then let
  val n = n - 1
  val x =
    COMARGstrlit(optarr[n])
  // end of [val]
in
  aux(n, list_cons{comarg}(x, xs))
end // end of [then]
else xs // end of [else]
//
) (* end of [aux] *)
//
in
  aux(length(optarr), arglst)
end // end of [Atscc2js_getarg]

(* ****** ****** *)
//
implement
Atscc2js_arglst
  (args, fpost) = () where
{
//
val
chn =
channeg_new_file
(
  "./Assets/libatscc2js_ext_worker.js"
) (* end of [val] *)
//
(*
val () = alert("Worker is ready!")
*)
//
val () =
channeg_send{int}
(
chn
,
lam(chn, res) =>
// theWorker is ready
channeg_recv{comarglst1}
(
chn
,
args
,
lam(chn) =>
channeg_send{atscc2jsres}
(
chn
,
lam(chn, res) => let
//
val
res =
chmsg_parse<atscc2jsres>(res)
//
val () = channeg_close(chn)
//
val+
ATSCC2JSRES
  (nerr, stdout, stderr) = res
// end of [val]
(*
val () = alert("nerr = " + String(nerr))
*)
val res =
(
  if (nerr = 0)
    then outstring$stdout(stdout) else outstring$stderr(stderr)
  // end of [if]
)
//
in
  fpost(nerr, res) // for the post action
end // end of [lam]
) (* send{patsoptres} *)
) (* recv{comarglst1} *)
) (* channeg_send{int} *)
//
} (* end of [Atscc2js_arglst] *)
//
(* ****** ****** *)

%{$
//
jQuery(document).ready(function(){inputform_dynload();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [inputform.dats] *)
