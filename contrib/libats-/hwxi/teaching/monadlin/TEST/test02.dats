(*
** PlayGame
** from a Haskell source
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
#include
"./../DATS/monadlin_state.dats"
//
(* ****** ****** *)
//
typedef GameValue = int
typedef GameState = bool
//
datavtype state =
  | STATE of (GameState, GameValue)
//
(* ****** ****** *)

assume state_vtype = state

(* ****** ****** *)

implement
{}(*tmp*)
state_create() = STATE(false, 0)

(* ****** ****** *)

implement
{}(*tmp*)
state_destroy(st) = { val-~STATE _ = st }

(* ****** ****** *)
//
extern
fun
PlayChar(c0: char): M(unit)
//
extern
fun
PlayGame(cs: list0(char)): M(unit)
//
(* ****** ****** *)
//
implement
PlayChar
(c0) = let
//
reassume stmonad_vtype
//
in
//
case c0 of
| 'a' =>
  (
  llam (s) =>
    let val+@STATE(b, v) = s in
      if(b)then(v := v+1); fold@(s); (s, unit()) end
  // end of [llam]
  )
| 'b' =>
  (
  llam (s) =>
    let val+@STATE(b, v) = s in
      if(b)then(v := v-1); fold@(s); (s, unit()) end
  // end of [llam]
  )
| 'c' =>
  (
  llam (s) =>
    let val+@STATE(b, _) = s in b := not(b); fold@(s); (s, unit()) end
  // end of [llam]
  )
| _(*rest*) => llam(s) => (s, unit())
//
end // end of [PlayChar]
//
(* ****** ****** *)
//
implement
PlayGame(cs) = let
//
reassume stmonad_vtype
//
fun
aux
(
 s: state, cs: list0(char)
) : (state, unit) =
//
case+ cs of
| list0_nil() =>
  (s, unit())
| list0_cons(c, cs) =>
  let val (s, _) = PlayChar(c)(s) in aux(s, cs) end
//
in
  llam (s) => aux(s, cs)
end // end of [PlayGame]

(* ****** ****** *)

implement
main0() =
{
//
val cs =
$list{char}
  ('c', 'a', 'b', 'a', 'c', 'd', 'a', 'b')
//
val cs = g0ofg1_list(cs)
//
val s0 = state_create((*void*))
val (sz, _) = stmonad_runState(PlayGame(cs), s0)
//
val+~STATE(b, v) = sz
//
val () = println! ("The final state = (", b, ", ", v, ")")
//
val () = list_vt_free($UN.castvwtp0{List0_vt(char)}(cs))
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [test01.dats] *)
