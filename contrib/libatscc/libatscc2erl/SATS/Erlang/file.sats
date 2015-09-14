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
ats2list_dir_opt(Dir: string): Option(ERLlist(filename)) = "mac#%"
//
(* ****** ****** *)

(* end of [file.sats] *)
