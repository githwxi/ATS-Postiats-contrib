(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2015 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/SATS/CODEGEN/filebas.atxt
** Time of generation: Sun Nov 20 21:18:18 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2012 *)

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)

#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

val stdin_ref : FILEref = "mac#%FILE_stdin"
val stdout_ref : FILEref = "mac#%FILE_stdout"
val stderr_ref : FILEref = "mac#%FILE_stderr"

(* ****** ****** *)

fun{} dirsep_get ():<> charNZ
fun{} dirname_self ():<> string
fun{} dirname_parent ():<> string

(* ****** ****** *)

fun{}
filename_get_ext (name: string):<> vStrptr0
fun{}
filename_test_ext (name: string, ext: string):<> bool

(* ****** ****** *)

fun{}
filename_get_base (name: string):<> vStrptr1
fun{}
filename_test_base (name: string, base: string):<> bool

(* ****** ****** *)
//
val file_mode_r
  : file_mode (file_mode_r()) = "mac#%" // = "r"
val file_mode_rr
  : file_mode (file_mode_rw()) = "mac#%" // = "r+"
//
val file_mode_w
  : file_mode (file_mode_w()) = "mac#%" // = "w"
val file_mode_ww
  : file_mode (file_mode_rw()) = "mac#%" // = "w+"
//
val file_mode_a
  : file_mode (file_mode_rw()) = "mac#%" // = "a"
val file_mode_aa
  : file_mode (file_mode_rw()) = "mac#%" // = "a+"
//
(* ****** ****** *)
//
(*
** HX: [stat] is called
*)
fun
test_file_exists
  (path: NSH(string)): bool = "mac#%"
//
(* ****** ****** *)
//
// HX-2011-02-16:
// [stat] is called to obtain the mode of a given file
// for [f] to be applied to it.
//
fun{}
test_file_mode
  (path: NSH(string)): int
//
fun{}
test_file_mode$pred (mode: uint): bool
//
fun
test_file_mode_fun
  (path: NSH(string), f: uint -> bool): int = "mac#%"
//
// HX: [stat] is called // ~1/0/1: error/false/true
//
fun
test_file_isblk(path: NSH(string)): int = "mac#%"
fun
test_file_ischr(path: NSH(string)): int = "mac#%"
fun
test_file_isdir(path: NSH(string)): int = "mac#%"
fun
test_file_isfifo(path: NSH(string)): int = "mac#%"
fun
test_file_isreg(path: NSH(string)): int = "mac#%"
//
// HX: [lstat] is called // ~1/0/1: error/false/true
//
fun
test_file_islnk(path: NSH(string)): int = "mac#%"
//
(* ****** ****** *)
//
fun
fileref_open_exn
  (path: NSH(string), file_mode): FILEref = "mac#%"
// end of [fileref_open_exn]
//
fun{}
fileref_open_opt
  (path: NSH(string), file_mode): Option_vt(FILEref)
// end of [fileref_open_opt]
//
(* ****** ****** *)
//
fun
fileref_close(fil: FILEref): void = "mac#%"
//
(* ****** ****** *)
//
fun
fileref_flush(fil: FILEref): void = "mac#%"
//
(* ****** ****** *)
//
// HX: error indication: EOF
//
fun
fileref_getc(input: FILEref): int = "mac#%"
//
(* ****** ****** *)
//
// HX: no error reporting
//
fun
fileref_putc_int
  (out: FILEref, c: int): void = "mac#%"
//
fun
fileref_putc_char
  (out: FILEref, c: char): void = "mac#%"
//
symintr fileref_putc
overload fileref_putc with fileref_putc_int
overload fileref_putc with fileref_putc_char
//
(* ****** ****** *)
//
// HX: no error reporting
//
fun
fileref_puts
  (out: FILEref, NSH(string)): void = "mac#%"
//
(* ****** ****** *)
//
fun
fileref_is_eof (inp: FILEref): bool = "mac#%"
//
macdef
fileref_isnot_eof(inp) = ~fileref_is_eof (,(inp))
//
(* ****** ****** *)

typedef
fileref_load_type(a:t@ype) =
  (FILEref, &a? >> opt (a, b)) -<fun1> #[b:bool] bool (b)
// end of [fileref_load_type]
//
fun{a:t0p}
fileref_load : fileref_load_type (a)
//
fun
fileref_load_int : fileref_load_type (int) = "mac#%"
fun
fileref_load_lint : fileref_load_type (lint) = "mac#%"
fun
fileref_load_uint : fileref_load_type (uint) = "mac#%"
fun
fileref_load_ulint : fileref_load_type (ulint) = "mac#%"
//
fun
fileref_load_float : fileref_load_type (float) = "mac#%"
fun
fileref_load_double : fileref_load_type (double) = "mac#%"
//
(* ****** ****** *)

fun{a:t0p}
fileref_get_optval
  (inp: FILEref): Option_vt (a)
// end of [fileref_get_optval]

fun{
a:t0p
} fileref_get_exnmsg
  (inp: FILEref, msg: NSH(string)): a
// end of [fileref_get_exnmsg]

macdef
fileref_get_exnloc
  (inp) = fileref_get_exnmsg (,(inp), $mylocation)
// end of [fileref_get_exnloc]

(* ****** ****** *)

typedef charlst = List0 (char)
vtypedef charlst_vt = List0_vt (char)

(* ****** ****** *)
//
fun
fileref_get_line_charlst(inp: FILEref): charlst_vt
//
(* ****** ****** *)
//
(*
** HX: only for files of "tiny" size
*)
fun
fileref_get_lines_charlstlst(inp: FILEref): List0_vt (charlst_vt)
//
(* ****** ****** *)
//
(*
** HX: for handling files of "tiny" size
*)
fun
fileref_get_file_charlst(inp: FILEref): List0_vt (char)
fun
fileref_get2_file_charlst(inp: FILEref, n: int): List0_vt (char)
//
(* ****** ****** *)
//
fun
fileref_put_charlst(inp: FILEref, cs: NSH(List(char))): void
//
(* ****** ****** *)
//
//
// HX-2013-05:
// these functions are based on [fgets];
// they should only be applied to files containing
// no occurrences of the NUL character ('\000').
//
fun{}
fileref_get_line_string(inp: FILEref): Strptr1
//
fun{}
fileref_get_line_string_main
(
  inp: FILEref, nchar: &int? >> int(n)
) : #[n:nat] strnptr(n) // end-of-function
fun{}
fileref_get_line_string$bufsize((*void*)): intGte(1)
//
fun{}
fileref_get_lines_stringlst(inp: FILEref): List0_vt(Strptr1)
//
(* ****** ****** *)
//
fun{}
fileref_get_file_string(inp: FILEref): Strptr1
fun{}
fileref_get_file_string$bufsize((*void*)): intGte(1)
//
(* ****** ****** *)
//
fun{}
fileref_get_word(inp: FILEref): Strptr0
fun{}
fileref_get_word$isalpha(c0: charNZ): bool
//
(* ****** ****** *)
//
fun{}
fileref_foreach(inp: FILEref): void
fun{
env:vt0p
} fileref_foreach_env(inp: FILEref, env: &(env) >> _): void
//
fun{}
fileref_foreach$bufsize((*void*)): sizeGte(1)
fun{
env:vt0p
} fileref_foreach$fwork(c: char, env: &(env) >> _): void
fun{
env:vt0p
} fileref_foreach$fworkv
  {n:int} (arrayref(char, n), size_t(n), &(env) >> _): void
//
(* ****** ****** *)
//
fun{}
streamize_fileref_char(inp: FILEref): stream_vt(char)
fun{}
streamize_fileref_line(inp: FILEref): stream_vt(Strptr1)
//
(* ****** ****** *)

(* end of [filebas.sats] *)
