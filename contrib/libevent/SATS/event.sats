(*
** Copyright (C) 2011 Chris Double.
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

(*
** Author: Hongwei Xi
** Authoremail: gmhwxi AT gmail DOT com
** Time: September, 2012
**
** The API is modified in the hope that it can be used more conveniently.
*)

(* ****** ****** *)

#define ATS_PACKNAME "ATSCNTRB.libevent"
#define ATS_STALOADFLAG 0 // no static loading at run-time
#define ATS_EXTERN_PREFIX "atscntrb_libevent_" // prefix for external names

(* ****** ****** *)

typedef SHR(x:type) = x // for commenting purpose
typedef NSH(x:type) = x // for commenting purpose

(* ****** ****** *)

typedef interr = intBtwe(~1,0)
typedef interr2 = intBtwe(~1,1)

(* ****** ****** *)

absvt@ype
event = $extype"event_struct"

(* ****** ****** *)

absvtype eventp (l:addr) = ptr (l)
vtypedef eventp0 = [l:addr] eventp (l)
vtypedef eventp1 = [l:addr | l > null] eventp (l)

(* ****** ****** *)

prfun
eventp_is_gtez
  {l:addr} (p: !eventp(l)):<> [l >= null] void
// end of [eventp_is_gtez]

(* ****** ****** *)

fun eventp_null
  ((*void*)):<> eventp (null) = "mac#atspre_ptr_null"
// end of [eventp_null]

prfun eventp_free_null {l:alez} (p: eventp l):<> void

(* ****** ****** *)
//
castfn
eventp2ptr
  {l:addr}(!eventp(l)):<> ptr(l)
//
overload ptrcast with eventp2ptr
//
(* ****** ****** *)

fun
eventp_is_null
  {l:addr}
  (p: !eventp l):<> bool (l==null) = "mac#atspre_ptr_is_null"
fun eventp_isnot_null
  {l:addr}
  (p: !eventp l):<> bool (l > null) = "mac#atspre_ptr_isnot_null"
//
overload iseqz with eventp_is_null
overload isneqz with eventp_isnot_null
//
(* ****** ****** *)

absvtype
eventp_base (l:addr) = ptr (l)
vtypedef
eventp0_base = [l:addr] eventp_base (l)
vtypedef
eventp1_base = [l:addr | l > null] eventp_base (l)

(* ****** ****** *)

prfun
eventp_base_is_gtez
  {l:addr} (p: !eventp_base l):<> [l >= null] void
// end of [eventp_base_is_gtez]

fun eventp_base_null
  ((*void*)):<> eventp_base (null) = "mac#atspre_ptr_null"

prfun
eventp_base_free_null {l:alez} (p: eventp_base (l)):<> void

(* ****** ****** *)
//
castfn
eventp2ptr_base
  {l:addr}(p: !eventp(l)):<> ptr(l)
//
overload ptrcast with eventp2ptr_base
//
(* ****** ****** *)

fun
eventp_base_is_null
  {l:addr}
  (p: !eventp_base l):<> bool (l==null) = "mac#atspre_ptr_is_null"
fun
eventp_base_isnot_null
  {l:addr}
  (p: !eventp_base l):<> bool (l > null) = "mac#atspre_ptr_isnot_null"
//
overload iseqz with eventp_base_is_null
overload isneqz with eventp_base_isnot_null
//
(* ****** ****** *)

absvtype
eventp_config (l:addr) = ptr (l)
vtypedef
eventp0_config = [l:addr] eventp_config (l)
vtypedef
eventp1_config = [l:addr | l > null] eventp_config (l)

(* ****** ****** *)

prfun
eventp_config_is_gtez
  {l:addr} (p: !eventp_config l):<> [l >= null] void
// end of [eventp_config_is_gtez]

(* ****** ****** *)

fun
eventp_config_null
(
// argumentless
) :<> eventp_config (null) = "mac#atspre_ptr_null"

(* ****** ****** *)

prfun
eventp_config_free_null
  {l:addr | l <= null} (p: eventp_config l):<> void
// end of [eventp_config_free_null]

(* ****** ****** *)
//
castfn
eventp2ptr_config
  {l:addr}(p: eventp (l)):<> ptr (l)
//
overload ptrcast with eventp2ptr_config
//
(* ****** ****** *)

fun
eventp_config_is_null
  {l:addr}
  (p: !eventp_config l):<> bool (l==null) = "mac#atspre_ptr_is_null"
fun
eventp_config_isnot_null
  {l:addr}
  (p: !eventp_config l):<> bool (l > null) = "mac#atspre_ptr_isnot_null"
//
overload iseqz with eventp_config_is_null
overload isneqz with eventp_config_isnot_null
//
(* ****** ****** *)
//
fun event_enable_debug_mode ((*void*)): void = "mac#%"
fun event_debug_unassign (ev: !eventp1): void = "mac#%"
//  
(* ****** ****** *)
//
fun eventp_config_new (): eventp0_config = "mac#%"
fun eventp_config_free (p: eventp0_config): void = "mac#%"
//
fun eventp_config_avoid_method
  (cfg: !eventp1_config, method: NSH(string)): interr = "mac#%"
//
(* ****** ****** *)

fun event_base_new (): eventp0_base = "mac#%"
fun event_reinit (evb: !eventp1_base): interr = "mac#%"
fun event_base_dispatch (evb: !eventp1_base): interr2 = "mac#%"
fun event_base_get_method (evb: !eventp1_base): string = "mac#%"

(* ****** ****** *)
//
abst@ype
event_method_feature = $extype"event_method_feature"
//
macdef EV_FEATURE_ET = $extval (event_method_feature, "EV_FEATURE_ET")
macdef EV_FEATURE_O1 = $extval (event_method_feature, "EV_FEATURE_O1")
macdef EV_FEATURE_FDS = $extval (event_method_feature, "EV_FEATURE_FDS")
//
(* ****** ****** *)
//
abst@ype
event_base_config_flag = $extype"event_base_config_flag"
//
macdef
EVENT_BASE_FLAG_NOLOCK = $extval (event_base_config_flag, "EVENT_BASE_FLAG_NOLOCK")
macdef
EVENT_BASE_FLAG_IGNORE_ENV = $extval (event_base_config_flag, "EVENT_BASE_FLAG_IGNORE_ENV")
macdef
EVENT_BASE_FLAG_NO_CACHE_TIME = $extval (event_base_config_flag, "EVENT_BASE_FLAG_NO_CACHE_TIME")
macdef
EVENT_BASE_FLAG_EPOLL_USE_CHANGELIST = $extval (event_base_config_flag, "EVENT_BASE_FLAG_EPOLL_USE_CHANGELIST")
//
(* ****** ****** *)
//
fun
event_base_get_features
  (evb: !eventp1_base): int = "mac#%"
fun
event_config_require_features
  (cfg: !eventp1_config, feature:int): interr = "mac#%"
//
fun
event_config_set_flag
  (cfg: !eventp1_config, flag: int): int = "mac#%"
fun
event_config_set_num_cpus_hint
  (cfg: !eventp1_config, cpus: int): interr = "mac#%"
//
fun
event_base_new_with_config
  (cfg: !eventp1_config): eventp0_base = "mac#%"
//
fun event_base_free (evb: eventp0_base):void = "mac#%"
//
(* ****** ****** *)
  
#define _EVENT_LOG_DEBUG 0
#define _EVENT_LOG_MSG   1
#define _EVENT_LOG_WARN  2
#define _EVENT_LOG_ERR   3

(* ****** ****** *)
//
typedef
event_log_cb = (int, string) -> void
fun event_set_log_callback(cb: event_log_cb): void = "mac#%"
//
typedef event_fatal_cb = (int) -> void
fun event_set_fatal_callback(cb: event_fatal_cb):void = "mac#%"
//
fun event_base_set (evb: !eventp1_base, ev: !eventp1): int = "mac#%"
//
(* ****** ****** *)

#define EVLOOP_ONCE 0x01
#define EVLOOP_NONBLOCK 0x02
  
(* ****** ****** *)
//  
fun
event_base_loop
  (evb: !eventp1_base, flag: int): interr2 = "mac#%"
//
fun
event_base_loopexit
  (evb: !eventp1_base, timeval: ptr): interr = "mac#%"
fun event_base_loopbreak (evb: !eventp1_base): interr = "mac#%"
//
fun event_base_got_exit (evb: !eventp1_base): intGte(0) = "mac#%"
//
(* ****** ****** *)

(* end of [event.sats] *)
