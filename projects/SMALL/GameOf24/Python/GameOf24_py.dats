//
// Implementing Game-of-24
//

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "GameOf24_py_dynload"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PY}/basics_py.sats"
//
staload
"{$LIBATSCC2PY}/SATS/integer.sats"
staload
"{$LIBATSCC2PY}/SATS/float.sats"
staload
"{$LIBATSCC2PY}/SATS/string.sats"
staload
"{$LIBATSCC2PY}/SATS/filebas.sats"
//
(* ****** ****** *)

staload "./GameOf24_py.sats"

(* ****** ****** *)

local

datatype
card_node =
  | CARDint of (int)
  | CARDadd of (card, card)
  | CARDsub of (card, card)
  | CARDmul of (card, card)
  | CARDdiv of (card, card)
where
card = '{
//
card_val= double, card_node= card_node
//
} (* end of [card] *)

assume card_type = card

(* ****** ****** *)

in (* in of [local] *)

(* ****** ****** *)

implement
card_get_val (c) = c.card_val

(* ****** ****** *)

implement
card_make_int (v) = '{
  card_val= int2double (v), card_node= CARDint (v)
} // end of [card_make_int]

(* ****** ****** *)

implement
add_card_card
  (c1, c2) = let
//
val v = c1.card_val + c2.card_val
//
in '{
//
card_val= v, card_node= CARDadd (c1, c2)
//
} end // end of [add_card_card]

(* ****** ****** *)

implement
sub_card_card
  (c1, c2) = let
//
val v = c1.card_val - c2.card_val
//
in '{
//
card_val= v, card_node= CARDsub (c1, c2)
//
} end // end of [sub_card_card]

(* ****** ****** *)

implement
mul_card_card
  (c1, c2) = let
//
val v = c1.card_val * c2.card_val
//
in '{
//
card_val= v, card_node= CARDmul (c1, c2)
//
} end // end of [mul_card_card]

(* ****** ****** *)

implement
div_card_card
  (c1, c2) = let
//
val v = c1.card_val / c2.card_val
//
in '{
//
card_val= v, card_node= CARDdiv (c1, c2)
//
} end // end of [div_card_card]

(* ****** ****** *)

implement
fprint_card
  (out, c0) = let
in
//
case+ c0.card_node of
| CARDint (v) => fprint! (out, "CARDint(", v, ")")
| CARDadd (c1, c2) => fprint! (out, "CARDadd(", c1, ", ", c2, ")")
| CARDsub (c1, c2) => fprint! (out, "CARDsub(", c1, ", ", c2, ")")
| CARDmul (c1, c2) => fprint! (out, "CARDmul(", c1, ", ", c2, ")")
| CARDdiv (c1, c2) => fprint! (out, "CARDdiv(", c1, ", ", c2, ")")
//
end // end of [fprint_card]

(* ****** ****** *)

implement
fpprint_card
  (out, c0) = let
//
overload fprint with fpprint_card of 10
//
in
//
case+ c0.card_node of
| CARDint (v) => fprint! (out, v)
| CARDadd (c1, c2) => fprint! (out, "(", c1, " + ", c2, ")")
| CARDsub (c1, c2) => fprint! (out, "(", c1, " - ", c2, ")")
| CARDmul (c1, c2) => fprint! (out, "(", c1, " * ", c2, ")")
| CARDdiv (c1, c2) => fprint! (out, "(", c1, " / ", c2, ")")
//
end // end of [fpprint_card]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

#define EPSILON 0.1

in (* in-of-local *)

implement
fpprint_cardlst
  (out, cs) = let
//
fun fprone
(
  out: PYfile, c: card
) : void = let
  val v = card_get_val (c)
in
  fpprint_card (out, c);
  fprint_string (out, " = ");
  fprint_int (out, g0f2i(v+EPSILON))
end // end of [fprone
//
in
//
case+ cs of
| list_nil () => ()
| list_cons (c, cs) =>
  (
    fprone (out, c); fpprint_cardlst (out, cs)
  ) (* end of [list_cons] *)
//
end // end of [fpprint_cardlst]

end // end of [local]

(* ****** ****** *)
//
extern
fun main0_py (): void = "mac#GameOf24_py_main0_py"
//
implement
main0_py () =
{
//
val n1 = 3
val n1 = 3
and n2 = 3
and n3 = 8
and n4 = 8
val out = stdout
val res = play24 (n1, n2, n3, n4)
val () = fprintln! (out, "play24(", n1, ", ", n2, ", ", n3, ", ", n4, "):")
val () = (fpprint_cardlst (out, res); fprint_newline (out))
//
} (* end of [main0_py] *)
//
(* ****** ****** *)

%{^
import sys
######
from basics_cats import *
from integer_cats import *
from float_cats import *
from string_cats import *
from filebas_cats import *
######
sys.setrecursionlimit(1000000)
%} // end of [%{^]

(* ****** ****** *)

%{$
######
GameOf24_py_dynload();
GameOf24_py_main0_py();
######
%} // end of [%{$]

(* ****** ****** *)

(* end of [GameOf24_py.dats] *)
