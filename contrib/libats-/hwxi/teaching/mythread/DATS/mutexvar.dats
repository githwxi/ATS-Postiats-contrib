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

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./../SATS/mutexvar.sats"
staload "./../SATS/mythread.sats"

(* ****** ****** *)
//
datavtype
mutexvar_vt (a:vt0p) =
{l:agz} MUTEXVAR of (mutex(l), a)
//
(* ****** ****** *)
//
assume
mutexvar_vtype
  (a:vt0p, i:int) = mutexvar_vt(a)
//
(* ****** ****** *)

implement{a}
mutexvar_create_exn () = let
//
val mtx = mutex_create_exn ()
//
in
  $UN.castvwtp0{mutexvar(a,0)}(MUTEXVAR{a}(mtx, _))
end // end of [mutexvar_create_exn]

(* ****** ****** *)

implement{}
mutexvar_destroy
  (mtxv) = () where
{
//
val+~MUTEXVAR (mtx, x) = mtxv
//
val mtx = unsafe_mutex_t2vt (mtx)
val ((*freed*)) = mutex_vt_destroy (mtx)
//
prval ((*void*)) = $UN.castview0{void}(x)
//
} // end of [mutexvar_destroy]

(* ****** ****** *)

implement
{a}(*tmp*)
mutexvar_initiate
  (mtxv) = let
//
val+MUTEXVAR(mtx, _) = mtxv
//
val (pf | ()) = mutex_lock (mtx)
prval ((*void*)) = $UN.castview0{void}(pf)
//
in
  $UN.castvwtp1{mutexvar_ticket(a)}(mtxv)
end // end of [mutexvar_initiate]

(* ****** ****** *)

implement
{a}(*tmp*)
mutexvar_waitfor
  (mtxv) = x_ where
{
//
val+@MUTEXVAR(mtx, x) = mtxv
//
val (pf | ()) = mutex_lock (mtx)
val x_ = $UN.ptr0_get<a> (addr@x)
val ((*void*)) = mutex_unlock (pf | mtx)
//
prval ((*void*)) = fold@ (mtxv)
//
} // end of [mutexvar_waitfor]

(* ****** ****** *)

implement
{a}(*tmp*)
mutexvar_ticket_put
  (tick, x) = () where
{
//
val mtxv =
$UN.castvwtp0{mutexvar_vt(a)}(tick)
//
val+@MUTEXVAR(mtx, x0) = mtxv
val () = $UN.ptr0_set<a> (addr@x0, x)
//
prval pf =
__assert (mtx) where
{
  extern praxi __assert {l:addr} (!mutex(l)): mutex_v(l)
} (* end of [prval] *)
val () = mutex_unlock (pf | mtx)
//
prval () = fold@ (mtxv)
prval () = $UN.castvwtp0{void}(mtxv)
//
} // end of [mutexvar_ticket_put]

(* ****** ****** *)

(* end of [mutexvar.dats] *)
