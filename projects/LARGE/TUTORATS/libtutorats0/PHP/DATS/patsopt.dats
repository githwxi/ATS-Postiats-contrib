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
(* ****** ****** *)
//
staload "./../SATS/basics.sats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
patsopt_get () = "patsopt"
//
(* ****** ****** *)
//
extern
fun{}
string2file
  (inp: string): string(*fname*)
//
implement
{}(*tmp*)
string2file
  (inp) = fname where
{
//
val dir =
  $extfcall(string, "sys_get_temp_dir")
//
val fname =
  $extfcall (string, "tempnam", dir, "patsopt_")
//
val fhandle =
  $extfcall (PHPfilp0, "fopen", fname, "w")
//
val nwrit = fwrite (fhandle, inp)
(*
val ((*void*)) = fwrite_checkret (nwrit)
*)
//
val closed = fclose (fhandle)
(*
val ((*void*)) = fclose_checkret (closed)
*)
//
} (* end of [string2file] *)
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
patsopt_format_command
(
  fname_dats, fname_dats_c, fname_dats_c_log
) = let
//
val patsopt = patsopt_get<> ()
//
in
//
$extfcall
(
  string, "sprintf"
, "%s 2>%s -o %s -d %s"
, patsopt, fname_dats_c_log, fname_dats_c, fname_dats
) (* end of [$extfcall] *)
//
end // end of [patsopt_format_command]

(* ****** ****** *)

implement
{}(*tmp*)
patsopt_file2string
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
patsopt_res = (
//
if exec_ret = 0
  then file_get_contents (fname_dats_c)
  else let
    val str1 = file_get_contents (fname_dats)
    val str2 = file_get_contents (fname_dats_c_log)
  in
    $extfcall (string, "sprintf", "%s\n/*\n\n%s\n*/\n", str1, str2)
  end (* end of [else] *)
// end of [if]
) : string // end of [val]
//
val unlink_ret = unlink (fname_dats_c)
val unlink_ret = unlink (fname_dats_c_log)
//
} (* end of [patsopt_file2string] *)

(* ****** ****** *)

implement
{}(*tmp*)
patsopt_string2string
  (code) = patsopt_res where
{
//
val fname_dats = string2file(code)
val patsopt_res = patsopt_file2string (fname_dats)
val unlink_ret = unlink (fname_dats)
//
} (* end of [patsopt_string2string] *)

(* ****** ****** *)

(* end of [patsopt.dats] *)
