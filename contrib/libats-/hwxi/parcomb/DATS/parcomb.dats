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
// Start time: January, 2015
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../SATS/parcomb.sats"

(* ****** ****** *)

typedef
pstate(t:t0p) = @{
//
tstream= stream(t), ncur= int, nmax= int
//
} (* end of [pstate] *)

(* ****** ****** *)
//
assume
parser_type
(
  t:t@ype, a:t@ype
) = (&pstate(t) >> _) -<cloref1> (a)
//
(* ****** ****** *)

implement
{t}{a1,a2}
seq_parser_parser
  (p1, p2) = (
//
lam (st) => let
  val x1 = p1 (st)
  val x2 = p2 (st) in @(x1, x2)
end // end of [let]
//
) (* end of [seq_parser_parser] *)

(* ****** ****** *)
//
implement
{t}{a,b}
seq1wth_parser_cloref
  (p, f) =
  lam (st) =>
  let val x = p(st) in f (x) end
//
implement
{t}{a1,a2,b}
seq2wth_parser_cloref
  (p1, p2, f) =
lam (st) => let
  val x1 = p1(st)
  val x2 = p2(st) in f (x1, x2)
end // en of [seq2wth_parser_cloref]
//
implement
{t}{a1,a2,a3,b}
seq3wth_parser_cloref
(
  p1, p2, p3, f
) =
lam (st) => let
  val x1 = p1(st)
  val x2 = p2(st)
  val x3 = p3(st) in f (x1, x2, x3)
end // end of [seq3wth_parser_cloref]
//
(* ****** ****** *)

(* end of [parcomb.dats] *)
