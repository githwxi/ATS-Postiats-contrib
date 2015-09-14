(*
** Module [file]
*)

(* ****** ****** *)
//
// HX-2015-09:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2erlibc_file_"
//
(* ****** ****** *)
//
staload
"./../../basics_erl.sats"
//
(* ****** ****** *)

abstype
deep_list // [char | atom | deep_list]

(* ****** ****** *)

abstype fd // for raw file descriptors

(* ****** ****** *)

abstype filename // = string
abstype filename_all // = string | binary

(* ****** ****** *)

abstype io_device // = pid | fd

(* ****** ****** *)

abstype name // = string | atom | deep_list
abstype name_all // = name | RawFilename::binary

(* ****** ****** *)

abstype mode
abstype location

(* ****** ****** *)

abstype posix(*errno*)

(* ****** ****** *)

abstype data_time // = Calendar::datatime

(* ****** ****** *)

abstype file_info_option  
  
(* ****** ****** *)
//
castfn
filename2string: filename -<fun> string
//
(* ****** ****** *)
//
fun print_filename: filename -> void = "mac#%"
fun print_filename_all: filename_all -> void = "mac#%"
//
overload print with print_filename
overload print with print_filename_all
//
(* ****** ****** *)
//
(*
get_cwd_0() = $extfcall(ERLval, "file:get_cwd")
get_cwd_1(Drive) = $extfcall(ERLval, "file:get_cwd", Drive)
*)
//
fun
ats2get_cwd_0_opt(): Option(filename) = "mac#%"
fun
ats2get_cwd_1_opt(Drive: string): Option(filename) = "mac#%"
//
overload ats2get_cwd_opt with ats2get_cwd_0_opt
overload ats2get_cwd_opt with ats2get_cwd_1_opt
//
(* ****** ****** *)
//
fun
ats2list_dir_opt
  (Dir: name_all): Option(ERLlist(filename)) = "mac#%"
fun
ats2list_dir_all_opt
  (Dir: name_all): Option(ERLlist(filename_all)) = "mac#%"
//
(* ****** ****** *)
//
fun
ats2read_file_opt(Filename: name_all): Option(binary) = "mac#%"
//
(* ****** ****** *)

(* end of [file.sats] *)
