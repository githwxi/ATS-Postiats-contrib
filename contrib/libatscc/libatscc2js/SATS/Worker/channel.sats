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
// HX-2015-10-25:
//
(* ****** ****** *)

#define
ATS_STALOADFLAG 0 // no staloading at run-time
#define
ATS_EXTERN_PREFIX "ats2js_worker_" // prefix for external names

(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)
//
abstype
chmsg_type(a:t@ype+)
//
typedef
chmsg(a:t0p) = chmsg_type(a)
//
(* ****** ****** *)
//
abstype chanpos()
abstype channeg()
//
(* ****** ****** *)
//
typedef
chpcont0() = cfun1(chanpos(), void)
typedef
chpcont1(a:t0p) = cfun2(chanpos(), a, void)
//
(* ****** ****** *)
//
typedef
chncont0() = cfun1(channeg(), void)
typedef
chncont1(a:t0p) = cfun2(channeg(), a, void)
//
(* ****** ****** *)
//
fun{a:t0p}
chmsg_parse(chmsg(INV(a))): (a)
//
(* ****** ****** *)

fun
chanpos0_close(chanpos()): void = "mac#%"

(* ****** ****** *)
//
fun
chanpos0_send
  {a:t0p}
(
  chanpos(), x0: a, k0: chpcont0()
) : void = "mac#%" // end-of-fun
//
fun
chanpos0_recv
  {a:t0p}
  (chanpos(), k0: chpcont1(chmsg(a))): void = "mac#%"
//
(* ****** ****** *)
//
fun
channeg0_new_file
  (filename: string): channeg() = "mac#%"
//
fun
channeg0_close(channeg((*nil*))): void = "mac#%"
//
(* ****** ****** *)
//
fun
channeg0_recv
  {a:t0p}
(
  channeg(), x0: a, k0: chncont0()
) : void = "mac#%" // end-of-fun
//
fun
channeg0_send
  {a:t0p}
  (channeg(), k0: chncont1(chmsg(a))): void = "mac#%"
//
(* ****** ****** *)
//
fun
{a:t0p}
{b:t0p}
rpc_server
  (chanpos(), fopr: (a) -<cloref1> b): void = "mac#%"
//
fun
{a:t0p}
{b:t0p}
rpc_server_cont
  (chanpos(), fopr: (a) -<cloref1> b): void = "mac#%"
//
(* ****** ****** *)
//
fun
{a:t0p}
{b:t0p}
rpc_client
  (channeg(), a, (b) -<cloref1> void): void = "mac#%"
//
(* ****** ****** *)
//
abstype chsnd(a:vt@ype)
abstype chrcv(a:vt@ype)
//
abstype chnil
abstype chcons(a:type, ss:type)
//
stadef :: = chcons
//
(* ****** ****** *)
//
(*
abstype ssnot(ss:type)
*)
//
abstype ssconj(ss:type)
abstype ssdisj(ss:type)
//
abstype ssdisj_nil and ssconj_nil
//
(* ****** ****** *)

abstype ssrepeat0(ss:type)
abstype ssrepeat1(ss:type)

(* ****** ****** *)

absvtype chanpos(ss:type)
absvtype channeg(ss:type)

(* ****** ****** *)
//
typedef
chpcont0(ss:type) = cfun1(chanpos(ss), void)
typedef
chpcont1(ss:type, a:t0p) = cfun2(chanpos(ss), a, void)
//
typedef
chncont0(ss:type) = cfun1(channeg(ss), void)
typedef
chncont1(ss:type, a:t0p) = cfun2(channeg(ss), a, void)
//
(* ****** ****** *)
//
fun
chanpos1_send
  {a:t0p}{ss:type}
(
  chanpos(chsnd(a)::ss), x0: a, k0: chpcont0(ss)
) : void = "mac#%" // end-of-fun
//
fun
chanpos1_recv
  {a:t0p}{ss:type}
  (chanpos(chrcv(a)::ss), k0: chpcont1(ss, chmsg(a))): void = "mac#%"
//
(* ****** ****** *)
//
fun
channeg1_recv
  {a:t0p}{ss:type}
(
  channeg(chrcv(a)::ss), x0: a, k0: chncont0(ss)
) : void = "mac#%" // end-of-fun
//
fun
channeg1_send
  {a:t0p}{ss:type}
  (channeg(chsnd(a)::ss), k0: chncont1(ss, chmsg(a))): void = "mac#%"
//
(* ****** ****** *)
//
fun chanpos1_close(chanpos(chnil)): void = "mac#%"
fun channeg1_close(channeg(chnil)): void = "mac#%"
//
(* ****** ****** *)

(* end of [channel.sats] *)
