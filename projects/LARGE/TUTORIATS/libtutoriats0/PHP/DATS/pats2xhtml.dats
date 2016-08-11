(*
//
// For invoking [pats2xhtml]
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
ATS_STATIC_PREFIX "_tutorats_pats2xhtml_"
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
pats2xhtml_get () = "pats2xhtml"
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
    (string, "tempnam", dir, "pats2xhtml_")
  // $extfcall
//
val fhandle =
  $extfcall (PHPfilp0, "fopen", fname, "w")
//
val nwrit = fwrite(fhandle, inp)
(*
val ((*void*)) = fwrite_checkret(nwrit)
*)
//
val _closed_ = fclose(fhandle)
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
file_get_contents (fname: string): string = "mac#"
//
(* ****** ****** *)

implement
{}(*tmp*)
pats2xhtml_format_command
(
  stadyn
, fname_dats
, fname_dats_xhtml, fname_dats_xhtml_log
) = let
//
val
pats2xhtml = pats2xhtml_get<> ()
//
val stadyn =
  (if stadyn <= 0 then "--static" else "--dynamic"): string
//
in
//
$extfcall
(
  string, "sprintf"
, "%s 2>%s --embedded -o %s %s %s"
, pats2xhtml, fname_dats_xhtml_log, fname_dats_xhtml, stadyn, fname_dats
) (* end of [$extfcall] *)
//
end // end of [pats2xhtml_format_command]

(* ****** ****** *)

implement
{}(*tmp*)
pats2xhtml_file
(
  stadyn, fname_dats
) = pats2xhtml_res where
{
//
val dir =
  $extfcall(string, "sys_get_temp_dir")
//
val
fname_dats_xhtml =
  $extfcall(string, "tempnam", dir, "pats2xhtml")
val
fname_dats_xhtml_log =
  $extfcall(string, "tempnam", dir, "pats2xhtml")
//
val
command =
pats2xhtml_format_command
(
  stadyn, fname_dats, fname_dats_xhtml, fname_dats_xhtml_log
) (* end of [val] *)
//
val
exec_ret = exec_retval(command)
//
val
pats2xhtml_res =
(
//
if
(
exec_ret = 0
)
then let
  val xhtml =
    file_get_contents(fname_dats_xhtml)
  // end of [val]
in
  COMPRES0_succ(xhtml)
end // end of [then]
else let
  val errmsg =
    file_get_contents(fname_dats_xhtml_log)
  // end of [val]
in
  COMPRES1_fail(errmsg)
end (* end of [else] *)
// end of [if]
) : compres // end of [val]
//
val unlink_ret = unlink(fname_dats_xhtml)
val unlink_ret = unlink(fname_dats_xhtml_log)
//
} (* end of [pats2xhtml_file] *)

(* ****** ****** *)

implement
{}(*tmp*)
pats2xhtml_code
  (stadyn, ptext) = pats2xhtml_res where
{
//
val
fname_dats = file_of_string(ptext)
//
val
pats2xhtml_res = pats2xhtml_file(stadyn, fname_dats)
//
val unlink_ret = unlink(fname_dats)
//
} (* end of [pats2xhtml_code] *)

(* ****** ****** *)

(* end of [pats2xhtml.dats] *)
