(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)

(*
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
** Start Time: October, 2015
*)

(* ****** ****** *)
//
// HX-2015-11-25:
//
(* ****** ****** *)

#define
ATS_STALOADFLAG 0 // no staloading at run-time
#define
ATS_EXTERN_PREFIX "ats2js_worker_" // prefix for external names

(* ****** ****** *)
//
// Session Combinators
//
(* ****** ****** *)

staload "./channel.sats"

(* ****** ****** *)
//
abstype
chanpos_session(ss:type)
abstype
channeg_session(ss:type)
//
(* ****** ****** *)
//
fun
chanpos1_session_nil(): chanpos_session(chnil)
//
fun{}
chanpos1_session_cons
  {a:type}{ss:type}
(
  chanpos_session(chsing(a)), chanpos_session(ss)
) : chanpos_session(a::ss)
//
(* ****** ****** *)
//
fun
channeg1_session_nil(): channeg_session(chnil)
//
fun{}
channeg1_session_cons
  {a:type}{ss:type}
(
  channeg_session(chsing(a)), channeg_session(ss)
) : channeg_session(a::ss)
//
(* ****** ****** *)
//
fun{}
chanpos1_session_append
  {ss1,ss2:type}
(
  ssp1: chanpos_session(ss1)
, ssp2: chanpos_session(ss2)
) : chanpos_session(ssappend(ss1, ss2))
//
fun{}
channeg1_session_append
  {ss1,ss2:type}
(
  ssn1: channeg_session(ss1)
, ssn2: channeg_session(ss2)
) : channeg_session(ssappend(ss1, ss2))
//
(*
overload ssappend with chanpos1_session_append
overload ssappend with channeg1_session_append
*)
//
(* ****** ****** *)
//
fun{}
chanpos1_session_option_conj
  {ss:type}
(
  ssp: chanpos_session(ss)
) : chanpos_session(ssoption_conj(ss))
//
fun{}
channeg1_session_option_conj
  {ss:type}
(
  ssn: channeg_session(ss)
) : channeg_session(ssoption_conj(ss))
//
(* ****** ****** *)
//
fun{}
chanpos1_session_option_disj
  {ss:type}
(
  ssp: chanpos_session(ss)
) : chanpos_session(ssoption_disj(ss))
//
fun{}
channeg1_session_option_disj
  {ss:type}
(
  ssp: channeg_session(ss)
) : channeg_session(ssoption_disj(ss))
//
(* ****** ****** *)
//
fun{}
chanpos1_session_repeat_conj
  {ss:type}
(
  ssp: chanpos_session(ss)
) : chanpos_session(ssrepeat_conj(ss))
//
fun{}
channeg1_session_repeat_conj
  {ss:type}
(
  ssn: channeg_session(ss)
) : channeg_session(ssrepeat_conj(ss))
//
(* ****** ****** *)
//
fun{}
chanpos1_session_repeat_disj
  {ss:type}
(
  ssp: chanpos_session(ss)
) : chanpos_session(ssrepeat_disj(ss))
//
fun{}
channeg1_session_repeat_disj
  {ss:type}
(
  ssn: channeg_session(ss)
) : channeg_session(ssrepeat_disj(ss))
//
(* ****** ****** *)
//
fun{
a:t@ype
} chanpos1_session_send_cloref
  (cfun0(a)): chanpos_session(chsnd(a)::chnil)
fun{
a:t@ype
} chanpos1_session_recv_cloref
  (cfun1(a, void)): chanpos_session(chrcv(a)::chnil)
//
(* ****** ****** *)
//
fun{
a:t@ype
} channeg1_session_recv_cloref
  (cfun0(a)): channeg_session(chrcv(a)::chnil)
fun{
a:t@ype
} channeg1_session_send_cloref
  (cfun1(a, void)): channeg_session(chsnd(a)::chnil)
//
(* ****** ****** *)
//
// HX-2105-12-03:
// [chanpos1_session_run]
// should be called only once in a worker
//
fun
chanpos1_session_run
  {ss:type}
(
  chanpos_session(ss)
, chp: chanpos(ss), kx0: chpcont0_nil(*void*)
) : void = "mac#%"
//
fun
chanpos1_session_run_close
  {ss:type}(chanpos_session(ss), chanpos(ss)): void = "mac#%"
//
(* ****** ****** *)
//
fun
channeg1_session_run
  {ss:type}
(
  channeg_session(ss)
, chn: channeg(ss), kx0: chncont0_nil(*void*)
) : void = "mac#%"
//
fun
channeg1_session_run_close
  {ss:type}(channeg_session(ss), channeg(ss)): void = "mac#%"
//
(* ****** ****** *)

(* end of [channel_session.sats] *)
