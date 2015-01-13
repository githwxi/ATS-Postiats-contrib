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
staload
UN = "prelude/SATS/unsafe.sats"
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
extern
fun{t:t0p}
pstate_get_token(st: &pstate(t) >> _): t
//
overload .tget with pstate_get_token
//
(* ****** ****** *)
//
extern
fun
pstate_update{t:t0p}
(
  st: &pstate(t) >> _, ts: ptr, ncur: int
) : void // end-of-function
//
implement
pstate_update
  {t}(st, ts, ncur) =
(
  st.tstream := $UN.cast{stream(t)}(ts); st.ncur := ncur
) (* end of [pstate_update] *)
//
(* ****** ****** *)
//
assume
parser_type
  (t:t@ype, a:t@ype) =
  (&pstate(t) >> _) -<cloref1> (a)
//
(* ****** ****** *)

exception
ParFailExn of (ptr(*tstream*), int(*ncur*))

(* ****** ****** *)

implement
{a}
any_parser
  () = lam (st) => st.tget()
//
(* ****** ****** *)
//
implement
{t}{a}
ret_parser (x) = lam (st) => (x)
//
(* ****** ****** *)

implement
{t}{a}
alt_parser_parser
  (p1, p2) = (
//
lam (st) => let
//
val stp = addr@st
typedef pstate = pstate(t)
//
in
//
try let
val
(pf, fpf | stp) =
$UN.ptr_vtake{pstate}(stp)
val res = p1 (st)
prval ((*void*)) = fpf (pf)
//
in
  res
end with
| ~ParFailExn
    (ts, ncur) => let
    val
    (pf, fpf | stp) =
    $UN.ptr_vtake{pstate}(stp)
    val () = pstate_update (!stp, ts, ncur)
    val res = p2 (st)
    prval ((*void*)) = fpf (pf)
  in
    res
  end // end of [ParFailExn]
//
end // end of [lam]
//
) (* end of [alt_parser_parser] *)

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
end // end of [seq2wth_parser_cloref]
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
implement
{t}{a1,a2,a3,a4,b}
seq4wth_parser_cloref
(
  p1, p2, p3, p4, f
) =
lam (st) => let
  val x1 = p1(st)
  val x2 = p2(st)
  val x3 = p3(st)
  val x4 = p4(st) in f (x1, x2, x3, x4)
end // end of [seq4wth_parser_cloref]
//
(* ****** ****** *)

(* end of [parcomb.dats] *)
