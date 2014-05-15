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

(* end of [ev.sats] *)
