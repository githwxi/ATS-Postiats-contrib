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

(*
staload "./../SATS/kparcomb.sats"
*)

(* ****** ****** *)
//
abstype
parinp_type = ptr
abstype
parout_type = ptr
//
typedef parinp = parinp_type
typedef parout = parout_type
//
(* ****** ****** *)
//
typedef
parcont(a:t@ype) =
  (a, parinp) -<cloref1> parout
//
(* ****** ****** *)

exception ParFailExn of ((*void*))

(* ****** ****** *)
//
typedef
parinp_nullify
  (a:t@ype) =
  (parinp, parcont(a)) -<cloref1> parout
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
kparser_decode
  {a:t@ype}(kp: kparser(a)): parinp_nullify(a)
//
(* ****** ****** *)
//
extern
fun{}
parcont_fail(inp: parinp): parout
//
implement
{}(*tmp*)
parcont_fail(inp) = $raise ParFailExn()
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
kparser_fail() = 
kparser_encode
  (lam(inp, kont) => parcont_fail(inp))
//
implement
{a}(*tmp*)
kparser_just(x) = 
  kparser_encode(lam(inp, kont) => kont(x, inp))
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
, lam(x, inp) =>
  if test(x) then kont(x, inp) else parcont_fail(inp)
)
//
) (* kparser_encode *)
//
end // end of [kparser_satisfy]

(* ****** ****** *)

implement
{a1,a2}
kparser_join2
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
kp1
( inp
, lam(x1, inp) =>
  kp2(inp, lam(x2, inp) => kont(@(x1, x2), inp))
)
//
) (* kparser_encode *)
//
end // end of [kparser_join2]

(* ****** ****** *)

implement
{a1,a2,a3}
kparser_join3
  (kp1, kp2, kp3) = let
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
, lam(x1, inp) =>
  kp2
  ( inp
  , lam(x2, inp) =>
    kp3(inp, lam(x3, inp) => kont(@(x1, x2, x3), inp))
  )
)
//
) (* kparser_encode *)
//
end // end of [kparser_join3]

(* ****** ****** *)

implement
{a}{b}
kparser_fmap
  (kp, fopr) = let
//
val kp = kparser_decode(kp)
//
in
//
kparser_encode(
//
lam(inp, kont) => kp(inp, lam(x, inp) => kont(fopr(x), inp))
//
) (* kparser_encode *)
//
end // end of [kparser_fmap]

(* ****** ****** *)

implement
{a1,a2}{b}
kparser_fmap2
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
, lam(x1, inp) =>
  kp2(inp, lam(x2, inp) => kont(fopr(x1, x2), inp))
)
//
) (* kparser_encode *)
//
end // end of [kparser_fmap2]

(* ****** ****** *)

implement
{a1,a2,a3}{b}
kparser_fmap3
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
, lam(x1, inp) =>
  kp2
  ( inp
  , lam(x2, inp) =>
    kp3(inp, lam(x3, inp) => kont(fopr(x1, x2, x3), inp))
  )
)
//
) (* kparser_encode *)
//
end // end of [kparser_fmap3]

(* ****** ****** *)

implement
{a1,a2}
kparser_first
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
kp1
( inp
, lam(x1, inp) =>
  kp2(inp, lam(x2, inp) => kont(x1, inp))
)
//
) (* kparser_encode *)
//
end // end of [kparser_first]

(* ****** ****** *)

implement
{a1,a2}
kparser_second
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
kp1
( inp
, lam(x1, inp) =>
  kp2(inp, lam(x2, inp) => kont(x2, inp))
)
//
) (* kparser_encode *)
//
end // end of [kparser_second]

(* ****** ****** *)

implement
{a}(*tmp*)
kparser_orelse
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
end // end of [kparser_orelse]

(* ****** ****** *)

implement
{a}(*tmp*)
kparser_cloref
  (fkp) = let
(*
val () =
println! ("kparser_cloref")
*)
in
//
kparser_encode(
//
lam(inp, kont) =>
  let val kp = kparser_decode(fkp()) in kp(inp, kont) end
//
) (* kparser_encode *)
//
end // end of [kparser_cloref]

(* ****** ****** *)

implement
{a}(*tmp*)
kparser_repeat0
  (kpar) = let
//
val kpar = kparser_decode(kpar)
//
fun
kaux
( inp: parinp, kont: parcont(List0(a))
) : parout = let
//
in
//
try
kpar
( inp
, lam(x, inp) =>
  kaux
  ( inp
  , lam(xs, inp) => kont(cons(x, xs), inp)
  )
)
with ~ParFailExn() => kont(list_nil(), inp)
//
end // end of [aux]
//
in
  kparser_encode(lam(inp, kont) => kaux(inp, kont))
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
kparser_fmap2<a,List0(a)><List1(a)>
  (kpar, kparser_repeat0<a>(kpar), lam(x, xs) => cons(x, xs))
//
end // end of [kparser_repeat1]

(* ****** ****** *)

(*
//
implement{a}
kparser_repeat0(kp) =
kparser_orelse(
  kparser_cloref<List0(a)>(lam() => kparser_repeat1<a>(kp)), kparser_just<List0(a)>(list_nil())
) (* kparser_orelse *)
)
//
*)

(* ****** ****** *)

implement
{}(*tmp*)
kparser_alpha
  ((*void*)) = let
  val kp = kparser_char<>()
in
  kparser_satisfy<char>(kp, lam(c) => isalpha(c))
end // end of [kparser_alpha]

(* ****** ****** *)

implement
{}(*tmp*)
kparser_alnum
  ((*void*)) = let
  val kp = kparser_char<>()
in
  kparser_satisfy<char>(kp, lam(c) => isalnum(c))
end // end of [kparser_alnum]

(* ****** ****** *)

implement
{}(*tmp*)
kparser_digit
  ((*void*)) = let
  val kp = kparser_char<>()
in
  kparser_satisfy<char>(kp, lam(c) => isdigit(c))
end // end of [kparser_digit]

(* ****** ****** *)

implement
{}(*tmp*)
kparser_litchar
  (c0) = let
  val kp = kparser_char<>()
in
  kparser_satisfy<char>(kp, lam(c1) => c0 = c1)
end // end of [kparser_litchar]

(* ****** ****** *)

implement
{}(*tmp*)
kparser_literal
  (lit) = let
//
val
[n:int]
lit = g1ofg0(lit)
//
val
ncs = sz2i(string_length(lit))
//
fun
loop(i: natLte(n)): kparser(int) =
if i < ncs
  then kparser_litchar(lit[i]) >> loop(i+1) else kparser_just(0)
// end of [if]
//
in
  loop(0)
end // end of [kparser_literal]

(* ****** ****** *)

(* end of [kparcomb.dats] *)
