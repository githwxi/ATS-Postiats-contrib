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
** $PATSHOME/prelude/DATS/CODEGEN/tostring.atxt
** Time of generation: Sun Nov 20 21:18:29 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxiATgmailDOTcom *)
(* Start time: April, 2015 *)

(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tostring_int(i) = 
$effmask_wrt
(
  strptr2string(tostrptr_int(i))
)
implement
{}(*tmp*)
tostrptr_int(i) = let
//
#define BSZ 32
//
typedef
cstring = $extype"atstype_string"
//
var buf = @[byte][BSZ]()
val bufp = $UN.cast{cstring}(addr@buf)
//
val _(*int*) =
  $extfcall(ssize_t, "snprintf", bufp, BSZ, "%i", i)
//
in
//
$UN.castvwtp0{Strptr1}(string0_copy($UN.cast{string}(bufp)))
//
end // end of [tostrptr_int]
//
implement
tostring_val<int> = tostring_int
implement
tostrptr_val<int> = tostrptr_int
//
(* ****** ****** *)
//
implement
tostrptr_val<lint> = g0int2string_lint
implement
tostrptr_val<llint> = g0int2string_llint
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tostring_uint(u) = 
$effmask_wrt
(
  strptr2string(tostrptr_uint(u))
)
implement
{}(*tmp*)
tostrptr_uint(u) = let
//
#define BSZ 32
//
typedef
cstring = $extype"atstype_string"
//
var buf = @[byte][BSZ]()
val bufp = $UN.cast{cstring}(addr@buf)
//
val _(*int*) =
  $extfcall(ssize_t, "snprintf", bufp, BSZ, "%u", u)
//
in
//
$UN.castvwtp0{Strptr1}(string0_copy($UN.cast{string}(bufp)))
//
end // end of [tostrptr_uint]
//
implement
tostring_val<uint> = tostring_uint
implement
tostrptr_val<uint> = tostrptr_uint
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tostring_bool(b) = bool2string(b)
implement
{}(*tmp*)
tostrptr_bool(b) = string0_copy(bool2string(b))
//
implement
tostring_val<bool> = tostring_bool
implement
tostrptr_val<bool> = tostrptr_bool
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tostring_char(c) =
$effmask_wrt
(
  strptr2string(char2strptr(c))
)
//
implement
{}(*tmp*)
tostrptr_char(c) = char2strptr(c)
//
implement
tostring_val<char> = tostring_char
implement
tostrptr_val<char> = tostrptr_char
//
(* ****** ****** *)

implement
{}(*tmp*)
tostring_double(i) = 
$effmask_wrt
(
  strptr2string(tostrptr_double(i))
)
implement
{}(*tmp*)
tostrptr_double(x) = let
//
#define BSZ 32
//
typedef
cstring = $extype"atstype_string"
//
var buf = @[byte][BSZ]()
val bufp = $UN.cast{cstring}(addr@buf)
//
val _(*int*) =
  $extfcall(ssize_t, "snprintf", bufp, BSZ, "%.6f", x)
//
in
//
$UN.castvwtp0{Strptr1}(string0_copy($UN.cast{string}(bufp)))
//
end // end of [tostrptr_double]
//
implement
tostring_val<double> = tostring_double
implement
tostrptr_val<double> = tostrptr_double
//
(* ****** ****** *)

implement
{a}(*tmp*)
tostrptr_list(xs) = let
//
fun
loop
(
  i: int
, xs: List(a)
, res: List0_vt(Strptr1)
) : List0_vt(Strptr1) =
(
case+ xs of
| list_nil
    ((*void*)) => res
| list_cons
    (x, xs) => let
    val res1 = 
    (
      if i > 0
        then let
          val sep =
            tostrptr_list$sep<> ()
          // end of [val]
          val sep = string0_copy (sep)
        in
          list_vt_cons (sep, res)
        end // end of [then]
        else res // end of [else]
    ) : List0_vt(Strptr1)
    val xrep = tostrptr_val<a> (x)
    val res2 = list_vt_cons (xrep, res1)
  in
    loop (i+1, xs, res2)
  end // end of [list_cons]
)
//
val res = list_vt_nil ()
//
val _beg =
  tostrptr_list$beg<> ()
val _beg = string0_copy(_beg)
val res = list_vt_cons (_beg, res)
//
val res = loop (0, xs, res)
//
val _end =
  tostrptr_list$end<> ()
val _end = string0_copy(_end)      
val res = list_vt_cons (_end, res)
//
val res = list_vt_reverse<Strptr1> (res)
//
in
//
$UN.castvwtp0{Strptr1}(strptrlst_concat(res))
//
end // end of [tostrptr_list]

(* ****** ****** *)
//
implement{} tostrptr_list$beg() = ""
implement{} tostrptr_list$end() = ""
implement{} tostrptr_list$sep() = ""
//
(* ****** ****** *)
//
implement(a)
tostrptr_val<List(a)>
  (xs0) = $effmask_all (tostrptr_list<a> (xs0))
//
(* ****** ****** *)

implement
{a}(*tmp*)
tostrptr_array
  (A, n) = let
//
fun
loop{n:int}
(
  i: int
, p: ptr, n: size_t(n)
, res: List0_vt(Strptr1)
) : List0_vt(Strptr1) =
(
if
(n > 0)
then let
//
  val res1 = 
  (
    if i > 0
      then let
        val sep =
          tostrptr_array$sep<> ()
        // end of [val]
        val sep = string0_copy (sep)
      in
        list_vt_cons (sep, res)
      end // end of [then]
      else res // end of [else]
  ) : List0_vt(Strptr1)
//
  val
  (pf, fpf | p) =
    $UN.ptr_vtake{a}(p)
  // end of [val]
  val xrep = tostrptr_ref<a> (!p)
  prval ((*returned*)) = fpf (pf)
//
  val res2 = list_vt_cons (xrep, res1)
//
in
  loop (i+1, ptr_succ<a>(p), pred(n), res2)
end // end of [then]
else res // end of [else]
//
) (* end of [loop] *)
//
val res = list_vt_nil ()
//
val _beg =
  tostrptr_array$beg<> ()
val _beg = string0_copy(_beg)
val res = list_vt_cons (_beg, res)
//
val res = loop (0, addr@A, n, res)
//
val _end =
  tostrptr_array$end<> ()
val _end = string0_copy(_end)      
val res = list_vt_cons (_end, res)
//
val res = list_vt_reverse<Strptr1> (res)
//
in
//
$UN.castvwtp0{Strptr1}(strptrlst_concat(res))
//
end // end of [tostrptr_array]

(* ****** ****** *)
//
implement{} tostrptr_array$beg() = ""
implement{} tostrptr_array$end() = ""
implement{} tostrptr_array$sep() = ""
//
(* ****** ****** *)

implement
{a}(*tmp*)
tostrptr_arrayref
  (A, n) = let
//
val (vbox pf | p) =
  arrayref_get_viewptr(A)
//
in
//
$effmask_ref(tostrptr_array<a> (!p, n))
//
end // end of [tostrptr_arrayref]

(* ****** ****** *)

implement
{a}(*tmp*)
tostrptr_arrszref
  (ASZ) = let
//
var n: size_t
val A = arrszref_get_refsize (ASZ, n)
//
in
  tostrptr_arrayref<a> (A, n)
end // end of [tostrptr_arrszref]

(* ****** ****** *)

(* end of [tostring.dats] *)
