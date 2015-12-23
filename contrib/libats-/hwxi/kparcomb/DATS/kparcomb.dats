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

staload "./../SATS/kparcomb.sats"

(* ****** ****** *)
//
abstype
parinp_type = ptr
//
typedef parinp = parinp_type
//
(* ****** ****** *)

exception ParFailExn of ((*void*))

(* ****** ****** *)
//
typedef
parinp_nullify
  (a:t@ype) =
  (parinp, cfun2(parinp, a, void)) -> void
//
(* ****** ****** *)
//
extern
castfn
kparser_encode
  {a:t@ype}(parinp_nullify(a)): kparser(a)
//
extern
castfn
kparser_decode{a:t@ype}(kparser(a)): parinp_nullify(a)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
kparser_fail() = 
kparser_encode
  (lam(inp, kont) => $raise ParFailExn())
//
implement
{a}(*tmp*)
kparser_just(x) = 
  kparser_encode(lam(inp, kont) => kont(inp, x))
//
(* ****** ****** *)

implement
{a}(*tmp*)
kparser_satisfy
  (kpar, test) = let
//
val kpar = kparser_decode(kpar)
//
in
//
kparser_encode(
//
lam(inp, kont) =>
kpar
( inp
, lam(inp, x) =>
  if test(x) then kont(inp, x) else $raise ParFailExn()
)
//
) (* kparser_encode *)
//
end // end of [kparser_satisfy]

(* ****** ****** *)

implement
{a}{b}
kparser_seq1wth
  (kp, fopr) = let
//
val kp = kparser_decode(kp)
//
in
//
kparser_encode(
//
lam(inp, kont) => kp(inp, lam(inp, x) => kont(inp, fopr(x)))
//
) (* kparser_encode *)
//
end // end of [kparser_seq1wth]

(* ****** ****** *)

implement
{a1,a2}{b}
kparser_seq2wth
  (kp1, kp2, fopr) = let
//
val kp1 = kparser_decode(kp1)
val kp2 = kparser_decode(kp2)
//
in
//
kparser_encode(
//
lam(inp, kont) =>
kp1
( inp
, lam(inp, x1) =>
  kp2(inp, lam(inp, x2) => kont(inp, fopr(x1, x2)))
)
//
) (* kparser_encode *)
//
end // end of [kparser_seq2wth]

(* ****** ****** *)

implement
{a1,a2,a3}{b}
kparser_seq3wth
  (kp1, kp2, kp3, fopr) = let
//
val kp1 = kparser_decode(kp1)
val kp2 = kparser_decode(kp2)
val kp3 = kparser_decode(kp3)
//
in
//
kparser_encode(
//
lam(inp, kont) =>
kp1
( inp
, lam(inp, x1) =>
  kp2
  ( inp
  , lam(inp, x2) =>
    kp3(inp, lam(inp, x3) => kont(inp, fopr(x1, x2, x3)))
  )
)
//
) (* kparser_encode *)
//
end // end of [kparser_seq3wth]

(* ****** ****** *)

implement
{a}(*tmp*)
kparser_alter
  (kp1, kp2) = let
//
val kp1 = kparser_decode(kp1)
val kp2 = kparser_decode(kp2)
//
in
//
kparser_encode(
//
lam(inp, kont) =>
  try kp1(inp, kont) with ~ParFailExn() => kp2(inp, kont)
//
) (* kparser_encode *)
//
end // end of [kparser_alter]

(* ****** ****** *)

implement
{a}(*tmp*)
kparser_repeat0
  (kpar) = let
//
val kpar = kparser_decode(kpar)
//
fun
aux
( inp: parinp
, kont: cfun2 (parinp, List0(a), void)
) : void = let
//
in
//
try
kpar
( inp
, lam(inp, x) =>
  aux(inp, lam(inp, xs) => kont(inp, cons(x, xs)))
)
with ~ParFailExn() => kont(inp, nil())
//
end // end of [aux]
//
in
  kparser_encode(lam(inp, kont) => aux(inp, kont))
end // end of [kparser_repeat0]

(* ****** ****** *)

implement
{a}(*tmp*)
kparser_repeat1
  (kpar) = let
(*
val () = println! ("kparser_repeat1")
*)
in
//
kparser_seq2wth<a,List0(a)><List1(a)>
  (kpar, kparser_repeat0<a>(kpar), lam(x, xs) => cons(x, xs))
//
end // end of [kparser_repeat1]

(* ****** ****** *)

(* end of [kparcomb.dats] *)
