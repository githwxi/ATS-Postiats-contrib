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
** $PATSHOME/prelude/SATS/CODEGEN/char.atxt
** Time of generation: Sun Nov 20 21:18:15 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: September, 2011 *)

(* ****** ****** *)
//
praxi
lemma_char_size
(
// argumentless
) : [sizeof(char)==sizeof(byte)] void
praxi
lemma_schar_size
(
// argumentless
) : [sizeof(schar)==sizeof(byte)] void
praxi
lemma_uchar_size
(
// argumentless
) : [sizeof(uchar)==sizeof(byte)] void
//
(* ****** ****** *)
//
castfn char2schar0 (c: char):<> schar
castfn schar2char0 (c: schar):<> char
//
castfn char2uchar0 (c: char):<> uchar
castfn uchar2char0 (c: uchar):<> char
//
(* ****** ****** *)
//
fun int2char0 (i: int):<> char = "mac#%"
fun int2schar0 (i: int):<> schar = "mac#%"
fun int2uchar0 (i: int):<> uchar = "mac#%"
//
fun uint2uchar0 (u: uint):<> uchar = "mac#%"
//
(* ****** ****** *)

fun char2int0 (c: char):<> int = "mac#%"
fun schar2int0 (c: schar):<> int = "mac#%"
fun uchar2int0 (c: uchar):<> int = "mac#%"

(* ****** ****** *)

fun char2uint0 (c: char):<> uint = "mac#%"
fun schar2uint0 (c: schar):<> uint = "mac#%"
fun uchar2uint0 (c: uchar):<> uint = "mac#%"

(* ****** ****** *)

fun char2u2int0 (c: char):<> int = "mac#%"
fun char2u2uint0 (c: char):<> uint = "mac#%"

(* ****** ****** *)
//
fun char0_iseqz (c: char):<> bool = "mac#%"
fun char0_isneqz (c: char):<> bool = "mac#%"
//
overload iseqz with char0_iseqz of 0
overload isneqz with char0_isneqz of 0
//
(* ****** ****** *)
//
fun add_char0_int0
  (c: char, i: int):<> char = "mac#%"
fun sub_char0_int0
  (c: char, i: int):<> char = "mac#%"
fun sub_char0_char0
  (c1: char, c2: char):<> int = "mac#%"
//
overload + with add_char0_int0 of 0
overload - with sub_char0_int0 of 0
overload - with sub_char0_char0 of 0
//
(* ****** ****** *)

fun lt_char0_char0
  (c1: char, c2: char):<> bool = "mac#%"
overload < with lt_char0_char0 of 0
fun lte_char0_char0
  (c1: char, c2: char):<> bool = "mac#%"
overload <= with lte_char0_char0 of 0

fun gt_char0_char0
  (c1: char, c2: char):<> bool = "mac#%"
overload > with gt_char0_char0 of 0
fun gte_char0_char0
  (c1: char, c2: char):<> bool = "mac#%"
overload >= with gte_char0_char0 of 0

fun eq_char0_char0
  (c1: char, c2: char):<> bool = "mac#%"
overload = with eq_char0_char0 of 0
fun neq_char0_char0
  (c1: char, c2: char):<> bool = "mac#%"
overload != with neq_char0_char0 of 0
overload <> with neq_char0_char0 of 0

fun compare_char0_char0
  (c1: char, c2: char):<> int = "mac#%"
overload compare with compare_char0_char0 of 0

(* ****** ****** *)
//
castfn g0ofg1_char (c: Char):<> char
castfn g1ofg0_char (c: char):<> Char
//
overload g0ofg1 with g0ofg1_char // index-erasing
overload g1ofg0 with g1ofg0_char // index-inducing
//
(* ****** ****** *)
//
castfn
char2schar1
  {c:int}(c: char (c)):<> schar (c)
castfn
schar2char1
  {c:int}(c: schar (c)):<> char (c)
//
castfn
char2uchar1
  {c:int}(c: char (c)):<> uchar (i2u8(c))
castfn
uchar2char1
  {c:int}(c: uchar (c)):<> char (u2i8(c))
//
(* ****** ****** *)
//
fun
char2int1
  {c:int}(c: char (c)):<> int (c) = "mac#%"
fun
schar2int1
  {c:int}(c: schar (c)):<> int (c) = "mac#%"
fun
uchar2int1
  {c:int}(c: uchar (c)):<> int (c) = "mac#%"
//
(* ****** ****** *)
//
fun
char1_iseqz
  {c:int}(c: char(c)):<> bool(c == 0) = "mac#%"
fun
char1_isneqz
  {c:int}(c: char(c)):<> bool(c != 0) = "mac#%"
//
overload iseqz with char1_iseqz of 10
overload isneqz with char1_isneqz of 10
//
(* ****** ****** *)

fun
lt_char1_char1 {c1,c2:int}
  (c1: char (c1), c2: char (c2)):<> bool (c1 < c2) = "mac#%"
overload < with lt_char1_char1 of 20
fun
lte_char1_char1 {c1,c2:int}
  (c1: char (c1), c2: char (c2)):<> bool (c1 <= c2) = "mac#%"
overload <= with lte_char1_char1 of 20

fun
gt_char1_char1 {c1,c2:int}
  (c1: char (c1), c2: char (c2)):<> bool (c1 > c2) = "mac#%"
overload > with gt_char1_char1 of 20
fun
gte_char1_char1 {c1,c2:int}
  (c1: char (c1), c2: char (c2)):<> bool (c1 >= c2) = "mac#%"
overload >= with gte_char1_char1 of 20

fun
eq_char1_char1 {c1,c2:int}
  (c1: char (c1), c2: char (c2)):<> bool (c1 == c2) = "mac#%"
overload = with eq_char1_char1 of 20
fun
neq_char1_char1 {c1,c2:int}
  (c1: char (c1), c2: char (c2)):<> bool (c1 != c2) = "mac#%"
overload != with neq_char1_char1 of 20
overload <> with neq_char1_char1 of 20

fun compare_char1_char1
  {c1,c2:int}
  (c1: char c1, c2: char c2) :<> int (c1-c2) = "mac#%"
overload compare with compare_char1_char1 of 20

(* ****** ****** *)
//
fun eq_char0_int0 : (char, int) -<fun0> bool = "mac#%"
fun eq_int0_char0 : (int, char) -<fun0> bool = "mac#%"
overload = with eq_char0_int0 of 0
overload = with eq_int0_char0 of 0
fun neq_char0_int0 : (char, int) -<fun0> bool = "mac#%"
fun neq_int0_char0 : (int, char) -<fun0> bool = "mac#%"
overload != with neq_char0_int0 of 0
overload <> with neq_char0_int0 of 0
overload != with neq_int0_char0 of 0
overload <> with neq_int0_char0 of 0
//
fun compare_char0_int0 : (char, int) -<fun0> int = "mac#%"
fun compare_int0_char0 : (int, char) -<fun0> int = "mac#%"
overload compare with compare_char0_int0
overload compare with compare_int0_char0
//
(* ****** ****** *)
//
// unsigned characters
//
(* ****** ****** *)

fun lt_uchar0_uchar0
  (c1: uchar, c2: uchar):<> bool = "mac#%"
overload < with lt_uchar0_uchar0 of 0
fun lte_uchar0_uchar0
  (c1: uchar, c2: uchar):<> bool = "mac#%"
overload <= with lte_uchar0_uchar0 of 0

fun gt_uchar0_uchar0
  (c1: uchar, c2: uchar):<> bool = "mac#%"
overload > with gt_uchar0_uchar0 of 0
fun gte_uchar0_uchar0
  (c1: uchar, c2: uchar):<> bool = "mac#%"
overload >= with gte_uchar0_uchar0 of 0

fun eq_uchar0_uchar0
  (c1: uchar, c2: uchar):<> bool = "mac#%"
overload = with eq_uchar0_uchar0 of 0
fun neq_uchar0_uchar0
  (c1: uchar, c2: uchar):<> bool = "mac#%"
overload != with neq_uchar0_uchar0 of 0
overload <> with neq_uchar0_uchar0 of 0

fun compare_uchar0_uchar0
  (c1: uchar, c2: uchar):<> int = "mac#%"
overload compare with compare_uchar0_uchar0 of 0

(* ****** ****** *)

fun
lt_uchar1_uchar1 {c1,c2:int}
  (c1: uchar (c1), c2: uchar (c2)) :<> bool (c1 < c2) = "mac#%"
overload < with lt_uchar1_uchar1 of 20
fun
lte_uchar1_uchar1 {c1,c2:int}
  (c1: uchar (c1), c2: uchar (c2)) :<> bool (c1 <= c2) = "mac#%"
overload <= with lte_uchar1_uchar1 of 20

fun
gt_uchar1_uchar1 {c1,c2:int}
  (c1: uchar (c1), c2: uchar (c2)) :<> bool (c1 > c2) = "mac#%"
overload > with gt_uchar1_uchar1 of 20
fun
gte_uchar1_uchar1 {c1,c2:int}
  (c1: uchar (c1), c2: uchar (c2)) :<> bool (c1 >= c2) = "mac#%"
overload >= with gte_uchar1_uchar1 of 20

fun
eq_uchar1_uchar1 {c1,c2:int}
  (c1: uchar (c1), c2: uchar (c2)) :<> bool (c1 == c2) = "mac#%"
overload = with eq_uchar1_uchar1 of 20
fun
neq_uchar1_uchar1 {c1,c2:int}
  (c1: uchar (c1), c2: uchar (c2)) :<> bool (c1 != c2) = "mac#%"
overload != with neq_uchar1_uchar1 of 20
overload <> with neq_uchar1_uchar1 of 20

fun compare_uchar1_uchar1
  {c1,c2:int}
  (c1: uchar c1, c2: uchar c2) :<> int (c1-c2) = "mac#%"
overload compare with compare_uchar1_uchar1 of 20

(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)

fun{tk:tk}
g0int_of_char (c: char):<> g0int (tk)
fun{tk:tk}
g0int_of_schar (c: schar):<> g0int (tk)
fun{tk:tk}
g0int_of_uchar (c: uchar):<> g0int (tk)

fun{tk:tk}
g0uint_of_uchar (c: uchar):<> g0uint (tk)

(* ****** ****** *)

fun{tk:tk}
g1int_of_char1 // c:int8
  {c:int} (c: char (c)):<> g1int (tk, c)
// end of [g1int_of_char1]
fun{tk:tk}
g1int_of_schar1 // c:int8
  {c:int} (c: schar (c)):<> g1int (tk, c)
// end of [g1int_of_schar1]
fun{tk:tk}
g1int_of_uchar1 // c:uint8
  {c:int} (c: uchar (c)):<> g1int (tk, c)
// end of [g1int_of_uchar1]

(*
** HX: g1uint_of_schar1: schar -> int -> uint
*)
fun{tk:tk}
g1uint_of_uchar1
  {c:int} (c: uchar (c)):<> g1uint (tk, c)
// end of [g1uint_of_uchar1]

(* ****** ****** *)
//
// HX:
// return is dynamically allocated
//
fun{}
char2string(c: char):<> string
fun{}
char2strptr(c: char):<!wrt> Strptr1
//
(* ****** ****** *)

fun print_char (x: char): void = "mac#%"
fun prerr_char (x: char): void = "mac#%"
overload print with print_char
overload prerr with prerr_char
fun fprint_char : fprint_type (char) = "mac#%"
overload fprint with fprint_char
fun print_schar (x: schar): void = "mac#%"
fun prerr_schar (x: schar): void = "mac#%"
overload print with print_schar
overload prerr with prerr_schar
fun fprint_schar : fprint_type (schar) = "mac#%"
overload fprint with fprint_schar
fun print_uchar (x: uchar): void = "mac#%"
fun prerr_uchar (x: uchar): void = "mac#%"
overload print with print_uchar
overload prerr with prerr_uchar
fun fprint_uchar : fprint_type (uchar) = "mac#%"
overload fprint with fprint_uchar

(* ****** ****** *)

symintr isalpha
fun isalpha_int (c: int):<> bool = "mac#%"
overload isalpha with isalpha_int of 0
fun isalpha_char (c: char):<> bool = "mac#%"
overload isalpha with isalpha_char of 0
symintr isalnum
fun isalnum_int (c: int):<> bool = "mac#%"
overload isalnum with isalnum_int of 0
fun isalnum_char (c: char):<> bool = "mac#%"
overload isalnum with isalnum_char of 0

symintr isascii
fun isascii_int (c: int):<> bool = "mac#%"
overload isascii with isascii_int of 0
fun isascii_char (c: char):<> bool = "mac#%"
overload isascii with isascii_char of 0

symintr isblank
fun isblank_int (c: int):<> bool = "mac#%"
overload isblank with isblank_int of 0
fun isblank_char (c: char):<> bool = "mac#%"
overload isblank with isblank_char of 0
symintr isspace
fun isspace_int (c: int):<> bool = "mac#%"
overload isspace with isspace_int of 0
fun isspace_char (c: char):<> bool = "mac#%"
overload isspace with isspace_char of 0

symintr iscntrl
fun iscntrl_int (c: int):<> bool = "mac#%"
overload iscntrl with iscntrl_int of 0
fun iscntrl_char (c: char):<> bool = "mac#%"
overload iscntrl with iscntrl_char of 0

symintr isdigit
fun isdigit_int (c: int):<> bool = "mac#%"
overload isdigit with isdigit_int of 0
fun isdigit_char (c: char):<> bool = "mac#%"
overload isdigit with isdigit_char of 0
symintr isxdigit
fun isxdigit_int (c: int):<> bool = "mac#%"
overload isxdigit with isxdigit_int of 0
fun isxdigit_char (c: char):<> bool = "mac#%"
overload isxdigit with isxdigit_char of 0

symintr isgraph
fun isgraph_int (c: int):<> bool = "mac#%"
overload isgraph with isgraph_int of 0
fun isgraph_char (c: char):<> bool = "mac#%"
overload isgraph with isgraph_char of 0
symintr isprint
fun isprint_int (c: int):<> bool = "mac#%"
overload isprint with isprint_int of 0
fun isprint_char (c: char):<> bool = "mac#%"
overload isprint with isprint_char of 0
symintr ispunct
fun ispunct_int (c: int):<> bool = "mac#%"
overload ispunct with ispunct_int of 0
fun ispunct_char (c: char):<> bool = "mac#%"
overload ispunct with ispunct_char of 0

symintr islower
fun islower_int (c: int):<> bool = "mac#%"
overload islower with islower_int of 0
fun islower_char (c: char):<> bool = "mac#%"
overload islower with islower_char of 0
symintr isupper
fun isupper_int (c: int):<> bool = "mac#%"
overload isupper with isupper_int of 0
fun isupper_char (c: char):<> bool = "mac#%"
overload isupper with isupper_char of 0

(* ****** ****** *)

fun toascii (c: int):<> int = "mac#%"

(* ****** ****** *)

symintr tolower
fun tolower_int (c: int):<> int = "mac#%"
fun tolower_char (c: char):<> char = "mac#%"
overload tolower with tolower_int
overload tolower with tolower_char

symintr toupper
fun toupper_int (c: int):<> int = "mac#%"
fun toupper_char (c: char):<> char = "mac#%"
overload toupper with toupper_int
overload toupper with toupper_char

(* ****** ****** *)

fun int2digit (i: intBtw(0, 10)): char = "mac#%"
fun int2xdigit (i: intBtw(0, 16)): char = "mac#%"
fun int2xxdigit (i: intBtw(0, 16)): char = "mac#%"

(* ****** ****** *)

symintr c2uc
overload c2uc with char2uchar0 of 0
overload c2uc with char2uchar1 of 10
symintr uc2c
overload uc2c with uchar2char0 of 0
overload uc2c with uchar2char1 of 10

(* ****** ****** *)

symintr char2i
overload char2i with char2int0 of 0
symintr char2ui
overload char2ui with char2uint0 of 0
symintr uchar2i
overload uchar2i with uchar2int0 of 0
symintr uchar2ui
overload uchar2ui with uchar2uint0 of 0

(* ****** ****** *)

symintr char2u2i
overload char2u2i with char2u2int0 of 0
symintr char2u2ui
overload char2u2ui with char2u2uint0 of 0

(* ****** ****** *)
//
fun int2byte0 (i: int): byte = "mac#%"
fun byte2int0 (b: byte):<> int = "mac#%"
//
fun uint2byte0 (u: uint): byte = "mac#%"
fun byte2uint0 (b: byte):<> uint = "mac#%"
//
symintr byte2i
overload byte2i with byte2int0 of 0
symintr i2byte
overload i2byte with int2byte0 of 0
//
symintr byte2ui
overload byte2i with byte2uint0 of 0
symintr ui2byte
overload i2byte with uint2byte0 of 0
//
(* ****** ****** *)

(* end of [char.sats] *)
