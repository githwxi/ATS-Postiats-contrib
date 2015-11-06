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
val () =
  alert("Patsopt_button_onclick")
//
val input = Patsopt_input_get()
val output = outstring$stdout(input)
val ((*void*)) = Patsopt_output_set(output)
//
in
  if checkbox_test(Atscc2js_box) then Atscc2js_button_onclick()
end // end of [Patsopt_button_onclick]

implement
Atscc2js_button_onclick
  ((*void*)) = let
//
val () =
  alert("Atscc2js_button_onclick")
//
val input = Atscc2js_input_get()
val ((*void*)) = Atscc2js_output_set(input)
//
in
  if checkbox_test(Evaluate_box) then Evaluate_button_onclick()
end // end of [Atscc2js_button_onclick]

implement
Evaluate_button_onclick
  ((*void*)) = let
//
val () =
  alert("Evaluate_button_onclick")
//
in
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
end // end of [Atscc2js_output_box_onclick]

(* ****** ****** *)

%{$
//
jQuery(document).ready(function(){inputform_dynload();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [inputform.dats] *)
