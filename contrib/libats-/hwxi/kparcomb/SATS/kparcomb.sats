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
kparser_type(a:t@ype) = ptr
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
{b:t@ype}
kparser_seq1wth
(
  kparser(a), cfun1(a, b)
) : kparser(b) // end-of-fun
//
fun
{a1
,a2:t@ype
}{b:t@ype}
kparser_seq2wth
(
  kparser(a1)
, kparser(a2), cfun2(a1, a2, b)
) : kparser(b) // end-of-fun
//
fun
{a1
,a2
,a3:t@ype
}{b:t@ype}
kparser_seq3wth
(
  kparser(a1)
, kparser(a2)
, kparser(a3), cfun3(a1, a2, a3, b)
) : kparser(b) // end-of-fun
//
(* ****** ****** *)
//
fun
{a:t@ype}
kparser_alter
  (kparser(a), kparser(a)): kparser(a)
//
(* ****** ****** *)
//
fun
{a:t@ype}
kparser_repeat0(kparser(a)): kparser(List0(a))
fun
{a:t@ype}
kparser_repeat1(kparser(a)): kparser(List1(a))
//
(* ****** ****** *)

(* end of [kparcomb.sats] *)
