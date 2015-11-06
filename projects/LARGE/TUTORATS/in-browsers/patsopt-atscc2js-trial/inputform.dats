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
  return document.getElementById("name");
}
function
document_checkbox(name)
{
  return document.getElementById("name");
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
//
%{^
function
Patsopt_output_text_set(value)
{
  return document.getElementById("Patsopt_output_text").value = value
}
%} // end of [%{^]
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

%{$
//
jQuery(document).ready(function(){inputform_dynload();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [inputform.dats] *)
