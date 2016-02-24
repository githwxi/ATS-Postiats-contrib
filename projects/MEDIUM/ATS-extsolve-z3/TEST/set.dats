(**
  Testing sets
*)

datasort set= (** *)

stacst empty_set: () -> set

stacst set_count: (set) -> int

extern
praxi
empty_set_is_empty(): [set_count(empty_set()) == 0] unit_p

abstype MySet(s:set)

extern
fun
make_empty(): MySet(empty_set())

extern
fun
require_empty {xs: set | set_count(xs) == 0} (MySet(xs)): void

local
  prval _ = $solver_assert(empty_set_is_empty)
in
  val s = make_empty()
  val () = require_empty(s)
end