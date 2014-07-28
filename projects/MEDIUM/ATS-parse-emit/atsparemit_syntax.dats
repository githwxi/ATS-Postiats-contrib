(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"

(* ****** ****** *)

infix ++
overload ++ with location_combine

(* ****** ****** *)

implement
synent_decode2{a}
  (x) = let
  val res = synent_decode{a}(x)
  prval ((*void*)) = topize (x) in res
end // end of [synent_decode2]

(* ****** ****** *)

implement
synent_null{a} () = $UN.cast{a}(the_null_ptr)

(* ****** ****** *)
//
implement
synent_is_null (ent) = iseqz ($UN.cast2ptr(ent))
implement
synent_isnot_null (ent) = isneqz ($UN.cast2ptr(ent))
//
(* ****** ****** *)
//
implement
i0de_make_sym
  (loc, sym) = '{ i0de_loc= loc, i0de_sym= sym }
//
implement
i0de_make_string
  (loc, name) = let
  val sym = symbol_make (name) in i0de_make_sym (loc, sym)
end // end of [i0de_make_string]
//
(* ****** ****** *)
//
fun
s0exp_make_node
  (loc, node) = '{ s0exp_loc=loc, s0exp_node=node }
//
(* ****** ****** *)
//
implement
s0exp_ide (loc, id) =
  s0exp_make_node (loc, S0Eide (id.i0de_sym))
//
implement
s0exp_list (loc, s0es) = s0exp_make_node (loc, S0Elist (s0es))
//
implement
s0exp_appid (loc, id, s0es) =
  s0exp_make_node (loc, S0Eappid (id.i0de_sym, s0es))
//
(* ****** ****** *)

implement
f0arg_make
  (s0e, id) = let
//
val loc =
  s0e.s0exp_loc ++ id.i0de_loc
//
in '{
  f0arg_loc= loc
, f0arg_node= F0ARG (id.i0de_sym, s0e)
} end // end of [f0arg_make]

(* ****** ****** *)

implement
f0marg_make
(
  tok1, f0as, tok2
) = let
  val loc = tok1.token_loc ++ tok2.token_loc
in '{
  f0marg_loc= loc, f0marg_node = f0as
} end // end of [f0marg_make]

(* ****** ****** *)

implement
f0decl_make
(
  res, id, marg
) = let
//
val loc =
  res.s0exp_loc ++ marg.f0marg_loc
//
in '{
  f0decl_loc= loc
, f0decl_node= F0DECL (id.i0de_sym, marg, res)
} end // end of [f0decl_make]

(* ****** ****** *)

(* end of [atsparemit_syntax.dats] *)
