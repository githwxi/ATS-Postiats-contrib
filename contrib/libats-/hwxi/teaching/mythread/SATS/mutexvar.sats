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
// HX-2014-05:
// This is based on mutex
//
(* ****** ****** *)
//
// HX-2014-05:
// [mutexvar_type] is invariant
// [mutexvar_ticket_type] is invariant
//
absvtype
mutexvar_vtype (a:vt@ype, int) = ptr
vtypedef mutexvar (a:vt0p, i) = mutexvar_vtype (a, i)
//
absvtype
mutexvar_ticket_vtype (a:vt@ype) = ptr
vtypedef
mutexvar_ticket(a:vt0p) = mutexvar_ticket_vtype(a)
//
(* ****** ****** *)

fun{a:vt0p}
mutexvar_create_exn (): mutexvar(a, 0)

(* ****** ****** *)
//
fun{}
mutexvar_destroy{a:vt0p}(mutexvar(a, 0)): void
//
(* ****** ****** *)
//
fun{a:vt0p}
mutexvar_initiate
(
  mutexvar: !mutexvar(a, 0) >> mutexvar(a, 1)
) : mutexvar_ticket(a) // end-of-fun
//
(* ****** ****** *)
//
fun{a:vt0p}
mutexvar_waitfor
  (mutexvar: !mutexvar(a, 1) >> mutexvar(a, 0)): (a)
//
(* ****** ****** *)

fun{a:vt0p}
mutexvar_ticket_put (ticket: mutexvar_ticket(a), x: a): void

(* ****** ****** *)

(* end of [mutexvar.sats] *)
