(*
//
// For invoking [patsopt]
//
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
#define
ATS_EXTERN_PREFIX "tutorats_"
#define
ATS_STATIC_PREFIX "_tutorats_patsopt_"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PHP}/basics_php.sats"
staload
"{$LIBATSCC2PHP}/SATS/integer.sats"
staload
"{$LIBATSCC2PHP}/SATS/filebas.sats"
//
staload
"{$LIBATSCC2PHP}/SATS/PHParray.sats"
//
(* ****** ****** *)
//
staload "./../SATS/basics.sats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
atscc2js_get () = "atscc2js"
//
(* ****** ****** *)
//
extern
fun
file_get_contents (fname: string): string = "mac#"
//
(* ****** ****** *)

implement
{}(*tmp*)
atscc2js_format_command
(
  fname_dats_c, fname_dats_js, fname_dats_js_log
) = let
//
val atscc2js = atscc2js_get<> ()
//
in
//
$extfcall
(
  string, "sprintf"
, "%s 2>%s -o %s -i %s"
, atscc2js, fname_dats_js_log, fname_dats_js, fname_dats_c
) (* end of [$extfcall] *)
//
end // end of [atscc2js_format_command]

(* ****** ****** *)

implement
{}(*tmp*)
atscc2js_file
  (flag, fname_dats_c) = atscc2js_res where
{
//
val dir =
  $extfcall(string, "sys_get_temp_dir")
val fname_dats_js =
  $extfcall (string, "tempnam", dir, "atscc2js")
val fname_dats_js_log =
  $extfcall (string, "tempnam", dir, "atscc2js")
//
val
command =
atscc2js_format_command
(
  fname_dats_c, fname_dats_js, fname_dats_js_log
) (* end of [val] *)
//
val
exec_ret = exec_retval (command)
//
val
atscc2js_res =
(
//
if exec_ret = 0
  then let
    val str =
      file_get_contents (fname_dats_js)
    // end of [val]
  in
    COMPRES0_succ (str)
  end // end of [then]
  else (
    if flag = 0
      then let
        val str2 =
          file_get_contents (fname_dats_js_log)
        // end of [val]
      in
        COMPRES1_fail (str2)
      end // end of [then]
      else let
        val str1 =
          file_get_contents (fname_dats_c)
        // end of [val]
        val str2 =
          file_get_contents (fname_dats_js_log)
        // end of [val]
      in
        COMPRES2_fail (str1, str2)
      end // end of [else]
    // end of [if]
  ) (* end of [else] *)
// end of [if]
) : compres // end of [val]
//
val unlink_ret = unlink (fname_dats_js)
val unlink_ret = unlink (fname_dats_js_log)
//
} (* end of [atscc2js_file] *)

(* ****** ****** *)

(* end of [atscc2js.dats] *)
