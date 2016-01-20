(***********************************************************************)
(*                                                                     *)
(*                       ATS/contrib/libats-hwxi                       *)
(*                                                                     *)
(***********************************************************************)

(*
** Copyright (C) 2014 Hongwei Xi, ATS Trustful Software, Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and associated documentation files (the "Software"),
** to deal in the Software without restriction, including without limitation
** the rights to use, copy, modify, merge, publish, distribute, sublicense,
** and/or sell copies of the Software, and to permit persons to whom the
** Software is furnished to do so, subject to the following stated conditions:
** 
** The above copyright notice and this permission notice shall be included in
** all copies or substantial portions of the Software.
** 
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
** OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
** THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
** FROM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
** IN THE SOFTWARE.
*)

(* ****** ****** *)
//
// HX-2014-01-17: start
//
(* ****** ****** *)

(*
** buffer for lexing
*)

(* ****** ****** *)

#include "share/atspre_define.hats"

(* ****** ****** *)

staload CS =
"{$LIBATSHWXI}/cstream/SATS/cstream.sats"
vtypedef cstream = $CS.cstream

(* ****** ****** *)

fun{}
theCurDir_get(): string // self directory
fun{}
theParDir_get(): string // parent directory

(* ****** ****** *)
//
abstype
filename_type = ptr
//
typedef fil_t = filename_type
//
(* ****** ****** *)

fun filename_dummy (): fil_t

(* ****** ****** *)

fun
filename_make
(
  given: string, part: string, full: string
) : fil_t // end of [filename_make]

(* ****** ****** *)
//
fun print_filename_full (fil_t): void
fun prerr_filename_full (fil_t): void
fun fprint_filename_full (out: FILEref, fil_t): void
//
overload print with print_filename_full
overload prerr with prerr_filename_full
overload fprint with fprint_filename_full
//
(* ****** ****** *)
//
fun
filename_equal
  (fil1: fil_t, fil2: fil_t): bool
//
overload = with filename_equal
//
(* ****** ****** *)

fun filename_get_current ((*void*)): fil_t

(* ****** ****** *)
//
abst@ype
position_t0ype =
$extype"\
atscntrb_libatshwxi_lexingbuf_position\
" 
//
typedef pos_t = position_t0ype
//  
(* ****** ****** *)
//
fun
position_incby_char
  (pos: &pos_t >> _, c: int):<!wrt> void
//
(* ****** ****** *)

abstype
location_type = ptr
typedef loc_t = location_type

(* ****** ****** *)
//
fun location_make
  (_beg: &pos_t, _end: &pos_t): loc_t
//
(* ****** ****** *)
//
fun print_location : (loc_t) -> void
fun prerr_location : (loc_t) -> void
//
fun fprint_location
  (out: FILEref, loc: loc_t): void
//
overload print with print_location
overload prerr with prerr_location
overload fprint with fprint_location
//
(* ****** ****** *)

absvtype
lexingbuf_type = ptr
vtypedef lexbuf = lexingbuf_type

(* ****** ****** *)

fun lexingbuf_make (cstream): lexbuf

(* ****** ****** *)

fun lexingbuf_free (lbf: lexbuf): void

(* ****** ****** *)

fun lexbuf_get_base (buf: !lexbuf): lint

(* ****** ****** *)

fun lexbuf_get_position
  (buf: !lexbuf, res: &pos_t? >> _): void
// end of [lexbuf_get_position]

(* ****** ****** *)

(* end of [lexingbuf.sats] *)
