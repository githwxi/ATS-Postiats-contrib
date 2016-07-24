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
(* ****** ****** *)
//
#define
ATS_EXTERN_PREFIX "tutoriats_"
#define
ATS_STATIC_PREFIX "_tutoriats_patsopt_"
//
(* ****** ****** *)
//
staload
"./../SATS/basics.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2PHP}/staloadall.hats"
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
file_of_string
  (inp: string): string(*fname*)
//
implement
{}(*tmp*)
file_of_string
  (inp) = fname where
{
//
val dir =
  $extfcall(string, "sys_get_temp_dir")
//
val fname =
  $extfcall
    (string, "tempnam", dir, "patsopt_")
  // $extfcall
//
val fhandle =
  $extfcall(PHPfilp0, "fopen", fname, "w")
//
val nwrit = fwrite(fhandle, inp)
(*
val ((*void*)) = fwrite_checkret(nwrit)
*)
//
val closed = fclose(fhandle)
(*
val ((*void*)) = fclose_checkret(closed)
*)
//
} (* end of [file_of_string] *)
//
(* ****** ****** *)
//
extern
fun
file_get_contents
  (fname: string): string = "mac#"
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
patsopt_file
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
  then let
    val str =
      file_get_contents (fname_dats_c)
    // end of [val]
  in
    COMPRES0_succ (str)
  end // end of [then]
  else let
    val str =
      file_get_contents(fname_dats_c_log)
    // end of [val]
  in
    COMPRES1_fail (str)
  end (* end of [else] *)
// end of [if]
) : compres // end of [val]
//
val unlink_ret = unlink(fname_dats_c)
val unlink_ret = unlink(fname_dats_c_log)
//
} (* end of [patsopt_file] *)

(* ****** ****** *)

implement
{}(*tmp*)
patsopt_code
  (ptext) = patsopt_res where
{
//
val
fname_dats = file_of_string(ptext)
//
val
patsopt_res = patsopt_file(fname_dats)
//
val unlink_ret = unlink (fname_dats)
//
} (* end of [patsopt_code] *)

(* ****** ****** *)

(* end of [patsopt.dats] *)
