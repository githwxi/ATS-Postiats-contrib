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
// HX-2014-02-06
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload
STDLIB = "libc/SATS/stdlib.sats"
staload TIME = "libc/SATS/time.sats"
//
staload
STAT = "libc/sys/SATS/stat.sats"
staload
TYPES = "libc/sys/SATS/types.sats"
//
(* ****** ****** *)

fun{
} test_file_ixoth
  (path: string): int = let
//
macdef S_IXOTH = $UN.cast2uint($STAT.S_IXOTH)
//
in
  test_file_mode (path, lam (mode) => (mode land S_IXOTH) != 0u)
end // end of [test_file_ixoth]

(* ****** ****** *)

extern
fun{}
randint{n:pos}(int(n)): natLt(n)
implement{}
randint{n}(n) = let
  val x = $STDLIB.random()
in
  $UN.cast{natLt(n)}(x mod $UN.cast2lint(n))
end // end of [randint]

(* ****** ****** *)

extern
fun{}
srandom_with_time((*void*)): void
implement{}
srandom_with_time () =
  $STDLIB.srandom($UN.cast{uint}($TIME.time_get()))
// end of [srandom_with_time]

(* ****** ****** *)

extern
fun{}
srand48_with_time((*void*)): void
implement{}
srand48_with_time () =
  $STDLIB.srand48($UN.cast{lint}($TIME.time_get()))
// end of [srand48_with_time]

(* ****** ****** *)
//
extern
fun{}
string_split_delim_string
  (source: string, delim: string): List0_vt(Strptr1)
//
implement{}
string_split_delim_string
  (source, delim) = let
//
#define NUL '\000'
vtypedef res = List0_vt(Strptr1)
//
fun loop
(
  p: ptr, res: res
) : res = let
//
val str = $UN.cast{String}(p)
val len = strspn (str, delim)
val p2 = ptr_add<char> (p, len)
val str2 = $UN.cast{String}(p2)
val len2 = strcspn (str2, delim)
//
in
//
if
len2 = 0
then res
else let
  val x =
  string_make_substring (str2, i2sz(0), len2)
  prval () = lemma_strnptr_param (x)
  val res = list_vt_cons (strnptr2strptr (x), res)
in
  loop (ptr_add<char> (p2, len2), res)
end // end of [else]
//
end // end of [loop]
//
val res =
  loop (string2ptr(source), list_vt_nil(*void*))
//
in
  list_vt_reverse<Strptr1> (res)
end // end of [string_split_delim_string]

(* ****** ****** *)

(* end of [BUCS.dats] *)
