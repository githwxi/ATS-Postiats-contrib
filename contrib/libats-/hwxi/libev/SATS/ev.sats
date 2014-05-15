(*
** Copyright (C) 2014 Hongwei Xi.
**
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start Time: May, 2014
//
(* ****** ****** *)

%{#
//
#include "libev/CATS/ev.cats"
//
%} // end of [%{]

(* ****** ****** *)

#define ATS_PACKNAME "ATSCNTRB.libev"
#define ATS_STALOADFLAG 0 // no static loading at run-time
#define ATS_EXTERN_PREFIX "atscntrb_libev_" // prefix for external names

(* ****** ****** *)
//
macdef EV_UNDEF = $extval (uint, "EV_UNDEF")
macdef EV_NONE = $extval (uint, "EV_NONE")
macdef EV_READ = $extval (uint, "EV_READ")
macdef EV_WRITE = $extval (uint, "EV_WRITE")
macdef EV__IOFDSET = $extval (uint, "EV__IOFDSET")
macdef EV_IO = $extval (uint, "EV_IO")
macdef EV_TIMER = $extval (uint, "EV_TIMER")
macdef EV_TIMEOUT = $extval (uint, "EV_TIMEOUT")
macdef EV_PERIODIC = $extval (uint, "EV_PERIODIC")
macdef EV_SIGNAL = $extval (uint, "EV_SIGNAL")
macdef EV_CHILD = $extval (uint, "EV_CHILD")
macdef EV_STAT = $extval (uint, "EV_STAT")
macdef EV_IDLE = $extval (uint, "EV_IDLE")
macdef EV_PREPARE = $extval (uint, "EV_PREPARE")
macdef EV_CHECK = $extval (uint, "EV_CHECK")
macdef EV_EMBED = $extval (uint, "EV_EMBED")
macdef EV_FORK = $extval (uint, "EV_FORK")
macdef EV_CLEANUP = $extval (uint, "EV_CLEANUP")
macdef EV_ASYNC = $extval (uint, "EV_ASYNC")
macdef EV_CUSTOM = $extval (uint, "EV_CUSTOM")
macdef EV_ERROR = $extval (uint, "EV_ERROR")
//
(* ****** ****** *)

(*
**
** Global Functions
**
*)

(* ****** ****** *)

abst@ype
ev_tstamp = $extype"ev_tstamp"

(* ****** ****** *)
//
castfn ev_tstamp_of_int: int -> ev_tstamp
castfn ev_tstamp_of_double: double -> ev_tstamp
//
symintr ev_tstamp
overload ev_tstamp with ev_tstamp_of_int
overload ev_tstamp with ev_tstamp_of_double
//
(* ****** ****** *)

fun ev_time ((*void*)): ev_tstamp = "mac#%"

(* ****** ****** *)

fun ev_sleep (interval: ev_tstamp): void = "mac#%"

(* ****** ****** *)

macdef
EV_VERSION_MAJOR = $extval (int, "EV_VERSION_MAJOR")
macdef
EV_VERSION_MINOR = $extval (int, "EV_VERSION_MINOR")

(* ****** ****** *)

fun ev_version_major ((*void*)): int = "mac#%"
fun ev_version_minor ((*void*)): int = "mac#%"

(* ****** ****** *)
  
fun ev_supported_backends ((*void*)): uint = "mac#%"
fun ev_recommended_backends ((*void*)): uint = "mac#%"
fun ev_embeddable_backends ((*void*)): uint = "mac#%"
  
(* ****** ****** *)

fun ev_feed_signal (signum: int): void = "mac#%"

(* ****** ****** *)

abstype ev_loop_ref = ptr // HX: NZ
absvtype ev_loop_ptr(l:addr) = ptr(l)

(* ****** ****** *)
//
vtypedef
ev_loop_ptr0 = [l:agez] ev_loop_ptr(l)
vtypedef
ev_loop_ptr1 = [l:addr | l > null] ev_loop_ptr(l)
//
(* ****** ****** *)
//
castfn
ev_loop_ptr2ptr
  {l:addr}(!ev_loop_ptr(l)):<> ptr(l)
//
overload ptrcast with ev_loop_ptr2ptr
//
(* ****** ****** *)
//
// HX: only for muliplicity build
//
macdef
EV_DEFAULT = $extval (ev_loop_ref, "EV_DEFAULT")

(* ****** ****** *)

fun
ev_default_loop (flags: int): ev_loop_ref = "mac#%"

(* ****** ****** *)
//
abst@ype
ev_io = $extype"ev_io"
typedef
ev_io_callback =
  (ev_loop_ref, &ev_io >> _, int(*revents*)) -> void
//
(* ****** ****** *)

fun ev_init_io
  (watcher: &ev_io? >> _, ev_io_callback): void = "mac#%"

(* ****** ****** *)

(*
ev_TYPE_set (ev_TYPE *watcher, [args])
ev_TYPE_init (ev_TYPE *watcher, callback, [args])
*)

(* ****** ****** *)
//
fun ev_io_start
  (ev_loop_ref, watcher: &ev_io >> _): void = "mac#%"
//
fun ev_io_stop (ev_loop_ref, &ev_io >> _): void = "mac#%"
//
(* ****** ****** *)

abst@ype
ev_timer = $extype"ev_timer"
typedef
ev_timer_callback = (ev_loop_ref, &ev_timer >> _, int(*revents*)) -> void

(* ****** ****** *)

fun ev_init_timer
  (watcher: &ev_timer? >> _, ev_timer_callback): void = "mac#%"

(* ****** ****** *)

(*
ev_TYPE_set (ev_TYPE *watcher, [args])
ev_TYPE_init (ev_TYPE *watcher, callback, [args])
*)

(* ****** ****** *)
//
fun ev_timer_start
  (ev_loop_ref, watcher: &ev_timer >> _): void = "mac#%"
//
fun ev_timer_stop (ev_loop_ref, &ev_timer >> _): void = "mac#%"
//
(* ****** ****** *)
//
macdef
EVRUN_NOWAIT = $extval (int, "EVRUN_NOWAIT")
macdef EVRUN_ONCE = $extval (int, "EVRUN_ONCE")
//
fun ev_run (loop: ev_loop_ref, flags: int): void = "mac#%"
//
(* ****** ****** *)
//
abst@ype
ev_break_how = int
//
macdef
EVBREAK_CANCEL =
$extval (ev_break_how, "EVBREAK_CANCEL")
macdef
EVBREAK_ONE = $extval (ev_break_how, "EVBREAK_ONE")
macdef
EVBREAK_ALL = $extval (ev_break_how, "EVBREAK_ALL")
//
fun ev_break (loop: ev_loop_ref, how: ev_break_how): void = "mac#%"
//
(* ****** ****** *)

(* end of [ev.sats] *)
