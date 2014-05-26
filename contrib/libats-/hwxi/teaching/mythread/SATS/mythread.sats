(***********************************************************************)
(*                                                                     *)
(*                       ATS/contrib/libats-hwxi                       *)
(*                                                                     *)
(***********************************************************************)

(*
** Copyright (C) 2013 Hongwei Xi, ATS Trustful Software, Inc.
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
// HX-2013-10:
// A simple thread interface
//
(* ****** ****** *)
//
#define
ATS_PACKNAME
"ATSCNTRB.libats-hwxi.teaching.mythread"
//
(* ****** ****** *)
//
abst@ype
thread_type = lint
//
typedef thread = thread_type
//
(* ****** ****** *)

absview spin_v (l:addr)

(* ****** ****** *)

abstype spin_type (l:addr) = ptr(l)
typedef spin (l:addr) = spin_type(l)
typedef spin0 = [l:agez] spin_type(l)
typedef spin1 = [l:addr | l > null] spin_type(l)

(* ****** ****** *)

absvtype spin_vtype (l:addr) = ptr(l)
vtypedef spin_vt (l:addr) = spin_vtype(l)

(* ****** ****** *)

castfn
spin2ptr{l:addr} (spin(l)):<> ptr (l)
overload ptrcast with spin2ptr
castfn
spin2ptr_vt{l:addr} (!spin_vt(l)):<> ptr (l)
overload ptrcast with spin2ptr_vt

(* ****** ****** *)

castfn
unsafe_spin_t2vt{l:addr} (spin(l)): spin_vt(l)

(* ****** ****** *)
//
fun spin_create ((*void*)): spin0
fun spin_create_exn ((*void*)): spin1
//
(* ****** ****** *)

fun spin_vt_destroy{l:addr}(spin_vt(l)): void

(* ****** ****** *)
//
fun
spin_lock{l:agz} (x: spin(l)): (spin_v(l) | void)
fun
spin_trylock{l:agz}
  (x: spin(l)): [b:bool] (option_v(spin_v(l), b) | bool(b))
fun
spin_unlock{l:agz} (pf: spin_v(l) | x: spin(l)): void
//
(* ****** ****** *)

absview mutex_v (l:addr)

(* ****** ****** *)

abstype mutex_type (l:addr) = ptr(l)
typedef mutex (l:addr) = mutex_type(l)
typedef mutex0 = [l:agez] mutex_type(l)
typedef mutex1 = [l:addr | l > null] mutex_type(l)

(* ****** ****** *)

absvtype mutex_vtype (l:addr) = ptr(l)
vtypedef mutex_vt (l:addr) = mutex_vtype(l)

(* ****** ****** *)

castfn
mutex2ptr{l:addr} (mutex(l)):<> ptr (l)
overload ptrcast with mutex2ptr
castfn
mutex2ptr_vt{l:addr} (!mutex_vt(l)):<> ptr (l)
overload ptrcast with mutex2ptr_vt

(* ****** ****** *)

castfn
unsafe_mutex_t2vt{l:addr} (mutex(l)): mutex_vt(l)

(* ****** ****** *)
//
fun mutex_create ((*void*)): mutex0
fun mutex_create_exn ((*void*)): mutex1
//
(* ****** ****** *)

fun mutex_vt_destroy{l:addr}(mutex_vt(l)): void

(* ****** ****** *)
//
fun
mutex_lock{l:agz} (m: mutex(l)): (mutex_v(l) | void)
fun
mutex_trylock{l:agz}
  (m: mutex(l)): [b:bool] (option_v(mutex_v(l), b) | bool(b))
fun
mutex_unlock{l:agz} (pf: mutex_v(l) | m: mutex(l)): void
//
(* ****** ****** *)
//
abstype condvar_type(l:addr) = ptr(l)
typedef condvar (l:addr) = condvar_type(l)
typedef condvar0 = [l:agez] condvar_type(l)
typedef condvar1 = [l:addr | l > null] condvar_type(l)
//
(* ****** ****** *)

absvtype condvar_vtype (l:addr) = ptr(l)
vtypedef condvar_vt (l:addr) = condvar_vtype(l)

(* ****** ****** *)

castfn
condvar2ptr{l:addr} (condvar(l)):<> ptr (l)
overload ptrcast with condvar2ptr
castfn
condvar2ptr_vt{l:addr} (!condvar_vt(l)):<> ptr (l)
overload ptrcast with condvar2ptr_vt

(* ****** ****** *)

castfn
unsafe_condvar_t2vt{l:addr} (condvar(l)): condvar_vt(l)

(* ****** ****** *)
//
fun condvar_create (): condvar0
fun condvar_create_exn (): condvar1
//
(* ****** ****** *)

fun condvar_vt_destroy{l:addr}(condvar_vt(l)): void

(* ****** ****** *)
//
fun condvar_signal (cv: condvar1): void
fun condvar_broadcast (cv: condvar1): void
//
fun
condvar_wait{l:agz}
  (pf: !mutex_v (l) | cv: condvar1, p: mutex (l)): void
//
(* ****** ****** *)
//
fun mythread_create_funenv
  {env:vtype} (fwork: (env) -> void, env: env): void
//
fun mythread_create_cloptr (fwork: () -<lincloptr1> void): void
//
(* ****** ****** *)

(* end of [mythread.sats] *)
