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
#include
"{$LIBATSCC2PHP}/staloadall.hats"
//
(* ****** ****** *)
//
staload "./../SATS/basics.sats"
//
staload PATSOPT = "./patsopt.dats"
//
(* ****** ****** *)
//
extern
fun
file_get_contents (fname: string): string = "mac#"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
patsopt_continue_file
  (fname_dats) = patsopt_res where
{
//
val dir =
  $extfcall(string, "sys_get_temp_dir")
val fname_dats_c =
  $extfcall (string, "tempnam", dir, "patsopt")
val fname_dats_c_log =
  $extfcall (string, "tempnam", dir, "patsopt")
//
val
command =
patsopt_format_command
(
  fname_dats, fname_dats_c, fname_dats_c_log
) (* end of [val] *)
//
val
exec_ret = exec_retval (command)
//
val
patsopt_res =
(
//
if exec_ret = 0
  then patsopt_continue<> (fname_dats_c)
  else let
    val str =
      file_get_contents (fname_dats_c_log)
    // end of [val]
  in
    COMPRES1_fail (str)
  end (* end of [else] *)
// end of [if]
) : compres // end of [val]
//
val unlink_ret = unlink (fname_dats_c)
val unlink_ret = unlink (fname_dats_c_log)
//
} (* end of [patsopt_continue_file] *)

(* ****** ****** *)

implement
{}(*tmp*)
patsopt_atscc2js_code
  (code) = patsopt_atscc2js_res where
{
//
implement
patsopt_continue<>
  (fname) = atscc2js_file (1(*flag*), fname)
//
val fname_dats =
  $PATSOPT.file_of_string(code)
val patsopt_atscc2js_res = patsopt_continue_file (fname_dats)
val unlink_ret = unlink (fname_dats)
//
} (* end of [patsopt_atscc2js_code] *)

(* ****** ****** *)

(* end of [patsopt_continue.dats] *)
