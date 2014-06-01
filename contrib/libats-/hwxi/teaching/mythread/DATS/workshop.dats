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

(*
** HX-2014-06-01: Start it now!
*)

(* ****** ****** *)
//
staload
AT = "libats/SATS/athread.sats"
//
(* ****** ****** *)

staload "./../SATS/channel.sats"
staload "./../SATS/workshop.sats"

(* ****** ****** *)

typedef tid = $AT.thread
typedef spin1 = $AT.spin1

(* ****** ****** *)

vtypedef
workshop_struct
  (a:vt0p) =
@{
//
WS_spin= spin1
//
,
WS_chan= channel(a)
,
WS_workers= List0_vt(tid)
//
} (* end of [workshop_struct] *)

(* ****** ****** *)

assume
workshop = ref (workshop_struct)

(* ****** ****** *)

implement
{a}(*tmp*)
workshop_add_worker
  (ws) = let
in
end // end of [workshop_add_worker]

(* ****** ****** *)

(* end of [workshop.dats] *)
