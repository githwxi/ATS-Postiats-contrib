(*
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
** OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
** NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
** HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
** WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
** FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
** OTHER DEALINGS IN THE SOFTWARE.
*)

(* ****** ****** *)

(*
** A parsing combinator library
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: December, 2015
//
(* ****** ****** *)
//
abstype
kparser_type(a:t@ype+) = ptr
//
typedef
kparser(a:t@ype) = kparser_type(a)
//
(* ****** ****** *)
//
typedef
cfun1(a:t@ype, b:t@ype) = (a) -<cloref1> b
typedef
cfun2(a1:t@ype, a2:t@ype, b:t@ype) = (a1, a2) -<cloref1> b
typedef
cfun3(a1:t@ype, a2:t@ype, a3:t@ype, b:t@ype) = (a1, a2, a3) -<cloref1> b
//
(* ****** ****** *)
//
fun
{a:t@ype}
kparser_fail(): kparser(a)
//
fun
{a:t@ype}
kparser_just(x: a): kparser(a)
//
(* ****** ****** *)

fun
{a:t@ype}
kparser_satisfy
(
  kparser(INV(a)), test: cfun1(a, bool)
) : kparser(a) // end-of-fun

(* ****** ****** *)
//
fun
{a1
,a2:t@ype}
kparser_join2
(
  kparser(INV(a1)), kparser(INV(a2))
) : kparser(@(a1, a2)) // end-of-fun
//
(* ****** ****** *)
//
fun
{a1
,a2
,a3:t@ype}
kparser_join3
(
  kparser(INV(a1)), kparser(INV(a2)), kparser(INV(a3))
) : kparser(@(a1, a2, a3)) // end-of-fun
//
(* ****** ****** *)
//
fun
{a:t@ype}
{b:t@ype}
kparser_fmap
  (kparser(INV(a)), fopr: cfun1(a, b)) : kparser(b)
//
fun
{a1
,a2:t@ype
}{b:t@ype}
kparser_fmap2
(
  kparser(INV(a1)), kparser(INV(a2)), fopr: cfun2(a1, a2, b)
) : kparser(b) // end-of-fun
//
(* ****** ****** *)
//
fun{
a1,a2:t@ype
} kparser_first
  (kp1: kparser(INV(a1)), kp2: kparser(INV(a2))): kparser(a1)
//
fun{
a1,a2:t@ype
} kparser_second
  (kp1: kparser(INV(a1)), kp2: kparser(INV(a2))): kparser(a2)
//
overload << with kparser_first
overload >> with kparser_second
//
(* ****** ****** *)
//
fun
{a1
,a2
,a3:t@ype
}{b:t@ype}
kparser_fmap3
(
  kp1: kparser(INV(a1))
, kp2: kparser(INV(a2))
, kp3: kparser(INV(a3))
, fopr: cfun3(a1, a2, a3, b)
) : kparser(b) // end-of-fun
//
(* ****** ****** *)
//
fun{
a1,a2,a3:t@ype
} kparser_middle
(
  kp1: kparser(INV(a1))
, kp2: kparser(INV(a2))
, kp3: kparser(INV(a3))
) : kparser(a2) // end-of-fun
//
(* ****** ****** *)
//
fun
{a:t@ype}
kparser_orelse
  (kp1: kparser(INV(a)), kp2: kparser(a)): kparser(a)
//
(* ****** ****** *)
//
fun
{a:t@ype}
kparser_cloref
  (((*void*)) -<cloref1> kparser(a)): kparser(a)
//
(* ****** ****** *)
//
fun
{a:t@ype}
kparser_repeat0(kp: kparser(INV(a))): kparser(List0(a))
fun
{a:t@ype}
kparser_repeat1(kp: kparser(INV(a))): kparser(List1(a))
//
(* ****** ****** *)
//
// HX-2015-12
// For parsing sequences of chars
//
(* ****** ****** *)
//
// HX-2015-12:
// This one remains abstract
//
fun{}
kparser_char((*void*)): kparser(char)
//
(* ****** ****** *)
//
fun{}
kparser_alpha((*void*)): kparser(char)
fun{}
kparser_alnum((*void*)): kparser(char)
fun{}
kparser_digit((*void*)): kparser(char)
//
(* ****** ****** *)
//
fun{}
kparser_litchar(c0: char): kparser(char)
//
(* ****** ****** *)
//
fun{}
kparser_literal(lit: string): kparser(int)
//
(* ****** ****** *)

(* end of [kparcomb.sats] *)
